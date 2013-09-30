def balance_at_year_end(initial_balance, interest_rate, monthly_payment_rate):
    """ Returns the balance at the end of one year of paying only the minimum"""

    balance = initial_balance
    interest = 0 # no interest at beginning

    monthly_interest_rate = interest_rate / 12.0

    total_paid = 0

    for month in range(1,13):
        min_payment = balance * monthly_payment_rate
        total_paid += min_payment
        unpaid_balance = balance - min_payment
        interest = monthly_interest_rate * unpaid_balance
        balance = unpaid_balance + interest

        print 'Month: ' + str(month)
        print 'Minimum monthly payment: ' + str(round(min_payment, 2))
        print 'Remaining balance: ' + str(round(balance, 2))
        print

    print 'Total paid: ' + str(round(total_paid, 2))
    print 'Remaining balance: ' + str(round(balance, 2))

    return round(balance, 2)

balance_at_year_end(balance, annualInterestRate, monthlyPaymentRate)

