CREATE TABLE comments(
id INT AUTO_INCREMENT PRIMARY KEY,
comment_text VARCHAR(255),
user_id INT NOT NULL,
photo_id INT NOT NULL,
created_at TIMESTAMP DEFAULT NOW(),
FOREIGN KEY (photo_id) REFERENCES photos(id),
FOREIGN KEY (user_id) REFERENCES users(id)
);
