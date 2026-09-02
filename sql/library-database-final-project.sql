#query 1
CREATE DATABASE LibraryDB;
USE LibraryDB;
#query 2
CREATE TABLE PUBLISHER (
    PublisherID VARCHAR(4),
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(200),
    ContactPerson VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    CONSTRAINT Publisher_PublisherID_PK PRIMARY KEY (PublisherID)
);
#query 3
CREATE TABLE LIBRARY_BRANCH (
    BranchID VARCHAR(4),
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(200),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Manager VARCHAR(50),
    CONSTRAINT Branch_BranchID_PK PRIMARY KEY (BranchID)
);
#query 4
CREATE TABLE STAFF (
    StaffID VARCHAR(4),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(15),
    BranchID VARCHAR(4),
    HireDate DATE,
    CONSTRAINT Staff_StaffID_PK PRIMARY KEY (StaffID),
    CONSTRAINT Staff_BranchID_FK FOREIGN KEY (BranchID) 
        REFERENCES LIBRARY_BRANCH(BranchID)
);
#query 5
CREATE TABLE ROLE (
    RoleID VARCHAR(4),
    Title VARCHAR(50) NOT NULL,
    Description TEXT,
    AccessLevel VARCHAR(20),
    CONSTRAINT Role_RoleID_PK PRIMARY KEY (RoleID)
);
#query 6
CREATE TABLE STAFF_ROLE (
    StaffID VARCHAR(4),
    RoleID VARCHAR(4),
    AssignmentDate DATE,
    CONSTRAINT StaffRole_StaffID_RoleID_PK PRIMARY KEY (StaffID, RoleID),
    CONSTRAINT StaffRole_StaffID_FK FOREIGN KEY (StaffID) 
        REFERENCES STAFF(StaffID),
    CONSTRAINT StaffRole_RoleID_FK FOREIGN KEY (RoleID) 
        REFERENCES ROLE(RoleID)
);
#query 7
CREATE TABLE AUTHOR (
    AuthorID VARCHAR(4),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Biography TEXT,
    DateOfBirth DATE,
    Nationality VARCHAR(100),
    CONSTRAINT Author_AuthorID_PK PRIMARY KEY (AuthorID)
);
#query 8
CREATE TABLE CATEGORY (
    CategoryID VARCHAR(4),
    Name VARCHAR(50) NOT NULL,
    Description TEXT,
    ParentCategoryID VARCHAR(4),
    CONSTRAINT Category_CategoryID_PK PRIMARY KEY (CategoryID),
    CONSTRAINT Category_ParentID_FK FOREIGN KEY (ParentCategoryID) 
        REFERENCES CATEGORY(CategoryID)
);
#query 9
CREATE TABLE BOOK (
    BookID VARCHAR(4),
    Title VARCHAR(200) NOT NULL,
    ISBN VARCHAR(13),
    PublicationDate DATE,
    Status VARCHAR(20),
    PublisherID VARCHAR(4),
    CONSTRAINT Book_BookID_PK PRIMARY KEY (BookID),
    CONSTRAINT Book_PublisherID_FK FOREIGN KEY (PublisherID) 
        REFERENCES PUBLISHER(PublisherID),
    CONSTRAINT Book_Status_CK CHECK (Status IN ('Available', 'Borrowed', 'Overdue'))
);
#query 10
CREATE TABLE BOOK_AUTHOR (
    BookID VARCHAR(4),
    AuthorID VARCHAR(4),
    CONSTRAINT BookAuthor_BookID_AuthorID_PK PRIMARY KEY (BookID, AuthorID),
    CONSTRAINT BookAuthor_BookID_FK FOREIGN KEY (BookID) 
        REFERENCES BOOK(BookID),
    CONSTRAINT BookAuthor_AuthorID_FK FOREIGN KEY (AuthorID) 
        REFERENCES AUTHOR(AuthorID)
);
#query 11
CREATE TABLE BOOK_CATEGORY (
    BookID VARCHAR(4),
    CategoryID VARCHAR(4),
    CONSTRAINT BookCategory_BookID_CategoryID_PK PRIMARY KEY (BookID, CategoryID),
    CONSTRAINT BookCategory_BookID_FK FOREIGN KEY (BookID) 
        REFERENCES BOOK(BookID),
    CONSTRAINT BookCategory_CategoryID_FK FOREIGN KEY (CategoryID) 
        REFERENCES CATEGORY(CategoryID)
);
#query 12
CREATE TABLE BOOK_COPY (
    CopyID VARCHAR(4),
    BookID VARCHAR(4),
    BranchID VARCHAR(4),
    BookCondition VARCHAR(20),
    AcquisitionDate DATE,
    Status VARCHAR(20),
    CONSTRAINT BookCopy_CopyID_PK PRIMARY KEY (CopyID),
    CONSTRAINT BookCopy_BookID_FK FOREIGN KEY (BookID) 
        REFERENCES BOOK(BookID),
    CONSTRAINT BookCopy_BranchID_FK FOREIGN KEY (BranchID) 
        REFERENCES LIBRARY_BRANCH(BranchID),
    CONSTRAINT BookCopy_Status_CK CHECK (Status IN ('Available', 'Borrowed', 'Maintenance'))
);
#query 13
CREATE TABLE BORROWER (
    BorrowerID VARCHAR(4),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(15),
    MembershipDate DATE,
    MembershipStatus VARCHAR(20),
    CONSTRAINT Borrower_BorrowerID_PK PRIMARY KEY (BorrowerID),
    CONSTRAINT Borrower_Status_CK CHECK (MembershipStatus IN ('Active', 'Expired', 'Suspended'))
);
#query 14
CREATE TABLE LOAN (
    LoanID VARCHAR(4),
    BookID VARCHAR(4),
    BorrowerID VARCHAR(4),
    StaffID VARCHAR(4),
    LoanDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    Status VARCHAR(20),
    CONSTRAINT Loan_LoanID_PK PRIMARY KEY (LoanID),
    CONSTRAINT Loan_BookID_FK FOREIGN KEY (BookID) 
        REFERENCES BOOK(BookID),
    CONSTRAINT Loan_BorrowerID_FK FOREIGN KEY (BorrowerID) 
        REFERENCES BORROWER(BorrowerID),
    CONSTRAINT Loan_StaffID_FK FOREIGN KEY (StaffID) 
        REFERENCES STAFF(StaffID),
    CONSTRAINT Loan_Status_CK CHECK (Status IN ('Active', 'Returned', 'Overdue'))
);
#query 15
CREATE TABLE FINE (
    FineID VARCHAR(4),
    LoanID VARCHAR(4),
    Amount DECIMAL(10,2),
    Status VARCHAR(20),
    IssueDate DATE,
    PaymentDate DATE,
    CONSTRAINT Fine_FineID_PK PRIMARY KEY (FineID),
    CONSTRAINT Fine_LoanID_FK FOREIGN KEY (LoanID) 
        REFERENCES LOAN(LoanID),
    CONSTRAINT Fine_Status_CK CHECK (Status IN ('Pending', 'Paid', 'Waived')),
    CONSTRAINT Fine_Amount_CK CHECK (Amount > 0)
);
#query 16
CREATE TABLE REVIEW (
    ReviewID VARCHAR(4),
    BookID VARCHAR(4),
    BorrowerID VARCHAR(4),
    Rating INTEGER,
    ReviewText TEXT,
    ReviewDate DATE,
    CONSTRAINT Review_ReviewID_PK PRIMARY KEY (ReviewID),
    CONSTRAINT Review_BookID_FK FOREIGN KEY (BookID) 
        REFERENCES BOOK(BookID),
    CONSTRAINT Review_BorrowerID_FK FOREIGN KEY (BorrowerID) 
        REFERENCES BORROWER(BorrowerID),
    CONSTRAINT Review_Rating_CK CHECK (Rating BETWEEN 1 AND 5)
);
#query 17
INSERT INTO PUBLISHER VALUES
('P001', 'Penguin Books', '123 Publisher Lane', 'John Smith', '555-0001', 'contact@penguin.com'),
('P002', 'Random House', '456 Publisher Ave', 'Jane Doe', '555-0002', 'contact@randomhouse.com'),
('P003', 'HarperCollins', '789 Publishing Rd', 'Bob Wilson', '555-0003', 'contact@harper.com'),
('P004', 'Simon & Schuster', '321 Publisher St', 'Alice Brown', '555-0004', 'contact@simon.com'),
('P005', 'Macmillan', '654 Press Ave', 'Charlie Davis', '555-0005', 'contact@macmillan.com'),
('P006', 'Hachette', '987 Book Lane', 'Diana Evans', '555-0006', 'contact@hachette.com'),
('P007', 'Scholastic', '147 Youth St', 'Edward Fox', '555-0007', 'contact@scholastic.com'),
('P008', 'Wiley', '258 Academic Rd', 'Frank Garcia', '555-0008', 'contact@wiley.com'),
('P009', 'Oxford Press', '369 University Ave', 'Grace Hill', '555-0009', 'contact@oxford.com'),
('P010', 'Cambridge Press', '741 Scholar St', 'Henry Irving', '555-0010', 'contact@cambridge.com'),
('P011', 'Pearson', '852 Education Ln', 'Isabel James', '555-0011', 'contact@pearson.com'),
('P012', 'McGraw Hill', '963 Learning Ave', 'Jack King', '555-0012', 'contact@mcgraw.com'),
('P013', 'Cengage', '159 Knowledge Rd', 'Kelly Lee', '555-0013', 'contact@cengage.com'),
('P014', 'Academic Press', '357 Research St', 'Liam Moore', '555-0014', 'contact@academic.com'),
('P015', 'Dover', '486 Classic Ave', 'Maria Nelson', '555-0015', 'contact@dover.com'),
('P016', 'Bloomsbury', '159 Potter Lane', 'Noah Oliver', '555-0016', 'contact@bloomsbury.com'),
('P017', 'Tor Books', '753 Fantasy Road', 'Olivia Parker', '555-0017', 'contact@tor.com'),
('P018', 'Del Rey', '951 SciFi Street', 'Peter Quinn', '555-0018', 'contact@delrey.com'),
('P019', 'Vintage', '357 Classic Lane', 'Quinn Roberts', '555-0019', 'contact@vintage.com'),
('P020', 'Bantam', '486 Fiction Road', 'Rachel Scott', '555-0020', 'contact@bantam.com'),
('P021', 'Puffin', '852 Children Ave', 'Samuel Taylor', '555-0021', 'contact@puffin.com'),
('P022', 'Chronicle Books', '963 Art Street', 'Teresa Unique', '555-0022', 'contact@chronicle.com'),
('P023', 'Hay House', '147 Wellness Rd', 'Uma Vincent', '555-0023', 'contact@hayhouse.com'),
('P024', 'Workman', '258 Craft Lane', 'Victor White', '555-0024', 'contact@workman.com'),
('P025', 'Abrams', '369 Design Ave', 'Wendy Xavier', '555-0025', 'contact@abrams.com'),
('P026', 'Phaidon', '741 Art Road', 'Xavier Young', '555-0026', 'contact@phaidon.com'),
('P027', 'Taschen', '852 Visual St', 'Yolanda Zell', '555-0027', 'contact@taschen.com'),
('P028', 'DK', '963 Reference Ln', 'Zack Adams', '555-0028', 'contact@dk.com'),
('P029', 'Thames & Hudson', '159 Museum Rd', 'Adam Baker', '555-0029', 'contact@thames.com'),
('P030', 'Rizzoli', '357 Style Ave', 'Beth Carter', '555-0030', 'contact@rizzoli.com');
#query 18
INSERT INTO AUTHOR VALUES
('A001', 'Stephen', 'King', 'Horror and suspense author', '1947-09-21', 'American'),
('A002', 'J.K.', 'Rowling', 'Fantasy author', '1965-07-31', 'British'),
('A003', 'George', 'Orwell', 'Political fiction author', '1903-06-25', 'British'),
('A004', 'Jane', 'Austen', 'Romance novelist', '1775-12-16', 'British'),
('A005', 'Ernest', 'Hemingway', 'Modernist author', '1899-07-21', 'American'),
('A006', 'Virginia', 'Woolf', 'Modernist author', '1882-01-25', 'British'),
('A007', 'Gabriel', 'García Márquez', 'Magical realism author', '1927-03-06', 'Colombian'),
('A008', 'Toni', 'Morrison', 'Novelist', '1931-02-18', 'American'),
('A009', 'Haruki', 'Murakami', 'Contemporary author', '1949-01-12', 'Japanese'),
('A010', 'Margaret', 'Atwood', 'Contemporary author', '1939-11-18', 'Canadian'),
('A011', 'Neil', 'Gaiman', 'Fantasy author', '1960-11-10', 'British'),
('A012', 'Isabel', 'Allende', 'Magical realism author', '1942-08-02', 'Chilean'),
('A013', 'Salman', 'Rushdie', 'Magical realism author', '1947-06-19', 'British-Indian'),
('A014', 'Maya', 'Angelou', 'Poet and memoirist', '1928-04-04', 'American'),
('A015', 'Philip', 'Roth', 'Novelist', '1933-03-19', 'American'),
('A016', 'Alice', 'Walker', 'Novelist', '1944-02-09', 'American'),
('A017', 'Jorge Luis', 'Borges', 'Short story writer', '1899-08-24', 'Argentine'),
('A018', 'Chinua', 'Achebe', 'Novelist', '1930-11-16', 'Nigerian'),
('A019', 'Italo', 'Calvino', 'Novelist', '1923-10-15', 'Italian'),
('A020', 'Ursula K.', 'Le Guin', 'Science fiction author', '1929-10-21', 'American'),
('A021', 'Milan', 'Kundera', 'Novelist', '1929-04-01', 'Czech-French'),
('A022', 'Kazuo', 'Ishiguro', 'Contemporary author', '1954-11-08', 'British'),
('A023', 'Zadie', 'Smith', 'Contemporary author', '1975-10-25', 'British'),
('A024', 'David', 'Mitchell', 'Contemporary author', '1969-01-12', 'British'),
('A025', 'Junot', 'Díaz', 'Contemporary author', '1968-12-31', 'Dominican-American'),
('A026', 'Chimamanda', 'Adichie', 'Contemporary author', '1977-09-15', 'Nigerian'),
('A027', 'Roberto', 'Bolaño', 'Contemporary author', '1953-04-28', 'Chilean'),
('A028', 'Don', 'DeLillo', 'Postmodern author', '1936-11-20', 'American'),
('A029', 'Thomas', 'Pynchon', 'Postmodern author', '1937-05-08', 'American'),
('A030', 'Donna', 'Tartt', 'Contemporary author', '1963-12-23', 'American');
#query 19
INSERT INTO BOOK VALUES
('B001', 'The Shining', '9780307743657', '1977-01-28', 'Available', 'P001'),
('B002', 'Harry Potter 1', '9780590353427', '1997-06-26', 'Borrowed', 'P016'),
('B003', '1984', '9780451524935', '1949-06-08', 'Available', 'P001'),
('B004', 'Pride and Prejudice', '9780141439518', '1813-01-28', 'Available', 'P001'),
('B005', 'The Old Man and the Sea', '9780684801223', '1952-09-01', 'Borrowed', 'P004'),
('B006', 'Mrs Dalloway', '9780156628709', '1925-05-14', 'Available', 'P001'),
('B007', 'One Hundred Years of Solitude', '9780060883287', '1967-05-30', 'Available', 'P003'),
('B008', 'Beloved', '9781400033416', '1987-09-02', 'Borrowed', 'P002'),
('B009', 'Norwegian Wood', '9780375704024', '1987-08-04', 'Available', 'P002'),
('B010', 'The Handmaid''s Tale', '9780385490818', '1985-06-14', 'Available', 'P001'),
('B011', 'American Gods', '9780380789030', '2001-06-19', 'Available', 'P003'),
('B012', 'The House of Spirits', '9780553383809', '1982-01-22', 'Borrowed', 'P002'),
('B013', 'Midnight''s Children', '9780812976533', '1981-04-10', 'Available', 'P002'),
('B014', 'I Know Why the Caged Bird Sings', '9780345514400', '1969-03-15', 'Available', 'P002'),
('B015', 'American Pastoral', '9780375701429', '1997-04-15', 'Borrowed', 'P002'),
('B016', 'The Color Purple', '9780156028356', '1982-06-24', 'Available', 'P001'),
('B017', 'Ficciones', '9780802130303', '1944-06-14', 'Available', 'P004'),
('B018', 'Things Fall Apart', '9780385474542', '1958-06-17', 'Borrowed', 'P003'),
('B019', 'If on a winter''s night a traveler', '9780156439619', '1979-06-01', 'Available', 'P001'),
('B020', 'The Left Hand of Darkness', '9780441478125', '1969-03-01', 'Available', 'P018'),
('B021', 'The Unbearable Lightness of Being', '9780571135394', '1984-04-01', 'Available', 'P002'),
('B022', 'Never Let Me Go', '9781400078776', '2005-04-05', 'Borrowed', 'P002'),
('B023', 'White Teeth', '9780375703867', '2000-01-27', 'Available', 'P002'),
('B024', 'Cloud Atlas', '9780375507250', '2004-03-09', 'Available', 'P002'),
('B025', 'The Brief Wondrous Life of Oscar Wao', '9781594483295', '2007-09-06', 'Available', 'P002'),
('B026', 'Americanah', '9780307271082', '2013-05-14', 'Borrowed', 'P002'),
('B027', '2666', '9780312429215', '2004-11-01', 'Available', 'P002'),
('B028', 'White Noise', '9780140077025', '1985-01-21', 'Available', 'P001'),
('B029', 'Gravity''s Rainbow', '9780143039945', '1973-02-28', 'Available', 'P001'),
('B030', 'The Secret History', '9781400031702', '1992-09-05', 'Available', 'P002'),
('B031', 'The Institute', '9781982110567', '2019-09-10', 'Available', 'P004'),
('B032', 'Harry Potter 2', '9780439064873', '1998-07-02', 'Available', 'P016'),
('B033', 'Animal Farm', '9780451526342', '1945-08-17', 'Borrowed', 'P001'),
('B034', 'The Sun Also Rises', '9780743297332', '1926-10-22', 'Available', 'P004'),
('B035', 'Orlando', '9780156701600', '1928-10-11', 'Available', 'P001');
#query 20
INSERT INTO BORROWER VALUES
('BR01', 'John', 'Smith', 'john@email.com', '555-0101', '2023-01-15', 'Active'),
('BR02', 'Emma', 'Jones', 'emma@email.com', '555-0102', '2023-02-01', 'Active'),
('BR03', 'Michael', 'Brown', 'michael@email.com', '555-0103', '2023-02-15', 'Active'),
('BR04', 'Sarah', 'Wilson', 'sarah@email.com', '555-0104', '2023-03-01', 'Active'),
('BR05', 'David', 'Taylor', 'david@email.com', '555-0105', '2023-03-15', 'Active'),
('BR06', 'Lisa', 'Anderson', 'lisa@email.com', '555-0106', '2023-04-01', 'Active'),
('BR07', 'James', 'Thomas', 'james@email.com', '555-0107', '2023-04-15', 'Active'),
('BR08', 'Emily', 'White', 'emily@email.com', '555-0108', '2023-05-01', 'Active'),
('BR09', 'Robert', 'Martin', 'robert@email.com', '555-0109', '2023-05-15', 'Active'),
('BR10', 'Jennifer', 'Clark', 'jennifer@email.com', '555-0110', '2023-06-01', 'Active'),
('BR11', 'William', 'Rodriguez', 'william@email.com', '555-0111', '2023-06-15', 'Active'),
('BR12', 'Elizabeth', 'Lee', 'elizabeth@email.com', '555-0112', '2023-07-01', 'Active'),
('BR13', 'Richard', 'Walker', 'richard@email.com', '555-0113', '2023-07-15', 'Active'),
('BR14', 'Patricia', 'Hall', 'patricia@email.com', '555-0114', '2023-08-01', 'Active'),
('BR15', 'Joseph', 'Young', 'joseph@email.com', '555-0115', '2023-08-15', 'Active'),
('BR16', 'Susan', 'Allen', 'susan@email.com', '555-0116', '2023-09-01', 'Active'),
('BR17', 'Thomas', 'King', 'thomas@email.com', '555-0117', '2023-09-15', 'Active'),
('BR18', 'Margaret', 'Wright', 'margaret@email.com', '555-0118', '2023-10-01', 'Active'),
('BR19', 'Kevin', 'Lopez', 'kevin@email.com', '555-0119', '2023-10-15', 'Active'),
('BR20', 'Nancy', 'Hill', 'nancy@email.com', '555-0120', '2023-11-01', 'Active'),
('BR21', 'Daniel', 'Scott', 'daniel@email.com', '555-0121', '2023-11-15', 'Active'),
('BR22', 'Betty', 'Green', 'betty@email.com', '555-0122', '2023-12-01', 'Active'),
('BR23', 'Christopher', 'Adams', 'chris@email.com', '555-0123', '2023-12-15', 'Active'),
('BR24', 'Lisa', 'Baker', 'lisa.b@email.com', '555-0124', '2024-01-01', 'Active'),
('BR25', 'Matthew', 'Carter', 'matthew@email.com', '555-0125', '2024-01-15', 'Active'),
('BR26', 'Sandra', 'Diaz', 'sandra@email.com', '555-0126', '2024-02-01', 'Active'),
('BR27', 'Paul', 'Edwards', 'paul@email.com', '555-0127', '2024-02-15', 'Active'),
('BR28', 'Ruth', 'Foster', 'ruth@email.com', '555-0128', '2024-03-01', 'Active'),
('BR29', 'Mark', 'Garcia', 'mark@email.com', '555-0129', '2024-03-15', 'Active'),
('BR30', 'Sharon', 'Harris', 'sharon@email.com', '555-0130', '2024-04-01', 'Active');
#query 21
INSERT INTO LIBRARY_BRANCH VALUES
('LB01', 'Main Branch', '100 Main Street', '555-1001', 'main@library.com', 'James Wilson'),
('LB02', 'East Branch', '200 East Ave', '555-1002', 'east@library.com', 'Mary Johnson'),
('LB03', 'West Branch', '300 West Blvd', '555-1003', 'west@library.com', 'Robert Brown'),
('LB04', 'North Branch', '400 North Road', '555-1004', 'north@library.com', 'Patricia Davis'),
('LB05', 'South Branch', '500 South Lane', '555-1005', 'south@library.com', 'Michael Smith');
#query 22
INSERT INTO STAFF VALUES
('ST01', 'William', 'Thompson', 'william.t@library.com', '555-2001', 'LB01', '2020-01-15'),
('ST02', 'Barbara', 'Johnson', 'barbara.j@library.com', '555-2002', 'LB01', '2020-02-01'),
('ST03', 'Charles', 'Davis', 'charles.d@library.com', '555-2003', 'LB02', '2020-03-15'),
('ST04', 'Dorothy', 'Wilson', 'dorothy.w@library.com', '555-2004', 'LB02', '2020-04-01'),
('ST05', 'Edward', 'Martin', 'edward.m@library.com', '555-2005', 'LB03', '2020-05-15'),
('ST06', 'Frances', 'Anderson', 'frances.a@library.com', '555-2006', 'LB03', '2020-06-01'),
('ST07', 'George', 'Taylor', 'george.t@library.com', '555-2007', 'LB04', '2020-07-15'),
('ST08', 'Helen', 'White', 'helen.w@library.com', '555-2008', 'LB04', '2020-08-01'),
('ST09', 'Irving', 'Clark', 'irving.c@library.com', '555-2009', 'LB05', '2020-09-15'),
('ST10', 'Joan', 'Lee', 'joan.l@library.com', '555-2010', 'LB05', '2020-10-01');
#query 23
INSERT INTO ROLE VALUES
('R001', 'Library Director', 'Overall management of library operations', 'Admin'),
('R002', 'Head Librarian', 'Supervises library staff and operations', 'Manager'),
('R003', 'Reference Librarian', 'Assists with research and reference materials', 'Staff'),
('R004', 'Circulation Staff', 'Handles check-outs and returns', 'Staff'),
('R005', 'Cataloger', 'Maintains library catalog system', 'Staff');
#query 24
INSERT INTO STAFF_ROLE VALUES
('ST01', 'R001', '2020-01-15'),
('ST02', 'R002', '2020-02-01'),
('ST03', 'R002', '2020-03-15'),
('ST04', 'R003', '2020-04-01'),
('ST05', 'R003', '2020-05-15'),
('ST06', 'R004', '2020-06-01'),
('ST07', 'R004', '2020-07-15'),
('ST08', 'R004', '2020-08-01'),
('ST09', 'R005', '2020-09-15'),
('ST10', 'R005', '2020-10-01');
#query 25
INSERT INTO BOOK_COPY VALUES
('C001', 'B001', 'LB01', 'Good', '2023-01-01', 'Available'),
('C002', 'B001', 'LB02', 'Good', '2023-01-01', 'Available'),
('C003', 'B002', 'LB01', 'Good', '2023-01-01', 'Borrowed'),
('C004', 'B002', 'LB03', 'Good', '2023-01-01', 'Available'),
('C005', 'B003', 'LB01', 'Good', '2023-01-01', 'Available'),
('C006', 'B003', 'LB02', 'Fair', '2023-01-01', 'Available'),
('C007', 'B004', 'LB01', 'Good', '2023-01-01', 'Available'),
('C008', 'B004', 'LB03', 'Good', '2023-01-01', 'Borrowed'),
('C009', 'B005', 'LB02', 'Good', '2023-01-01', 'Available'),
('C010', 'B005', 'LB04', 'Fair', '2023-01-01', 'Borrowed'),
('C011', 'B006', 'LB01', 'Good', '2023-01-01', 'Available'),
('C012', 'B007', 'LB02', 'Good', '2023-01-01', 'Available'),
('C013', 'B008', 'LB03', 'Fair', '2023-01-01', 'Borrowed'),
('C014', 'B009', 'LB04', 'Good', '2023-01-01', 'Available'),
('C015', 'B010', 'LB05', 'Good', '2023-01-01', 'Available'),
('C016', 'B011', 'LB01', 'New', '2023-01-01', 'Available'),
('C017', 'B012', 'LB02', 'Good', '2023-01-01', 'Borrowed'),
('C018', 'B013', 'LB03', 'Good', '2023-01-01', 'Available'),
('C019', 'B014', 'LB04', 'Fair', '2023-01-01', 'Available'),
('C020', 'B015', 'LB05', 'Good', '2023-01-01', 'Borrowed'),
('C021', 'B016', 'LB01', 'Good', '2023-01-01', 'Available'),
('C022', 'B017', 'LB02', 'Poor', '2023-01-01', 'Maintenance'),
('C023', 'B018', 'LB03', 'Good', '2023-01-01', 'Borrowed'),
('C024', 'B019', 'LB04', 'Good', '2023-01-01', 'Available'),
('C025', 'B020', 'LB05', 'Fair', '2023-01-01', 'Available'),
('C026', 'B021', 'LB01', 'Good', '2023-01-01', 'Available'),
('C027', 'B022', 'LB02', 'Good', '2023-01-01', 'Borrowed'),
('C028', 'B023', 'LB03', 'New', '2023-01-01', 'Available'),
('C029', 'B024', 'LB04', 'Good', '2023-01-01', 'Available'),
('C030', 'B015', 'LB05', 'Good', '2023-01-01', 'Available');
#query 26
INSERT INTO LOAN VALUES
('L001', 'B002', 'BR01', 'ST06', '2024-01-01', '2024-01-15', NULL, 'Active'),
('L002', 'B005', 'BR02', 'ST06', '2024-01-05', '2024-01-19', NULL, 'Active'),
('L003', 'B008', 'BR03', 'ST07', '2024-01-10', '2024-01-24', NULL, 'Active'),
('L004', 'B012', 'BR04', 'ST07', '2024-01-15', '2024-01-29', NULL, 'Active'),
('L005', 'B015', 'BR05', 'ST08', '2024-01-20', '2024-02-03', NULL, 'Active'),
('L006', 'B018', 'BR06', 'ST08', '2024-01-21', '2024-02-04', NULL, 'Active'),
('L007', 'B022', 'BR07', 'ST06', '2024-01-22', '2024-02-05', NULL, 'Active'),
('L008', 'B027', 'BR08', 'ST07', '2024-01-23', '2024-02-06', NULL, 'Active'),
('L009', 'B001', 'BR09', 'ST08', '2024-01-05', '2024-01-19', '2024-01-18', 'Returned'),
('L010', 'B003', 'BR10', 'ST06', '2024-01-06', '2024-01-20', '2024-01-19', 'Returned'),
('L011', 'B004', 'BR11', 'ST07', '2024-01-07', '2024-01-21', '2024-01-20', 'Returned'),
('L012', 'B006', 'BR12', 'ST08', '2024-01-08', '2024-01-22', '2024-01-21', 'Returned'),
('L013', 'B007', 'BR13', 'ST06', '2024-01-09', '2024-01-23', '2024-01-22', 'Returned'),
('L014', 'B009', 'BR14', 'ST07', '2024-01-10', '2024-01-24', NULL, 'Overdue'),
('L015', 'B010', 'BR15', 'ST08', '2024-01-11', '2024-01-25', NULL, 'Overdue'),
('L016', 'B011', 'BR01', 'ST06', '2024-01-12', '2024-01-26', '2024-01-25', 'Returned'),
('L017', 'B013', 'BR02', 'ST07', '2024-01-13', '2024-01-27', '2024-01-26', 'Returned'),
('L018', 'B014', 'BR03', 'ST08', '2024-01-14', '2024-01-28', NULL, 'Overdue'),
('L019', 'B016', 'BR04', 'ST06', '2024-01-15', '2024-01-29', '2024-01-28', 'Returned'),
('L020', 'B017', 'BR05', 'ST07', '2024-01-16', '2024-01-30', '2024-01-29', 'Returned'),
('L021', 'B019', 'BR06', 'ST08', '2024-01-17', '2024-01-31', NULL, 'Active'),
('L022', 'B020', 'BR07', 'ST06', '2024-01-18', '2024-02-01', NULL, 'Active'),
('L023', 'B021', 'BR08', 'ST07', '2024-01-19', '2024-02-02', NULL, 'Active'),
('L024', 'B023', 'BR09', 'ST08', '2024-01-20', '2024-02-03', NULL, 'Active'),
('L025', 'B024', 'BR10', 'ST06', '2024-01-21', '2024-02-04', NULL, 'Active'),
('L026', 'B025', 'BR11', 'ST07', '2024-01-22', '2024-02-05', NULL, 'Active'),
('L027', 'B026', 'BR12', 'ST08', '2024-01-23', '2024-02-06', NULL, 'Active'),
('L028', 'B028', 'BR13', 'ST06', '2024-01-24', '2024-02-07', NULL, 'Active'),
('L029', 'B029', 'BR14', 'ST07', '2024-01-25', '2024-02-08', NULL, 'Active'),
('L030', 'B033', 'BR15', 'ST08', '2024-02-15', '2024-03-01', NULL, 'Active');
#query 26
INSERT INTO CATEGORY VALUES
('C001', 'Fiction', 'General fiction works', NULL),
('C002', 'Non-Fiction', 'Non-fiction works', NULL),
('C003', 'Science Fiction', 'Sci-fi and speculative fiction', 'C001'),
('C004', 'Fantasy', 'Fantasy works', 'C001'),
('C005', 'Mystery', 'Mystery and detective works', 'C001'),
('C006', 'Horror', 'Horror and supernatural works', 'C001'),
('C007', 'Biography', 'Biographical works', 'C002'),
('C008', 'History', 'Historical works', 'C002'),
('C009', 'Science', 'Scientific works', 'C002'),
('C010', 'Literature', 'Literary works', 'C001');
#query 27
INSERT INTO BOOK_CATEGORY VALUES
('B001', 'C006'), -- The Shining (Horror)
('B002', 'C004'), -- Harry Potter (Fantasy)
('B003', 'C003'), -- 1984 (Science Fiction)
('B004', 'C010'), -- Pride and Prejudice (Literature)
('B005', 'C010'), -- The Old Man and the Sea (Literature)
('B006', 'C010'), -- Mrs Dalloway (Literature)
('B007', 'C010'), -- One Hundred Years of Solitude (Literature)
('B008', 'C010'), -- Beloved (Literature)
('B009', 'C001'), -- Norwegian Wood (Fiction)
('B010', 'C003'), -- The Handmaid's Tale (Science Fiction)
('B011', 'C004'), -- American Gods (Fantasy)
('B012', 'C010'), -- The House of Spirits (Literature)
('B013', 'C010'), -- Midnight's Children (Literature)
('B014', 'C007'), -- I Know Why the Caged Bird Sings (Biography)
('B015', 'C010'); -- American Pastoral (Literature)
#query 28
INSERT INTO BOOK_AUTHOR VALUES
('B001', 'A001'), -- Stephen King - The Shining
('B002', 'A002'), -- J.K. Rowling - Harry Potter
('B003', 'A003'), -- George Orwell - 1984
('B004', 'A004'), -- Jane Austen - Pride and Prejudice
('B005', 'A005'), -- Hemingway - The Old Man and the Sea
('B006', 'A006'), -- Virginia Woolf - Mrs Dalloway
('B007', 'A007'), -- García Márquez - One Hundred Years of Solitude
('B008', 'A008'), -- Toni Morrison - Beloved
('B009', 'A009'), -- Murakami - Norwegian Wood
('B010', 'A010'), -- Atwood - The Handmaid's Tale
('B011', 'A011'), -- Neil Gaiman - American Gods
('B012', 'A012'), -- Isabel Allende - The House of Spirits
('B013', 'A013'), -- Rushdie - Midnight's Children
('B014', 'A014'), -- Maya Angelou - I Know Why the Caged Bird Sings
('B015', 'A015'); -- Philip Roth - American Pastoral
#query 29
INSERT INTO REVIEW VALUES
('R001', 'B001', 'BR01', 5, 'Excellent book, very engaging!', '2024-01-15'),
('R002', 'B002', 'BR02', 4, 'Great read, highly recommended', '2024-01-20'),
('R003', 'B003', 'BR03', 5, 'A classic masterpiece', '2024-01-25'),
('R004', 'B004', 'BR04', 4, 'Very enjoyable', '2024-01-30'),
('R005', 'B005', 'BR05', 5, 'One of the best books I''ve read', '2024-02-05'),
('R006', 'B006', 'BR06', 3, 'Good but challenging read', '2024-02-10'),
('R007', 'B007', 'BR07', 5, 'Beautiful and mesmerizing', '2024-02-15'),
('R008', 'B008', 'BR08', 4, 'Powerful and moving', '2024-02-20'),
('R009', 'B009', 'BR09', 4, 'Interesting perspective', '2024-02-25'),
('R010', 'B010', 'BR10', 5, 'Thought-provoking', '2024-03-01');
#query 30
UPDATE LOAN 
SET Status = 'Overdue'
WHERE LoanID IN ('L014', 'L015', 'L018', 'L021', 'L022', 'L023', 'L024', 'L025', 'L026', 'L027');
#query 31
UPDATE LOAN 
SET Status = 'Overdue'
WHERE LoanID IN ('L014', 'L015', 'L018');
#query 32
INSERT INTO LOAN VALUES
('L014', 'B002', 'BR01', 'ST06', '2024-01-01', '2024-01-15', NULL, 'Active'),
('L015', 'B005', 'BR02', 'ST06', '2024-01-05', '2024-01-19', NULL, 'Active'),
('L018', 'B008', 'BR03', 'ST07', '2024-01-10', '2024-01-24', NULL, 'Active');
#query 33
UPDATE LOAN 
SET Status = 'Overdue'
WHERE LoanID IN ('L014', 'L015', 'L018');
#query 34
INSERT INTO FINE VALUES
('F001', 'L014', 2.50, 'Pending', '2024-01-25', NULL),
('F002', 'L015', 1.50, 'Paid', '2024-01-26', '2024-01-27'),
('F003', 'L018', 3.00, 'Pending', '2024-01-29', NULL);
#query 35
INSERT INTO FINE VALUES
('F004', 'L014', 2.00, 'Paid', '2024-02-01', '2024-02-02'),
('F005', 'L015', 4.50, 'Pending', '2024-02-02', NULL),
('F006', 'L018', 2.50, 'Waived', '2024-02-03', '2024-02-04'),
('F007', 'L014', 3.50, 'Pending', '2024-02-04', NULL),
('F008', 'L015', 1.50, 'Paid', '2024-02-05', '2024-02-06'),
('F009', 'L018', 2.00, 'Pending', '2024-02-06', NULL),
('F010', 'L014', 1.50, 'Paid', '2024-02-07', '2024-02-08'),
('F011', 'L015', 1.75, 'Pending', '2024-02-08', NULL),
('F012', 'L018', 2.25, 'Pending', '2024-02-08', NULL),
('F013', 'L014', 2.75, 'Pending', '2024-02-09', NULL),
('F014', 'L015', 1.25, 'Waived', '2024-02-09', '2024-02-10'),
('F015', 'L018', 3.25, 'Pending', '2024-02-10', NULL);
#query 36
-- 1. Retrieve subset of columns
-- Q: List all book titles and their publication years
SELECT Title, YEAR(PublicationDate) as PublicationYear
FROM BOOK
ORDER BY PublicationDate;
#query 37
-- 2. Simple condition
-- Q: Which books are currently overdue?
SELECT b.Title
FROM BOOK b
JOIN LOAN l ON b.BookID = l.BookID
WHERE l.Status = 'Overdue';
#query 38
-- 3. Compound condition
-- Q: Find all books that are available and published after 2000
SELECT Title, PublicationDate
FROM BOOK
WHERE Status = 'Available'
AND PublicationDate > '2000-01-01';
#query 39
-- 4. LIKE/IN/BETWEEN operator
-- Q: Find all books published between 1950 and 1960
SELECT Title, PublicationDate
FROM BOOK
WHERE PublicationDate BETWEEN '1950-01-01' AND '1960-12-31';
#query 40
-- 5. Aggregate function
-- Q: What is the average fine amount for each fine status?
SELECT Status, AVG(Amount) as AverageFine, COUNT(*) as FineCount
FROM FINE
GROUP BY Status;
#query 41
-- 6. GROUP BY clause
-- Q: How many books are in each category?
SELECT c.Name as CategoryName, COUNT(bc.BookID) as BookCount
FROM CATEGORY c
LEFT JOIN BOOK_CATEGORY bc ON c.CategoryID = bc.CategoryID
GROUP BY c.CategoryID, c.Name;
#query 42
-- 7. Multiple table joins
-- Q: List all borrowed books with borrower and staff information
SELECT b.Title, 
       CONCAT(br.FirstName, ' ', br.LastName) as Borrower,
       CONCAT(s.FirstName, ' ', s.LastName) as Staff,
       l.LoanDate
