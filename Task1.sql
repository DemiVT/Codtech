-- Create Tables

CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    isbn VARCHAR(20) UNIQUE,
    publish_year YEAR,
    genre VARCHAR(100),
    available_copies INT DEFAULT 0
);

CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(15),
    membership_date DATE
);

CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    borrow_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Insert Sample Data

INSERT INTO Books (title, author, isbn, publish_year, genre, available_copies) 
VALUES 
    ('The Great Gatsby', 'F. Scott Fitzgerald', '9780743273565', 1925, 'Fiction', 5),
    ('To Kill a Mockingbird', 'Harper Lee', '9780060935467', 1960, 'Fiction', 3),
    ('1984', 'George Orwell', '9780451524935', 1949, 'Dystopian', 4);

INSERT INTO Members (name, email, phone_number, membership_date)
VALUES 
    ('John Doe', 'johndoe@example.com', '555-1234', '2024-01-01'),
    ('Jane Smith', 'janesmith@example.com', '555-5678', '2024-03-15');

INSERT INTO Transactions (book_id, member_id, borrow_date)
VALUES 
    (1, 1, '2024-08-01'),
    (2, 2, '2024-08-15');

-- Basic SQL Commands

-- Retrieve all books
SELECT * FROM Books;

-- Insert a new book
INSERT INTO Books (title, author, isbn, publish_year, genre, available_copies)
VALUES ('Brave New World', 'Aldous Huxley', '9780060850524', 1932, 'Dystopian', 6);

-- Update available copies of a book
UPDATE Books
SET available_copies = 2
WHERE book_id = 2;

-- Delete a book
DELETE FROM Books
WHERE isbn = '9780743273565';

-- Retrieve all members
SELECT * FROM Members;

-- Add a new member
INSERT INTO Members (name, email, phone_number, membership_date)
VALUES ('Alice Johnson', 'alice.johnson@example.com', '555-7890', '2024-09-01');

-- Update member email
UPDATE Members
SET email = 'new.email@example.com'
WHERE member_id = 1;

-- Delete a member
DELETE FROM Members
WHERE email = 'janesmith@example.com';

-- Retrieve all transactions
SELECT * FROM Transactions;

-- Record a book return (update return date)
UPDATE Transactions
SET return_date = '2024-09-01'
WHERE transaction_id = 1;
