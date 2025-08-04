-- Student Table
CREATE TABLE Student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    department VARCHAR(50),
    phone_no VARCHAR(15)
);

-- Author Table
CREATE TABLE Author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    nationality VARCHAR(50)
);

-- Book Table
CREATE TABLE Book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150),
    publisher VARCHAR(100),
    category VARCHAR(50),
    publication_year INT
);

-- BookAuthor Table (junction for many-to-many)
CREATE TABLE BookAuthor (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
);

-- Loan Table
CREATE TABLE Loan (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    book_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

-- Fine Table
CREATE TABLE Fine (
    fine_id INT AUTO_INCREMENT PRIMARY KEY,
    loan_id INT,
    amount DECIMAL(10,2),
    status VARCHAR(20),
    paid_date DATE,
    FOREIGN KEY (loan_id) REFERENCES Loan(loan_id)
);
select * from Student;

INSERT INTO Student (name, email, department, phone_no) VALUES
('Ashutosh', 'ashutosh@example.com', 'CSE', '9876543210'),
('Vishal', 'vishal@example.com', 'IT', '9876543211'),
('Abhinav', 'abhinav@example.com', 'ECE', '9876543212'),
('Nishu', 'nishu@example.com', 'EEE', '9876543213'),
('Sonu', 'sonu@example.com', 'MECH', '9876543214'),
('Akash', 'akash@example.com', 'CIVIL', '9876543215'),
('Pritam', 'pritam@example.com', 'CSE', '9876543216'),
('Sintu', 'sintu@example.com', 'IT', '9876543217'),
('Aditya', 'aditya@example.com', 'ECE', '9876543218'),
('Deepanshu', 'deepanshu@example.com', 'EEE', '9876543219'),
('Ayush', 'ayush@example.com', 'MECH', '9876543220'),
('Samay', 'samay@example.com', 'CIVIL', '9876543221'),
('Aman', 'aman@example.com', 'CSE', '9876543222'),
('Shaurav', 'shaurav@example.com', 'IT', '9876543223');

INSERT INTO Author (name, nationality) VALUES
('Chetan Bhagat', 'Indian'),
('J.K. Rowling', 'British'),
('Dan Brown', 'American'),
('Dr. Kalam', 'Indian');

INSERT INTO Book (title, publisher, category, publication_year) VALUES
('Wings of Fire', 'Universities Press', 'Autobiography', 1999),
('Harry Potter', 'Bloomsbury', 'Fantasy', 1997),
('Five Point Someone', 'Rupa', 'Fiction', 2004),
('The Da Vinci Code', 'Doubleday', 'Thriller', 2003);

INSERT INTO BookAuthor (book_id, author_id) VALUES
(1, 4),  -- Wings of Fire by Dr. Kalam
(2, 2),  -- Harry Potter by J.K. Rowling
(3, 1),  -- Five Point Someone by Chetan Bhagat
(4, 3);  -- Da Vinci Code by Dan Brown

INSERT INTO Loan (student_id, book_id, issue_date, return_date) VALUES
(1, 1, '2025-08-01', '2025-08-10'),
(2, 2, '2025-08-02', '2025-08-11'),
(3, 3, '2025-08-03', '2025-08-12'),
(4, 4, '2025-08-04', NULL),   -- not returned yet
(5, 2, '2025-08-04', '2025-08-14');

INSERT INTO Fine (loan_id, amount, status, paid_date) VALUES
(1, 0.00, 'No Fine', NULL),
(2, 20.00, 'Paid', '2025-08-12'),
(3, 0.00, 'No Fine', NULL),
(5, 10.00, 'Unpaid', NULL);

select * from Student;
