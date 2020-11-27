CREATE DATABASE Instagram;

USE Instagram;
CREATE TABLE users(
id INT auto_increment PRIMARY KEY,
username varchar(255) UNIQUE NOT NULL,
created_at timestamp DEFAULT NOW()
) ;
