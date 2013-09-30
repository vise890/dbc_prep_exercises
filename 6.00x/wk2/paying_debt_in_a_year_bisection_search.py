def debt_at_year_end(initial_balance, interest_rate):
    balance = initial_balance
    monthly_interest_rate = interest_rate / 12.0
    interest = 0

    for month in range(1,13):
        interest = monthly_interest_rate * balance
        balance += interest

    return balance

def pay_debt_in_a_year(initial_balance, interest_rate):
    """ Returns the minimum amount that you should pay every month to have
    the debt payed off at the end of the year"""

    balance = initial_balance

    min_payment_lower_bound = balance / 12
    min_payment_upper_bound = debt_at_year_end(balance, interest_rate)

    monthly_interest_rate = interest_rate / 12.0

    while abs(balance) > 0.1:

        min_payment = (min_payment_lower_bound + min_payment_upper_bound) / 2.0

        balance = initial_balance
        interest = 0 # no interest at beginning

        for month in range(1,13):
            unpaid_balance = balance - min_payment
            interest = monthly_interest_rate * unpaid_balance
            balance = unpaid_balance + interest


        if balance < 0:
            min_payment_upper_bound = min_payment
        else:
            min_payment_lower_bound = min_payment

    print round(min_payment, 2)


balance = 999999
annualInterestRate = 0.18
pay_debt_in_a_year(balance, annualInterestRate)
