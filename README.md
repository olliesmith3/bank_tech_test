# Bank Tech Test

A short tech test to build a bank app that is run in irb. The focus of this challenge was on professional code quality.

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
       2.7.0 :004 > account_name = Account.new
```
Or to create an account with £1000:
```
       2.7.0 :005 > account_name = Account.new(1000.00)
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
       2.7.0 :009 > account_name.print_statement
```
Print a bank statement with the american style date:
```
       2.7.0 :009 > account_name.print_statement('american date')
```
Print a bank statement with three columns (debit transactions will be shown in brackets):
```
       2.7.0 :009 > account_name.print_statement('three columns')
```       
Print a bank statement with the columns reversed:
```
       2.7.0 :009 > account_name.print_statement('reverse columns')
```
Print a bank statement with all three options selected:
```
       2.7.0 :009 > account_name.print_statement('american date, three columns, reverse columns')
```
## Run the tests
```
       $ rspec
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

#### Additional Feature 1

As a user, I may want to add in a transaction that was missing, by passing it with a date in the past (eg. account.deposit(50, ’03/08/2020’) or whatever date format makes sense for your code).
This should in turn readjust my statement so that the transaction shows in the right place, and the balances are still correct. Does your code currently make this easy to add in? What would need change in your code to make this possible?

First of all this meant I had to change the account class to allow it to be passed a date. I then needed to order the history array based on the date of each transaction. This then highlighted that my balances are incorrect as they are correct for when the transaction was put into the array, not when the transaction was actually made. I removed the balance instance variable of the transaction class and instead calculated the balance when I printed the statement. Due to the formatting of the expected output, I had to calculate the balance accumulator in ascending date but display the statements in descending date.

#### Additional Feature 2

As a user, I’d like to be able to choose some options for my statement.
If I don’t pass options it’s the default statement (like in the specs).
Here are some options I can choose:

* Show dates in american format instead (mm/dd/yyyy instead of dd/mm/yyyy)
* Have both debit and credit appear in the same column. Debit show between parentheses. The column name is transaction
* Right to left -> the order of columns is reversed

Example - If this is the basic statement:

date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00

this would be the same statement, with all options active:

balance || transaction || date
2500.00 || (500.00) || 01/14/2012
3000.00 || 2000.00 || 01/13/2012
1000.00 || 1000.00 || 01/10/2012

Of course, I can choose 0, 1, 2 or more options.

1) To be able to change the date formatting I needed to separate the formatting and the data. This meant storing the raw date inside the transaction and formatting in the print_statement method. This then allowed me to pass the option into the format_date method and decide which format to use.

2) Introducing a second option made it clear I could not have the default value being nil as I would not know which option to action. This led me to having instance variables for each option and having a helper method that carried out different options based on the option selected.

3) This could be completed fairly easily by adding two more helper methods, one for the head of the statement and one for the body.

## Original Plan (before additional requirements)
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

##### Edit

After the first addional feature the balance is no longer stored on the account - this would not be compatible with back dated transactions. The transaction no longer knows the balance after that transaction.

After the second group of additional features, the account manager class was removed - it was too closely coupled with account and the definitions of the two were blurry. Transaction class has been slimmed down to remove all formatting and only store the bare minimum of data required.

## What I learned from this tech test

The main difficulty I had with this tech test was adjusting my code to requirements added after I had written my first solution. This taught me what it means for code to be easily changable. I had to separate data from formatting and also to add formatting in at the latest possible stage.

