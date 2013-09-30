class SudokuBoard
  
  attr_reader :board
  def initialize(board)
    raise ArgumentError if board.length != 9
    board.each do |row|
      raise ArgumentError if row.length != 9
    end

    @board = board
  end

  def scan

    unchanged = false
    min_candidates_size = 10
    min_i, min_j, min_candidates = nil

    until unchanged
      unchanged = true
      self.each_unknown do |i, j, _|
        candidates = candidates_for(i, j)

        case candidates.size
        when 0
          raise Impossible
        when 1
          board[i,j] = candidates.first
          unchanged = false
        else
          if unchanged && candidates.size < min_candidates_size
            min_i = i
            min_j = j
            min_candidates = candidates
          end
        end
      end
    end

    return min_i, min_j, min_candidates
  end

  def row(i)
    board[i,:_]
  end

  def column(j)
    board[:_,j]
  end

  def board[](cell_coordinates)
    i, j = cell_coordinates.split(',')
    if i == :_
      # return column j
      column_j = []
      self.each_row do |row|
        column_j << row[j.to_i]
      end
      coulumn_j
    elsif j = :_
      # return row i
      row_i = []
      self.each_column do |column|
        row_i << column[i.to_i
      end
      row_i
    else
      @board[i][j]
    end
  end

  def board[]=(cell_coordinates)
    j, j = cell_coordinates.split(',').map { |coordinate| coordinate.to_i }
    @board[i][j] = 
  end

  def box(n)

  end
  
  def box_for_cell(i,j)

  end

  def each_cell

  end

  def candidates_for

  end
end
