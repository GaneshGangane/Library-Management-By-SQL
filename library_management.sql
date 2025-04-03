-- 1. Creating Tables
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255),
    Genre VARCHAR(100),
    PublishedYear INT(4),
    AvailableCopies INT DEFAULT 1
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    PhoneNumber VARCHAR(15),
    JoinDate DATE DEFAULT CURRENT_DATE
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    MemberID INT,
    IssueDate DATE DEFAULT CURRENT_DATE,
    DueDate DATE,
    ReturnDate DATE,
    Status ENUM('Issued', 'Returned'),
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID) ON DELETE CASCADE
);

-- 2. Inserting Sample Data
INSERT INTO Books (Title, Author, Genre, PublishedYear, AvailableCopies) 
VALUES 
('Atomic Habits', 'James Clear', 'Self-help book', 2018, 5),
('Rich Dad Poor Dad', 'Robert Kiyosaki, Sharon Lechter', 'Personal finance, Non-fiction', 1997, 3),
('Ikigai', 'Francesc Miralles, Hector Garcia', 'Self-help book', 2016, 4);

INSERT INTO Members (Name, Email, PhoneNumber, JoinDate) 
VALUES 
('Ganesh Gangane', 'ganeshganagne@example.com', '7709863518', CURRENT_DATE),
('Datta Bharade', 'dattabharade@example.com', '9876543210', CURRENT_DATE);

INSERT INTO Transactions (BookID, MemberID, IssueDate, DueDate, Status) 
VALUES 
(1, 1, CURRENT_DATE, DATE_ADD(CURRENT_DATE, INTERVAL 14 DAY), 'Issued'),
(2, 2, CURRENT_DATE, DATE_ADD(CURRENT_DATE, INTERVAL 14 DAY), 'Issued');

-- 3. Sample Queries

-- Retrieve all books
SELECT * FROM Books;

-- Check books issued to a specific member
SELECT B.Title, T.IssueDate, T.DueDate 
FROM Transactions T
JOIN Books B ON T.BookID = B.BookID
WHERE T.MemberID = 1 AND T.Status = 'Issued';

-- Update return status for a transaction
UPDATE Transactions 
SET ReturnDate = CURRENT_DATE, Status = 'Returned' 
WHERE TransactionID = 1;

-- Delete a member (cascade delete ensures issued books are handled)
DELETE FROM Members WHERE MemberID = 2;
