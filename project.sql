CREATE TABLE users (
    user_id INT AUTO_INCREMENT NOT NULL,
    user_name VARCHAR(30) NOT NULL,
    user_gender VARCHAR(10),
    user_birthdate DATE,
    CONSTRAINT users_PK PRIMARY KEY (user_id)
);

CREATE TABLE lending (
    lending_id INT AUTO_INCREMENT NOT NULL,
    lend_date DATE,
    due_date DATE,
    return_date DATE,
    book_id INT,
    user_id INT,
    CONSTRAINT lending_PK PRIMARY KEY (lending_id),
    CONSTRAINT lending_FK1 FOREIGN KEY (book_id) REFERENCES book(book_id),
    CONSTRAINT lending_FK2 FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT NOT NULL,
    publisher_name VARCHAR(30) NOT NULL,
    publisher_location VARCHAR(30),
    CONSTRAINT publisher_PK PRIMARY KEY (publisher_id)
);

CREATE TABLE staff (
    staff_id INT AUTO_INCREMENT NOT NULL,
    staff_FN VARCHAR(15) NOT NULL,
    staff_LN VARCHAR(15) NOT NULL,
    staff_birthdate DATE,
    supervisor_id INT,
    CONSTRAINT staff_PL PRIMARY KEY (staff_id),
    CONSTRAINT staff_FK FOREIGN KEY (supervisor_id) REFERENCES staff(staff_id)
);

CREATE TABLE phonenumber (
    phone_number varchar(12) NOT NULL,
    staff_id INT,
    CONSTRAINT phonenumber_PK PRIMARY KEY (phone_number, staff_id),
    CONSTRAINT phonenumber_FK FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

CREATE TABLE review (
    review_id INT AUTO_INCREMENT NOT NULL,
    review_comment VARCHAR(50),
    review_rating DOUBLE,
    review_date DATE,
    book_id INT,
    user_id INT,
    CONSTRAINT review_PK PRIMARY KEY (review_id),
    CONSTRAINT review_FK1 FOREIGN KEY (book_id) REFERENCES book(book_id),
    CONSTRAINT review_FK2 FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE book (
    book_id INT AUTO_INCREMENT NOT NULL,
    book_title VARCHAR(25) NOT NULL,
    book_isbn VARCHAR(20) NOT NULL,
    book_PublishYear INT,
    book_availability VARCHAR(15),
    staff_id INT,
    publisher_id INT,
    CONSTRAINT book_PK PRIMARY KEY (book_id),
    CONSTRAINT book_FK1 FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
    CONSTRAINT book_FK2 FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);

CREATE TABLE ReadingHistory (
    ReadHistory_id INT AUTO_INCREMENT NOT NULL,
    ReadHistory_StartDate DATE,
    ReadHistory_EndDate DATE,
    ReadHistory_status VARCHAR(15),
    book_id INT,
    user_id INT,
    CONSTRAINT ReadHistory_PK PRIMARY KEY (ReadHistory_id),
    CONSTRAINT ReadHistory_FK1 FOREIGN KEY (book_id) REFERENCES book(book_id),
    CONSTRAINT ReadHistory_FK2 FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE AuthorBook (
    AuthorBook_id INT AUTO_INCREMENT NOT NULL,
    book_id INT,
    author_id INT,
    CONSTRAINT AuthorBook_PK PRIMARY KEY (AuthorBook_id),
    CONSTRAINT AuthorBook_FK1 FOREIGN KEY (book_id) REFERENCES book(book_id),
    CONSTRAINT AuthorBook_FK2 FOREIGN KEY (author_id) REFERENCES author(author_id)
);

CREATE TABLE author (
    author_id INT AUTO_INCREMENT NOT NULL,
    author_name VARCHAR(25) NOT NULL,
    author_biography VARCHAR(25),
    CONSTRAINT author_PK PRIMARY KEY (author_id)
);

CREATE TABLE BookGenres (
    BookGenres_id INT AUTO_INCREMENT NOT NULL,
    book_id INT,
    genres_id INT,
    CONSTRAINT BookGenres_PK PRIMARY KEY (BookGenres_id),
    CONSTRAINT BookGenres_FK1 FOREIGN KEY (book_id) REFERENCES book(book_id),
    CONSTRAINT BookGenres_FK2 FOREIGN KEY (genres_id) REFERENCES genres(genres_id)
);

CREATE TABLE genres (
    genres_id INT AUTO_INCREMENT NOT NULL,
    genres_name VARCHAR(25) NOT NULL,
    CONSTRAINT genres_PK PRIMARY KEY (genres_id)
);
