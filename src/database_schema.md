**quiz table**

quiz_id (INT, Primary Key, Auto Increment)

quiz_name (VARCHAR, NOT NULL)


**questions table**

question_id (INT, Primary Key, Auto Increment)

quiz_id (INT, Foreign Key referencing quiz.quiz_id, ON DELETE CASCADE)

question_text (TEXT, NOT NULL)

optiona (VARCHAR, NOT NULL)

optionb (VARCHAR, NOT NULL)

optionc (VARCHAR, NOT NULL)

optiond (VARCHAR, NOT NULL)

correct_ans (VARCHAR, NOT NULL)


**student table**

student_id (INT, Primary Key, Auto Increment)

name (VARCHAR, NOT NULL)

email_id (VARCHAR, NOT NULL, UNIQUE)

password (VARCHAR, NOT NULL)
