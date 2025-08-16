DELIMITER $$

CREATE PROCEDURE AddSubscriberIfNotExists(IN new_subscriber VARCHAR(100))
BEGIN
    
    DECLARE name_found INT DEFAULT 0;

    
    SELECT COUNT(*) INTO name_found
    FROM Subscribers
    WHERE SubscriberName = new_subscriber;

    
    IF name_found = 0 THEN
        INSERT INTO Subscribers(SubscriberName, SubscriptionDate)
        VALUES (new_subscriber, CURDATE());
    ELSE
       
        SELECT CONCAT('Subscriber "', new_subscriber, '" is already registered.') AS Info;
    END IF;
END$$

DELIMITER ;

-- CALL AddSubscriberIfNotExists('Rachel Green');
 -- CALL AddSubscriberIfNotExists('Chris Adams');