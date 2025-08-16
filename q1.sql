create database lab2;
use  lab2;

CREATE TABLE Shows (
ShowID INT PRIMARY KEY,
Title VARCHAR(100),
Genre VARCHAR(50),
ReleaseYear INT
);
CREATE TABLE Subscribers (
SubscriberID INT PRIMARY KEY,
SubscriberName VARCHAR(100),
SubscriptionDate DATE
);
CREATE TABLE WatchHistory (
HistoryID INT PRIMARY KEY,
ShowID INT,
SubscriberID INT,
WatchTime INT,
FOREIGN KEY (ShowID) REFERENCES Shows(ShowID),
FOREIGN KEY (SubscriberID) REFERENCES
Subscribers(SubscriberID)
);

INSERT INTO Shows (ShowID, Title, Genre, ReleaseYear) VALUES
(1, 'Stranger Things', 'Sci-Fi', 2016),
(2, 'The Crown', 'Drama', 2016),
(3, 'The Witcher', 'Fantasy', 2019);

INSERT INTO Subscribers (SubscriberID, SubscriberName,
SubscriptionDate) VALUES
(1, 'Emily Clark', '2023-01-10'),
(2, 'Chris Adams', '2023-02-15'),
(3, 'Jordan Smith', '2023-03-05');

INSERT INTO WatchHistory (HistoryID, SubscriberID, ShowID,
WatchTime) VALUES
(1, 1, 1, 100),
(2, 1, 2, 10),
(3, 2, 1, 20),
(4, 2, 2, 40),
(5, 2, 3, 10),
(6, 3, 2, 10),
(7, 3, 1, 10);

DELIMITER $$
CREATE PROCEDURE ListAllSubscribers()
BEGIN
    DECLARE no_more_data INT DEFAULT 0;
    DECLARE sub_name_holder VARCHAR(100);
    DECLARE sub_cursor CURSOR FOR
        SELECT SubscriberName FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_data = 1;
    OPEN sub_cursor;
    fetch_loop: LOOP
        FETCH sub_cursor INTO sub_name_holder;
        IF no_more_data = 1 THEN
            LEAVE fetch_loop;
        END IF;
    END LOOP;
    CLOSE sub_cursor;
END$$
DELIMITER ;

-- CALL ListAllSubscribers();