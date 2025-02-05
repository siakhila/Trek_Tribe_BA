**🏕️ Trek Tribe - Travel Companion Finder**

**🚀 Project Overview**

Trek Tribe is a database-driven travel companion finder designed to connect users based on shared travel interests and destinations. It allows users to create profiles, set up travel plans, send companion requests, and match with others securely.

This project focuses on the database structure and SQL implementation, ensuring efficient data management and retrieval.

🏗️ Features

**User Profile Creation:** Users can create detailed profiles with travel preferences.

**Travel Plans:** Users can set up travel itineraries and search for companions.

**Matching Algorithm:** Connects users based on travel interests, location, and preferences.

**Secure Communication:** In-app messaging and video calls for safe interactions.

**Subscription Model:** Free basic features with premium options for enhanced search filters.

**TrekTribe**

│── /database/TT.sql       # SQL schema and queries for the database
│── /docs                  # Project documentation (e.g., business rules, ERD, reports)
│── README.md              # Project details and setup instructions
│── LICENSE                # License information

🏗️ Database Schema

This project follows a relational database model with key entities:

**USER**: Stores user details.

**PROFILE:** Additional personal information linked to users.

**TRAVEL_PLAN:** Represents user travel plans.

**TRAVEL_COMPANION:** Connects users based on travel preferences.

**REQUEST:** Manages travel companion requests.

**MATCH:** Stores successful travel partnerships.

🔗 Entity Relationships

**One-to-One:** USER → PROFILE

**One-to-Many:** USER → TRAVEL_PLAN

**Many-to-Many:** USER ↔ TRAVEL_COMPANION

**Request Handling:** REQUEST tracks travel requests between users.

📊 Database Implementation

**🛠️ Setup Instructions**

Clone the Repository
git clone https://github.com/yourusername/TrekTribe.git
cd TrekTribe

**Import the SQL Database**

 - Open MySQL/PostgreSQL
 - Execute the SQL file:
SOURCE /path/to/TT.sql;

**Verify Database Tables**

SHOW TABLES;

**📌 Key SQL Queries**

**Search for Travel Companions**

SELECT U.username, T.destination, T.dates, T.preferred_activities
FROM USER AS U
JOIN TRAVEL_PLAN AS T ON U.user_id = T.user_id
WHERE T.destination = 'Paris';

**Create a Travel Plan**

INSERT INTO TRAVEL_PLAN (user_id, destination, dates, preferred_activities)
VALUES (1, 'Rome', '2023-09-15', 'Exploring historical sites');

**Accept a Travel Companion Request**

UPDATE REQUEST 
SET status = 'Accepted' 
WHERE request_id = 1;

**Retrieve Match Data**

SELECT U.username, T.destination
FROM USER AS U
JOIN MATCH AS M ON U.user_id = M.user_id1 OR U.user_id = M.user_id2
JOIN TRAVEL_PLAN AS T ON M.user_id1 = U.user_id OR M.user_id2 = U.user_id
WHERE U.user_id = 1;


👥 Contributors

Akhila Singaraju - https://github.com/siakhila
