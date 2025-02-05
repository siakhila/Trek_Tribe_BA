CREATE TABLE `USER` (
    `user_id` INT AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL
);

CREATE TABLE `PROFILE` (
    `profile_id` INT AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT NOT NULL,
    `full_name` VARCHAR(255),
    `gender` VARCHAR(255),
    `age` INT,
    FOREIGN KEY (`user_id`) REFERENCES `USER`(`user_id`)
);

CREATE TABLE `TRAVEL_PLAN` (
    `plan_id` INT AUTO_INCREMENT PRIMARY KEY,
    `destination` VARCHAR(255),
    `dates` DATE,
    `preferred_activities` TEXT
);

CREATE TABLE `REQUEST` (
    `request_id` INT AUTO_INCREMENT PRIMARY KEY,
    `from_user` INT NOT NULL,
    `to_user` INT NOT NULL,
    `status` VARCHAR(255),
    FOREIGN KEY (`from_user`) REFERENCES `USER`(`user_id`),
    FOREIGN KEY (`to_user`) REFERENCES `USER`(`user_id`)
);

CREATE TABLE `MATCH` (
    `match_id` INT AUTO_INCREMENT PRIMARY KEY,
    `user_id1` INT NOT NULL,
    `user_id2` INT NOT NULL,
    FOREIGN KEY (`user_id1`) REFERENCES `USER`(`user_id`),
    FOREIGN KEY (`user_id2`) REFERENCES `USER`(`user_id`)
);


INSERT INTO `USER` (`username`, `email`) VALUES ('User1', 'user1@email.com');
INSERT INTO `USER` (`username`, `email`) VALUES ('User2', 'user2@email.com');


INSERT INTO `PROFILE` (`user_id`, `full_name`, `gender`, `age`) VALUES (1, 'John Doe', 'Male', 30);
INSERT INTO `PROFILE` (`user_id`, `full_name`, `gender`, `age`) VALUES (2, 'Jane Smith', 'Female', 28);


INSERT INTO `TRAVEL_PLAN` (`destination`, `dates`, `preferred_activities`) VALUES ('Paris', '2023-07-15', 'Sightseeing');
INSERT INTO `TRAVEL_PLAN` (`destination`, `dates`, `preferred_activities`) VALUES ('New York', '2023-08-20', 'Business Meetings');


INSERT INTO `REQUEST` (`from_user`, `to_user`, `status`) VALUES (1, 2, 'Pending');
INSERT INTO `REQUEST` (`from_user`, `to_user`, `status`) VALUES (2, 1, 'Accepted');


INSERT INTO `MATCH` (`user_id1`, `user_id2`) VALUES (1, 2);


SELECT U.username, T.destination, T.dates, T.preferred_activities
FROM USER AS U
JOIN PROFILE AS P ON U.user_id = P.user_id
JOIN `MATCH` AS M ON U.user_id = M.user_id1 OR U.user_id = M.user_id2
JOIN TRAVEL_PLAN AS T ON M.user_id1 = U.user_id OR M.user_id2 = U.user_id
WHERE T.destination = 'Paris' AND T.preferred_activities LIKE '%Sightseeing%';


SELECT U.username, T.destination, T.dates, T.preferred_activities
FROM USER AS U
JOIN `MATCH` AS M ON U.user_id = M.user_id1 OR U.user_id = M.user_id2
JOIN TRAVEL_PLAN AS T ON M.user_id1 = U.user_id OR M.user_id2 = U.user_id
WHERE U.user_id = 1;

INSERT INTO TRAVEL_PLAN (destination, dates, preferred_activities)
VALUES ('Rome', '2023-09-15', 'Exploring historical sites');

INSERT INTO REQUEST (from_user, to_user, status)
VALUES (2, 1, 'Pending');

UPDATE REQUEST
SET status = 'Accepted'
WHERE request_id = 1;

SELECT COUNT(*) AS match_count
FROM `MATCH`
WHERE (user_id1 = 1 AND user_id2 = 2) OR (user_id1 = 2 AND user_id2 = 1);

SELECT U.username, P.gender, P.age, T.destination, T.preferred_activities
FROM USER AS U
JOIN PROFILE AS P ON U.user_id = P.user_id
JOIN `MATCH` AS M ON U.user_id = M.user_id1 OR U.user_id = M.user_id2
JOIN TRAVEL_PLAN AS T ON M.user_id1 = U.user_id OR M.user_id2 = U.user_id;

SELECT T.destination, COUNT(*) AS match_count
FROM TRAVEL_PLAN AS T
JOIN `MATCH` AS M ON T.plan_id = M.user_id1 OR T.plan_id = M.user_id2
GROUP BY T.destination;

SELECT R.status, COUNT(*) AS request_count
FROM REQUEST AS R
GROUP BY R.status;

SELECT CASE
       WHEN R.status = 'Accepted' THEN 'Matched'
       ELSE 'Not Matched'
       END AS match_status,
       COUNT(*) AS match_count
FROM REQUEST AS R
GROUP BY match_status;

SELECT P.age, COUNT(*) AS user_count
FROM PROFILE AS P
GROUP BY P.age;




