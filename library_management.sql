-- Library Management By SQL

-- 1. Creating Tables
CREATE TABLE Books (
    BookID NUMBER PRIMARY KEY,
    Title VARCHAR2(255) NOT NULL,
    Author VARCHAR2(255),
    Genre VARCHAR2(100),
    PublishedYear NUMBER(4),
    AvailableCopies NUMBER DEFAULT 1
);

CREATE TABLE Members (
    MemberID NUMBER PRIMARY KEY,
    Name VARCHAR2(255) NOT NULL,
    Email VARCHAR2(255) UNIQUE,
    PhoneNumber VARCHAR2(15),
    JoinDate DATE DEFAULT SYSDATE
);

CREATE TABLE Transactions (
    TransactionID NUMBER PRIMARY KEY,
    BookID NUMBER REFERENCES Books(BookID),
    MemberID NUMBER REFERENCES Members(MemberID),
    IssueDate DATE DEFAULT SYSDATE,
    DueDate DATE,
    ReturnDate DATE,
    Status VARCHAR2(20) CHECK (Status IN ('Issued', 'Returned'))
);

-- 2. Inserting Sample Data
INSERT INTO Books VALUES (1, 'Atomic Habits', 'James Clear', 'Self-help book', 2018, 5);
INSERT INTO Books VALUES (2, 'Rich Dad Poor Dad', 'Robert Kiyosaki, Sharon Lechter', 'Personal finance, Non-fiction', 1997, 3);
INSERT INTO Books VALUES (3, 'Ikigai', 'Francesc Miralles, Hector Garcia', 'Self-help book', 2016, 4);

INSERT INTO Members VALUES (1, 'Ganesh Gangane', 'ganeshganagne@example.com', '7709863518', SYSDATE);
INSERT INTO Members VALUES (2, 'Datta Bharade', 'dattabharade@example.com', '9876543210', SYSDATE);

INSERT INTO Transactions VALUES (1, 1, 1, SYSDATE, SYSDATE + 14, NULL, 'Issued');
INSERT INTO Transactions VALUES (2, 2, 2, SYSDATE, SYSDATE + 14, NULL, 'Issued');

-- 3. Sample Queries
-- Retrieve all books
SELECT * FROM Books;

-- Check books issued to a member
SELECT B.Title, T.IssueDate, T.DueDate FROM Transactions T
JOIN Books B ON T.BookID = B.BookID
WHERE T.MemberID = 1 AND T.Status = 'Issued';

-- Update return status
UPDATE Transactions SET ReturnDate = SYSDATE, Status = 'Returned' WHERE TransactionID = 1;

-- Delete a member (with cascade constraint handling if necessary)
DELETE FROM Members WHERE MemberID = 2;
