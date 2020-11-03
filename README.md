# Bank Tech Test

## Technologies

       Ruby version = 2.7.0

## Setup 
```
$ git clone https://github.com/olliesmith3/bank_tech_test.git

$ bundle install

$ irb
```
## How to use:

Require the following files in irb:
```
       2.7.0 :001 > require './lib/account.rb'
       2.7.0 :002 > require './lib/transaction.rb'
       2.7.0 :003 > require './lib/account_manager.rb'
```
Create an empty account with the following command:
```
       2.7.0 :004 > account_name = AccountManager.create_account
```
Or to create an account with £1000:
```
       2.7.0 :005 > account_name = AccountManager.create_account(1000.00)
```
To make a deposit of £100: 
```
       2.7.0 :006 > account_name.deposit(100)
```
This also accepts values to the nearest pence e.g. for £100.58:
```
       2.7.0 :007 > account_name.deposit(100.58)
```
Make a withdrawal: 
```
       2.7.0 :008 > account_name.withdraw(100.58)
```
Print a bank statement:
```
       2.7.0 :009 > AccountManager.print_statement(my_account)
```

## Requirements

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
```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
## Plan:
```
classes: 
       account: knows the account value
                knows the transaction history (array of transaction objects)
                can make a deposit (time will be current timestamp)
                can make a withdrawal
       transaction: knows the date
                    knows the amount  
                    knows the balance after that transaction  
       account_manager: can create an account (takes name and starting balance)
                        can print a statement to irb
```

