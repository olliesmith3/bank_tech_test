Requirements

You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
Deposits, withdrawal.
Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).
Acceptance criteria

Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see

date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00

Plan:

class: 
       account: knows the account holders name
                knows the account value
                knows the transaction history (array of transaction objects)
       transaction: knows the date
                    knows the amount  
                    knows the balance after that transaction (is this necessary?) 
       account_manager: can create an account (takes name and starting balance)
                        can make a deposit (time will be current timestamp)
                        can make a withdrawal
                        can print a statement to the command line (which shows the last three transactions formatted as above)