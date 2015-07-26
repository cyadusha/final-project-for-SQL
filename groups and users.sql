DROP TABLE users_and_groups
DROP TABLE rooms_and_users
DROP TABLE groups_and_rooms

CREATE TABLE users_and_groups
(User_Name varchar(50),
Group_Name varchar(50))

INSERT INTO users_and_groups --many to one relationship because although some users belong to the same group, each user can be assigned to only one group.
VALUES
('Modesto', 'IT'),('Chris','Sales'),('Heidi', ''),('Saulat','Administrator'), 
('Cheong','Sales'),('Ayine','IT')

SELECT * FROM users_and_groups 

CREATE TABLE rooms_and_users
(Room varchar(50), User_Name varchar(50))

INSERT INTO rooms_and_users --many to many relationship because some rooms have more than one group of users and viceversa.
VALUES
('101','Modesto'),
('Auditorium B','None'),('101','Ayine'),('102','Chris'),('Auditorium A','Chris'),
('102','Ayine'),('102','Modesto'),('Auditorium A','Cheong'),('102','Cheong')

SELECT * FROM rooms_and_users

CREATE TABLE groups_and_rooms
(Group_Name varchar(50), Room varchar(50))

INSERT INTO groups_and_rooms --many to many relationship because some rooms have more than one group assigned and viceversa.
VALUES
('IT','101'),('Sales','102'),('Administrator',''),('Operations',''),('IT','102'),
('Sales','Auditorium A')

SELECT * FROM groups_and_rooms

SELECT DISTINCT --all groups and the users in each group
groups_and_rooms.Group_Name,  
users_and_groups.User_Name 
FROM groups_and_rooms
LEFT JOIN users_and_groups
ON groups_and_rooms.Group_Name = users_and_groups.Group_Name
ORDER BY Group_Name, User_Name

SELECT DISTINCT --all rooms and the groups assigned to each room 
rooms_and_users.Room,
users_and_groups.Group_Name
FROM rooms_and_users
LEFT JOIN users_and_groups
ON rooms_and_users.User_Name = users_and_groups.User_Name
ORDER BY Room, Group_Name

SELECT DISTINCT --users, groups, and rooms with users in alpha order
users_and_groups.User_Name,
users_and_groups.Group_Name,
groups_and_rooms.Room
FROM users_and_groups
LEFT JOIN groups_and_rooms
ON users_and_groups.Group_Name = groups_and_rooms.Group_Name
ORDER BY User_Name

SELECT DISTINCT --users, groups, and rooms with groups in alpha order
users_and_groups.User_Name,
users_and_groups.Group_Name,
groups_and_rooms.Room
FROM users_and_groups
LEFT JOIN groups_and_rooms
ON users_and_groups.Group_Name = groups_and_rooms.Group_Name
ORDER BY Group_Name

SELECT DISTINCT --users, groups, and rooms with rooms in alpha order
users_and_groups.User_Name,
users_and_groups.Group_Name,
groups_and_rooms.Room
FROM users_and_groups
LEFT JOIN groups_and_rooms
ON users_and_groups.Group_Name = groups_and_rooms.Group_Name
ORDER BY Room

