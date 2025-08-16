DELIMITER $$

CREATE PROCEDURE GetWatchHistoryBySubscriber(IN sub_id INT)
BEGIN

    SELECT 
        s.Title AS Show_Title,
        s.Genre AS Show_Genre,
        w.WatchTime AS Minutes_Watched
    FROM WatchHistory w
    JOIN Shows s ON w.ShowID = s.ShowID
    WHERE w.SubscriberID = sub_id;
END$$

DELIMITER ;

-- CALL GetWatchHistoryBySubscriber(2);