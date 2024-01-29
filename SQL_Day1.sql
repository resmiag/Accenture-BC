CREATE TABLE Book (
    ISBN VARCHAR(20) PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Price DECIMAL(10, 2),
    Stock INT
);

CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Book_Category (
    Book_ISBN VARCHAR(20),
    CategoryID INT,
    PRIMARY KEY (Book_ISBN, CategoryID),
    FOREIGN KEY (Book_ISBN) REFERENCES Book(ISBN),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);
-- Inserting into Book table
INSERT INTO Book (ISBN, Title, Author, Price, Stock) 
VALUES 
('9780061120084', 'To Kill a Mockingbird', 'Harper Lee', 10.99, 50),
('9780142407332', 'The Catcher in the Rye', 'J.D. Salinger', 9.99, 40),
('9780544003415', 'The Hobbit', 'J.R.R. Tolkien', 12.50, 60),
('9780062315007', '1984', 'George Orwell', 8.99, 30),
('9780062561480', 'The Great Gatsby', 'F. Scott Fitzgerald', 11.25, 55);

-- Inserting into Category table
INSERT INTO Category (CategoryID, Name)
VALUES
(1, 'Fiction'),
(2, 'Classics'),
(3, 'Science Fiction'),
(4, 'Mystery'),
(5, 'Fantasy');

-- Inserting into Book_Category table
INSERT INTO Book_Category (Book_ISBN, CategoryID)
VALUES
('9780061120084', 1),
('9780061120084', 2),
('9780142407332', 1),
('9780544003415', 2),
('9780544003415', 5);
-- Update Book table
UPDATE Book 
SET Price = 12.99 
WHERE ISBN = '9780061120084';

UPDATE Book 
SET Stock = 45 
WHERE ISBN = '9780142407332';

UPDATE Book 
SET Author = 'George R.R. Martin' 
WHERE ISBN = '9780544003415';

UPDATE Book 
SET Price = 7.99 
WHERE ISBN = '9780062315007';

UPDATE Book 
SET Stock = 50 
WHERE ISBN = '9780062561480';

-- Update Category table
UPDATE Category
SET Name = 'Literary Fiction'
WHERE CategoryID = 1;

UPDATE Category
SET Name = 'Classic Literature'
WHERE CategoryID = 2;

UPDATE Category
SET Name = 'Sci-Fi & Fantasy'
WHERE CategoryID = 3;

UPDATE Category
SET Name = 'Crime Fiction'
WHERE CategoryID = 4;

UPDATE Category
SET Name = 'Epic Fantasy'
WHERE CategoryID = 5;

-- Update Book_Category table
UPDATE Book_Category
SET CategoryID = 3
WHERE Book_ISBN = '9780061120084';

UPDATE Book_Category
SET CategoryID = 5
WHERE Book_ISBN = '9780142407332';

UPDATE Book_Category
SET CategoryID = 2
WHERE Book_ISBN = '9780544003415';

UPDATE Book_Category
SET CategoryID = 1
WHERE Book_ISBN = '9780062315007';

UPDATE Book_Category
SET CategoryID = 2
WHERE Book_ISBN = '9780062561480';
-- Delete from Book table
DELETE FROM Book
WHERE ISBN = '9780062315007';

DELETE FROM Book
WHERE ISBN = '9780062561480';

-- Delete from Category table
DELETE FROM Category
WHERE CategoryID = 4;

DELETE FROM Category
WHERE CategoryID = 5;

-- Delete from Book_Category table
DELETE FROM Book_Category
WHERE Book_ISBN = '9780061120084' AND CategoryID = 3;

DELETE FROM Book_Category
WHERE Book_ISBN = '9780142407332' AND CategoryID = 5;