CREATE DATABASE library;
USE library;

-- Create the Branch table

CREATE TABLE  Branch (
  Branch_no INT PRIMARY KEY,
  Manager_Id INT,
  Branch_address VARCHAR(400) NOT NULL,
  Contact_no VARCHAR(20) NOT NULL
);

-- Create the Books table
CREATE TABLE Books (
  ISBN INT PRIMARY KEY,
  Book_title VARCHAR(900) NOT NULL,
  Category VARCHAR(900),
  Rental_Price DECIMAL(12,2) NOT NULL,
  Status ENUM ('YES','NO') NOT NULL,
  Author VARCHAR(500),
  Publisher VARCHAR(900)
);

-- Create the Employee table
CREATE TABLE Employee (
 Emp_Id INT PRIMARY KEY,
 Emp_name VARCHAR (300),
 Position VARCHAR(300),
 Salary INT,
 Branch_no INT,
 FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- Create the Customer table
CREATE TABLE Customer (
  Customer_Id INT PRIMARY KEY,
  Customer_name VARCHAR(300) NOT NULL,
  Customer_address VARCHAR(400) NOT NULL,
  Reg_date VARCHAR(255) NOT NULL
  );


-- Create the IssueStatus table
CREATE TABLE IssueStatus (
  Issue_Id INT PRIMARY KEY,
  Issued_cust INT,
  Issued_book_name VARCHAR(500) NOT NULL,
  Issue_date DATE NOT NULL,
  Isbn_book INT,
  FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
  FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
  );


-- Create the ReturnStatus table
CREATE TABLE ReturnStatus (
  Return_Id INT PRIMARY KEY,
  Return_cust INT,
  Return_book_name VARCHAR (500) NOT NULL,
  Return_date DATE NOT NULL,
  Isbn_book2 INT,
  FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
  FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);




-- Insert values into Branch table
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES 
(1, 101, '123 Main Street,NY,USA', '1234567890'),
(2, 102, '456 Oak Avenue,Maywood,NJ,USA', '9876543210'),
(3, 103, '789 SRK Avenue,Nellore,Andhra Pradesh', '9871233210'),
(4, 104, '101 SN Street,Kozhikode,Kerala', '9764233210'),
(5, 105, '111 Queen Street,Toronto,Canada', '9872277210'),
(6, 106, '77 MG Street,Kollam,Kerala', '98711134210'),
(7, 107, '111 Queen Street,Toronto,Canada', '9874567310'),
(8, 108, '881 Princes Street,Kochi,Kerala', '9834875910'),
(9, 109, 'Nirmala Convent Road,Rajkot,Gujarat', '9809705210'),
(10, 110, 'Vijayawadaone Town,Andhra Pradesh', '9810940710'),
(11, 111, 'Girinagar,west bangaluru', '9872277210');

-- Insert values into Employee table
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES 
 (101, 'John Thomas', 'Manager', 65000, 1),
 (102, 'Jane Smith','Clerk', 45000, 2),
 (103, 'Mia Johnson','Librarian', 70000, 5),
 (104, 'Alice Brown', 'Assistant', 50000, 3),
 (105, 'Charlie Davis', 'Manager', 65000, 4),
 (106,'Eva Sam','Assistant',50000,6),
 (107, 'Tom Darvin','Clerk', 45000, 7),
 (108, 'Siya  Mariya','Clerk', 45000,8),
 (109, 'Nandha Sagar',  'Manager', 65000,9 ),
 (110, 'Vijay Joseph', 'Assistant', 50000, 10),
 (111, 'Thara Krishnan', 'Clerk', 45000, 11);



-- Insert values into Customer table
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES 
 (201, 'Eva Sarah', '456 Pine Street', '2022-03-15'),
 (202, 'Tom Wilson', '789 Oak Avenue', '2021-12-01'),
 (203, 'Linda Mariya', '101 Elm Lane', '2023-01-20'),
 (204, 'Mike Johnson', '567 Maple Avenue', '2022-05-10'),
 (205, 'Sarah Ben', '888 Cedar Street', '2023-02-28'),
 (206, 'John Doe', '123 Birch Road', '2022-08-18'),
 (207, 'Emily Jackson', '222 Willow Street', '2021-10-05'),
 (208, 'Chris Thomas', '333 Oak Lane', '2023-04-12'),
 (209, 'Olivia Rodriguez', '444 Pine Avenue', '2022-07-09'),
 (210, 'Daniel Miller', '555 Elm Road', '2021-11-30'),
 (211, 'Sophia Stephen', '666 Cedar Lane', '2023-03-25');
 
 
 -- Insert values into Books table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES 
  (101, 'shadow and bone', 'Fiction',315, 'yes', 'Leigh Bardugo', 'Macmillan Publishers'),
  (102, 'Aadujeevitham', 'Bildungsroman',188, 'yes', 'Benyamin', 'Green Books'),
  (103, "Harry Potter and the Sorcerer's Stone", 'Fantasy',255, 'yes', 'J.K. Rowling', 'Scholastic'),
  (104, 'Aarachaar', 'Novel',255, 'No', 'K. R. Meera', 'DC Books'),
  (105, 'The Alchemist', 'Fantasy Fiction', 200, 'yes','Paulo Coelho','HarperCollins Publishers'),
  (106, 'On Writing : A Memoir of the Craft','Non Fiction',200,'No','Stephen King','Hodder and Stoughton'),
  (107, '1984','Political fiction',299,'No','George Orwell','VSecker & Warburg'),
  (108, 'Aalahayude Penmakkal','novel',199,'yes','Sarah Joseph','Current Books'),
  (109, 'Sugandhi Enna Andal Devanayaki','Post Morden Novel',199,'no','T. D. Ramakrishnan','DC Books'),
  (110,'The Kite Runner','Drama',200,'no','Khaled Hosseini','Riverhead Books'),
  (111, 'Wings of Fire','Autobiography',99,'yes',' A. P. J. Abdul Kalam, Arun Tiwari','Universities Press');
  
  
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES 
  (301, 201, 'Aarachaar', '2023-02-10', 104),
  (302, 202, 'On Writing : A Memoir of the Craft', '2023-01-20', 106),
  (303, 203, '1984', '2023-03-05', 107),
  (304, 204, 'Sugandhi Enna Andal Devanayaki', '2022-06-15', 109),
  (305, 205, 'The Kite Runner', '2022-09-01', 110);
  
  -- Insert values into ReturnStatus table
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES 
  (401, 201, 'shadow and bone', '2023-03-05', 101),
  (402, 202, 'Wings of Fire', '2023-02-15', 111),
  (403, 203, 'Harry Potter and the Sorcerer''s Stone', '2023-04-20', 103),
  (404, 204, 'Aadujeevitham', '2022-07-01', 102),
  (405, 205, 'Aalahayude Penmakkal', '2022-09-30', 108);
  
       
SELECT*FROM Branch; 
SELECT*FROM Employee;
SELECT*FROM Customer;
SELECT*FROM IssueStatus;
SELECT*FROM ReturnStatus;
SELECT*FROM Books;

# Retrieve the book title, category, and rental price of all available books.

SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'yes';


#List the employee names and their respective salaries in descending order of salary

SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

# Retrieve the book titles and the corresponding customers who have issued those books.

SELECT Issued_book_name,Issued_cust FROM IssueStatus;

# Display the total count of books in each category.

SELECT Category, COUNT(*) AS Total_Books FROM Books GROUP BY Category;

-- Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000

SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

--  List the customer names who registered before 2022-01-01 and have not issued any books yet.

SELECT Customer.Customer_name FROM Customer LEFT JOIN IssueStatus ON Customer_Id = IssueStatus.Issued_cust WHERE Customer.Reg_date < '2022-01-01' AND IssueStatus.Issue_Id IS NULL;


--  Display the branch numbers and the total count of employees in each branch.

SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee GROUP BY Branch_no;


--  Display the names of customers who have issued books in the month of June 2023


SELECT Customer.Customer_name FROM Customer JOIN IssueStatus ON  Customer.Customer_Id = IssueStatus.Issued_cust WHERE MONTH(IssueStatus.Issue_date) = 6 AND YEAR(IssueStatus.Issue_date) = 2023;

-- Retrieve book_title from book table containing history. 

SELECT Book_title FROM Books WHERE Category = 'history';

-- Retrieve the branch numbers along with the count of employees for branches having more than 5 employees

SELECT Branch_no, COUNT(*) AS Employee_Count FROM Employee GROUP BY Branch_no HAVING COUNT(*) > 5;







       
       
