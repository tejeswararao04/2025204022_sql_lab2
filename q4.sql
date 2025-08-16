DELIMITER $$

CREATE PROCEDURE SendWatchTimeReport()
BEGIN

    DECLARE current_sub INT;

    DECLARE no_more_rows INT DEFAULT 0;

    DECLARE all_subs CURSOR FOR
        SELECT SubscriberID FROM Subscribers;


    DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = 1;

    
    OPEN all_subs;

    check_loop: LOOP
        
        FETCH all_subs INTO current_sub;

        
        IF no_more_rows = 1 THEN
            LEAVE check_loop;
        END IF;

        
        IF (SELECT COUNT(*) FROM WatchHistory WHERE SubscriberID = current_sub) > 0 THEN
            CALL GetWatchHistoryBySubscriber(current_sub);
        END IF;
    END LOOP;

    
    CLOSE all_subs;
END$$

DELIMITER ;

-- CALL SendWatchTimeReport();