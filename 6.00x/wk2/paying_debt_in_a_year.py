def pay_debt_in_a_year(initial_balance, interest_rate):
    """ Returns the minimum amount that you should pay every month to have
    the debt payed off at the end of the year"""

    balance = initial_balance
    min_payment = 0

    monthly_interest_rate = interest_rate / 12.0

    while balance > 0:

        min_payment += 10
        balance = initial_balance
        interest = 0 # no interest at beginning

        for month in range(1,13):
            unpaid_balance = balance - min_payment
            interest = monthly_interest_rate * unpaid_balance
            balance = unpaid_balance + interest

        print balance

    print min_payment


balance = 3926
annualInterestRate = 0.2
pay_debt_in_a_year(balance, annualInterestRate)
