CREATE TABLE tags(
id INT AUTO_INCREMENT PRIMARY KEY,
tag_name VARCHAR(255) UNIQUE
)
;

CREATE TABLE photo_tags(
photo_id INT NOT NULL ,
tag_id INT NOT NULL,
FOREIGN KEY(tag_id) REFERENCES tags(id) ,
FOREIGN KEY(photo_id) REFERENCES photos(id),
PRIMARY KEY(photo_id,tag_id)
);