FROM BOOK b
JOIN LOAN l ON b.BookID = l.BookID
JOIN BORROWER br ON l.BorrowerID = br.BorrowerID
JOIN STAFF s ON l.StaffID = s.StaffID
WHERE l.Status IN ('Active', 'Overdue');
#query 43
-- 8. IN/EXISTS operator
-- Q: Find authors who have never had their books borrowed
SELECT a.FirstName, a.LastName
FROM AUTHOR a
WHERE NOT EXISTS (
    SELECT 1
    FROM BOOK_AUTHOR ba
    JOIN BOOK b ON ba.BookID = b.BookID
    JOIN LOAN l ON b.BookID = l.BookID
    WHERE ba.AuthorID = a.AuthorID
);
#query 44
-- 9. Subquery
-- Q: What is the title of the book with the highest number of reviews?
SELECT Title
FROM Book
WHERE BookID IN (
    SELECT BookID
    FROM (
        SELECT BookID, COUNT(*) AS ReviewCount
        FROM Review
        GROUP BY BookID
        ORDER BY ReviewCount DESC
        LIMIT 1
    ) AS MostReviewedBooks
);
#query 45
-- 10. Inner/Outer join
-- Q: List all books and their reviews (if any)
SELECT b.Title,
       COALESCE(r.Rating, 0) as Rating,
       COALESCE(r.ReviewText, 'No Review') as Review
FROM BOOK b
LEFT OUTER JOIN REVIEW r ON b.BookID = r.BookID;
#query 46
-- Uses ALL or ANY operators.
-- Question: Find the authors who have written more books than all authors born after 1980.
SELECT a.FirstName, a.LastName
FROM Author a
WHERE (
    SELECT COUNT(*)
    FROM Book_Author ba
    WHERE ba.AuthorID = a.AuthorID
) > ALL (
    SELECT COUNT(*)
    FROM Author a2
    JOIN Book_Author ba2 ON a2.AuthorID = ba2.AuthorID
    WHERE a2.DateOfBirth > '1980-12-31'
    GROUP BY a2.AuthorID
);
