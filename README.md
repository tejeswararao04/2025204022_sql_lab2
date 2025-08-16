# 2025204022_sql_lab2



Lab 2 - MySQL Activity

Paila Tejeswara Rao
2025204022

Github link: https://github.com/tejeswararao04/2025204022_sql_lab2.git

Steps to execute the scripts:

1. Open MySQL Workbench or MySQL command-line client.
2. Connect to your database.
3. Run the following commands one by one to load each script:

   SOURCE q1.sql;
   SOURCE q2.sql;
   SOURCE q3.sql;
   SOURCE q4.sql;
   SOURCE q5.sql;

4. After loading the procedures, you can execute them using:

   CALL ListAllSubscribers();
   CALL GetWatchHistoryBySubscriber(<subscriber_id>);
   CALL AddSubscriberIfNotExists('New Subscriber Name');
   CALL SendWatchTimeReport();
   CALL ShowAllSubscribersHistory();

