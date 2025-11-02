-- Search all properties
SELECT propertyID, propertyName, pricePerNight, rooms
FROM Properties

-- View property details
SELECT p.propertyID, p.propertyName, p.pDescription, p.pAddress,
       p.pricePerNight, p.rooms,
       u.fName AS ownerFirstName, u.lName AS ownerLastName
FROM Properties p
JOIN Users u ON p.ownerID = u.userID
WHERE p.propertyID = ?;

-- Add property
INSERT INTO Properties (ownerID, propertyName, pDescription, pAddress, pricePerNight, rooms)
VALUES (1, 'Fake Flat', 'Nice flat', '12 Fake Street, Edinburgh', 95.00, 2);

-- Create booking
INSERT INTO Bookings (propertyID, renterID, startDate, endDate, totalPrice)
VALUES (1, 1, '2025-07-10', '2025-07-12', 190.00);

-- View bookings
SELECT b.bookingID, p.propertyName, b.startDate, b.endDate,
       b.totalPrice, b.bookingStatus
FROM Bookings b
JOIN Properties p ON b.propertyID = p.propertyID
WHERE b.renterID = ?;

-- Approve booking
UPDATE Bookings
SET bookingStatus = 'Approved'
WHERE bookingID = ?;

-- Deny booking
UPDATE Bookings
SET bookingStatus = 'Denied'
WHERE bookingID = ?;

-- Create review
INSERT INTO Reviews (propertyID, renterID, rating, comment)
VALUES (1, 1, 1, 'Very good');

-- Show reviews for property
SELECT r.rating, r.comment, u.fName, u.lName
FROM Reviews r
JOIN Users u ON r.renterID = u.userID
WHERE r.propertyID = ?;
