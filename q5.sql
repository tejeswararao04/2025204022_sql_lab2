DELIMITER $$

CREATE PROCEDURE ShowAllSubscribersHistory()
BEGIN
   
    DECLARE sub_id_now INT;

    
    DECLARE finished_flag INT DEFAULT 0;

   
    DECLARE sub_cursor CURSOR FOR
        SELECT SubscriberID FROM Subscribers;

  
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished_flag = 1;

  
    OPEN sub_cursor;

    loop_subs: LOOP
        
        FETCH sub_cursor INTO sub_id_now;

       
        IF finished_flag = 1 THEN
            LEAVE loop_subs;
        END IF;

      
        SELECT SubscriberName AS `Current_Subscriber`
        FROM Subscribers
        WHERE SubscriberID = sub_id_now;

       
        CALL GetWatchHistoryBySubscriber(sub_id_now);
    END LOOP;

    
    CLOSE sub_cursor;
END$$

DELIMITER ;

-- CALL ShowAllSubscribersHistory();
