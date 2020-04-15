create table authors 
(
ID			varchar(5),
name			varchar(15),
primary key (ID)
);

create table books
(
ISBN			varchar(10),
bookName		varchar(15),
version			numeric(3,2),
genre			varchar(10),
pages			numeric(3,0),
price			numeric(5,2),
publisherPercentage	numeric(4,2),
primary key (ISBN)
);

create table writes
(
ID			varchar(5),
ISBN			varchar(10),
primary key (ID, ISBN),
foreign key (ID) references authors (ID),
foreign key (ISBN) references books (ISBN)
);

create table bookDetails
(
bookQuantityID		varchar(5),
amountSold		numeric(3,0),
amountLeft		numeric(3,0),
primary key (bookQuantityID)
);

create table quantity
(
ISBN			varchar(10),
bookQuantityID		varchar(5),
primary key (ISBN, bookQuantityID),
foreign key (bookQuantityID) references bookDetails (bookQuantityID),
foreign key (ISBN) references books (ISBN)
);

create table publishers
(
ID			varchar(5),
name			varchar(15),
primary key (ID)
);

create table bk_publisher
(
ISBN			varchar(10),
publisherID		varchar(5),
primary key (ISBN, publisherID),
foreign key (ISBN) references books (ISBN),
foreign key (publisherID) references publishers (ID)
);

create table phoneNumbers
(
number			varchar(10),
primary key (number)
);

create table pub_number
(
publisherID		varchar(5),
number			varchar(10),
primary key (number),
foreign key (number) references phoneNumbers (number),
foreign key (publisherID) references publishers (ID)
);

create table bankingDetails
(
accountNumber		varchar(10),
branchID		varchar(5),
branchName		varchar(10),
primary key (accountNumber)
);

create table pub_banking
(
publisherID		varchar(5),
accountNumber		varchar(10),
primary key (publisherID),
foreign key (publisherID) references publishers (ID),
foreign key (accountNumber) references bankingDetails (accountNumber)
);

create table details
(
email			varchar(20),
name			varchar(15),
primary key (email)
);

create table pub_details
(
publisherID		varchar(5),
email			varchar(20),
primary key (publisherID, email),
foreign key (publisherID) references publishers (ID),
foreign key (email) references details (email)
);

create table addresses
(
addressID		varchar(5),
streetAddress		varchar(15),
city			varchar(15),
province		varchar(15),
postalCode		varchar(6),
country			varchar(15),
primary key (addressID)
);

create table pub_address
(
publisherID		varchar(5),
addressID		varchar(5),
primary key (publisherID, addressID),
foreign key (publisherID) references publishers (ID),
foreign key (addressID) references addresses (addressID)
);

create table tracks
(
trackingNumber		varchar(5),
quantity		numeric(3,0),
primary key (trackingNumber)
);

create table users
(
ID			varchar(5),
username		varchar(15),
password		varchar(15),
primary key (ID, username),
unique (ID)
);

create table tracking
(
trackingNumber		varchar(5),
userID			varchar(5),
ISBN			varchar(10),
primary key (trackingNumber, userID, ISBN),
foreign key (ISBN) references books (ISBN),
foreign key (trackingNumber) references tracks (trackingNumber),
foreign key (userID) references users (ID)
);

create table user_details
(
ID			varchar(5),
email			varchar(20),
primary key (ID, email),
foreign key (email) references details (email),
foreign key (ID) references users (ID)
);

create table user_shipping
(
addressID		varchar(5),
userID			varchar(5),
primary key (addressID, userID),
foreign key (userID) references users (ID),
foreign key (addressID) references addresses (addressID)
);

create table user_billing
(
addressID		varchar(5),
userID			varchar(5),
primary key (addressID, userID),
foreign key (userID) references users (ID),
foreign key (addressID) references addresses (addressID)
);
