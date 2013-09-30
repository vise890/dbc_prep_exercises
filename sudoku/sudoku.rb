class Impossible < StandardError
end

class SudokuBoard

  attr_accessor :board

  def initialize(board)
    raise ArgumentError.new('Not enough rows') unless board.size == 9
    board.each_with_index do |row, i|
      raise ArgumentError.new("Row #{i} is too short") unless row.size == 9
    end

    @board = board

    self.each_cell do |i, j, cell|
      unless ((1..9).include? cell) || (cell == :_)
        raise ArgumentError.new("Cell #{i},#{j} is invalid (#{cell} not acceptable)")
      end
    end
  end

  # scan the board and fill all the empty cells that can only be one value
  # returns nil,nil,nil if the board is solved
  # returns i,j,candidates if not
  #   where:
  #     i,j : coordinates of the cell with the smallest no. of possible candidates
  #     candidates: the possible candidates for cell i,j
  def scan

    unchanged = false

    until unchanged
      unchanged = true # board is unchanged unless a cell is changed

      min_i = min_j = min_candidates = nil
      min_candidates_size = 10 # bigger than (1..9).size (i.e. the max size of feasible candidates)

      self.each_unknown do |i,j|


        candidates = candidates_for(i,j)

        # debug
        # puts "Candidates for #{i}, #{j}: #{candidates.to_s}"
        # puts "row #{i}: #{row(i)}"
        # puts "col #{j}: #{column(j)}"
        # debug_copy = self.clone
        # debug_copy.board[i][j] = 'X'
        # puts debug_copy.to_s
        # puts
        # puts

        case candidates.size
        when 0 # if there are no candidates for a given cell, the board is overconstrained
          raise Impossible # .. and thus it is impossible
        when 1 # if there is only one candidate, then it must be the value for that cell
          @board[i][j] = candidates.first # so replace the empty cell
          unchanged = false # and mark the board as changed so we can loop again and see if we can go on
        else # otherwise, there's more than 1 candidates
          # we store them for returning
          # but we only do so if we're not gonna loop again
          # and if the set of candidates is the smallest at this board stage
          if unchanged && (candidates.size < min_candidates_size)
            min_candidates_size = candidates.size
            min_i = i
            min_j = j
            min_candidates = candidates
          end
        end
      end
    end

    # return the cell coordinates and the possible candidates
    # this is the minimum set
    return min_i, min_j, min_candidates
  end

  # returns the possible values for cell i,j
  def candidates_for(i, j)
    n = box_for_cell(i, j)
    (1..9).to_a - (row(i) + column(j) + box(n))
  end

  # returns row i as an array (withouth the empty cells)
  # rows are numbered 0-8
  def row(i)
    @board[i].to_a.select { |e| e != :_ }
  end

  # returns column j as an array (without the empty cells)
  # columns are numbered 0-8
  def column(j)
    column = []
    @board.each do |row|
      column << row[j]
    end
    return column.select { |e| e != :_ }
  end

  # returns box n as an array (without the empty cells)
  # boxes are numbered 0-8
  def box(n)

    box_coordinates = {
      0 => { rows: 0..2, columns: 0..2}, # top-left box
      1 => { rows: 0..2, columns: 3..5}, # top-mid box
      2 => { rows: 0..2, columns: 6..8}, # top-right box

      3 => { rows: 3..5, columns: 0..2}, # mid-left box
      4 => { rows: 3..5, columns: 3..5}, # mid-mid box
      5 => { rows: 3..5, columns: 6..8}, # mid-right box

      6 => { rows: 6..8, columns: 0..2}, # bottom-left box
      7 => { rows: 6..8, columns: 3..5}, # bottom-mid box
      8 => { rows: 6..8, columns: 6..8}, # bottom-right box
    }

    box = []
    box_coordinates[n][:rows].each do |i|
      box_coordinates[n][:columns].each do |j|
        box << @board[i][j]
      end
    end

    return box.select { |e| e != :_ }
  end

  # returns the box for the cell with coordinates i,j
  # box number 0-8
  def box_for_cell(i, j)
    case i
    when 0..2
      case j
      when 0..2 then 0
      when 3..5 then 1
      when 6..8 then 2
      end
    when 3..5
      case j
      when 0..2 then 3
      when 3..5 then 4
      when 6..8 then 5
      end
    when 6..8
      case j
      when 0..2 then 6
      when 3..5 then 7
      when 6..8 then 8
      end
    end
  end

  # iterates over each cell of the board
  # calls the passed block with arguments i, j and cell
  #   where:
  #     i,j : coordinates of the current cell
  #     cell : value of the cell
  def each_cell(&block)
    @board.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        yield i, j, cell
      end
    end
  end

  # iterates over each blank (unknown) cell of the board
  # calls passed block with arguments i and j
  #   where
  #     i,j : coordinates of the current cell
  def each_unknown(&block)
    self.each_cell do |i, j, cell|
      yield(i, j) if cell == :_
    end
  end

  # returns true if the board has no empty cells left
  # otherwise returns false
  def solved?
    self.each_cell do |_,_,cell|
      return false if cell == :_
    end
    return true
  end

  # returns a string representation of the board
  def to_s
    str = ''
    @board.each do |row|
      row.each do |cell|
        str += cell.to_s + '  '
      end
      str += "\n"
    end
    str
  end

  def clone
    board_clone = []
    @board.each do |row|
      board_clone << row.clone
    end
    SudokuBoard.new(board_clone)
  end

  def has_duplicates?
    (0..8).each do |k|
      return true unless row(k).uniq.length == row(k).length
      return true unless column(k).uniq.length == column(k).length
      return true unless box(k).uniq.uniq.length == box(k).length
    end
    return false
  end

