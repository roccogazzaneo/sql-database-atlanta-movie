Team 52:
Rocco Gazzaneo 903553002 rgazzaneo3
Alessandro Vinci 903552630 avinci3
Michael Brzozowski 903146872 mbrzozowski3
Alessandro Caruso 903552999 acaruso6


We included logical constraints also in phase 3, as we are doing phase 4.
Some of the logical constraints that have been implemented:
- Admin cannot decline an approved user
- User cannot login if his status is different than 'Approved
- A customer cannot view more than 3 film per day
- A customer cannot have more than 5 credit cards
- A theater cannot play more movies than its capacity in the same day
- Password length must be >= 8 characters 


In the Team52_DB.sql you can find the data export of our database plus all our stored procedure, functions and views. 
We hashed the passwords that were given initially.

In Team52_SP.sql you can find all the stored procedure, views and function that we have been created, plus those provided. The code is commented and should be self_explaining.
We slightly changed some of the stored procedure provided in order to make it work with the column names of our tables.
