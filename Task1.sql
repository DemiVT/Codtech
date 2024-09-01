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

-- Interactive Queries
-- 1. Find Books by Author
SELECT * FROM Books WHERE author = 'Harper Lee';

-- 2. Check Available Copies
SELECT title, available_copies FROM Books WHERE book_id = 1;

-- 3. List All Transactions
SELECT t.transaction_id, b.title, m.name, t.borrow_date, t.return_date
FROM Transactions t
JOIN Books b ON t.book_id = b.book_id
JOIN Members m ON t.member_id = m.member_id;

-- 4. Find Members with Late Returns
SELECT m.name, t.book_id, b.title, t.borrow_date, t.return_date
FROM Transactions t
JOIN Books b ON t.book_id = b.book_id
JOIN Members m ON t.member_id = m.member_id
WHERE t.return_date IS NULL;