end

# scans the board to replace all the cells with one possible candidate only;
# then it resorts to brute force to test each candidate for the cell
# with the fewest candidates and scans again.
#   If that leads to the solution, cool. the board is solved
#   If that leads to an impossible board, move to the next guess and try again
def solve(board)
  board = board.clone # make a local copy, we don't want to modify the actual board

  # this is the cell with the fewest possible candidates
  # note that if SudokuBoard#scan solved the board then i = j = candidates = nil
  i, j, candidates = board.scan

  if board.solved? # if the board is solved
    puts board # print it
    return
  else # otherwise, there're still empty cells
    # need to resort to brute force
    # take the cell with the smallest no. of possible candidates
    candidates.each do |candidate| # and try each one of them in turn
      board.board[i][j] = candidate # substitute the cell with a candidate
      begin
        # try to recursevely solve the board with the guessed value in place
        # this will either lead to a valid solution or raise an Impossible exception
        return solve(board)
      rescue Impossible # if the board is impossible..
        next # go to the next guess
      end
    end

    raise Impossible # none of the guesses worked... go back?
  end
end


##############################################################################
####################### TESTING ##############################################
##############################################################################

# represent empty cells with underscore (as a symbol)
_ = :_ # this should probably be somewhere else

# easy-to-copy empty board
SudokuBoard.new(
 [[_,_,_,_,_,_,_,_,_],
  [_,_,_,_,_,_,_,_,_],
  [_,_,_,_,_,_,_,_,_],
  [_,_,_,_,_,_,_,_,_],
  [_,_,_,_,_,_,_,_,_],
  [_,_,_,_,_,_,_,_,_],
  [_,_,_,_,_,_,_,_,_],
  [_,_,_,_,_,_,_,_,_],
  [_,_,_,_,_,_,_,_,_]]
)

# testing puzzles from http://www.puzzles.ca/sudoku_puzzles/
# board 131
board = SudokuBoard.new(
  [[7,_,3,8,_,_,_,_,_],
   [_,2,_,_,_,_,_,1,3],
   [4,_,_,_,_,_,_,_,_],
   [_,_,_,6,8,_,4,_,1],
   [_,_,9,7,_,_,5,_,_],
   [_,_,_,4,_,5,3,_,6],
   [_,_,_,_,_,_,6,_,_],
   [_,_,_,5,_,1,_,_,_],
   [5,8,_,_,6,_,_,_,_]]
)
# '703800000020000013400000000000680401009700500000405306000000600000501000580060000'

puts solve(board)
