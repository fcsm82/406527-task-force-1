CREATE DATABASE taskforce
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE taskforce;

CREATE TABLE categories (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

CREATE TABLE cities (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(85) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (name)
);

CREATE TABLE locations (
    id INT NOT NULL AUTO_INCREMENT,
    city_id INT NOT NULL,
    latitude DECIMAL (8, 6),
    longtitude DECIMAL (9, 6),
    PRIMARY KEY (id)
);

ALTER TABLE locations
    ADD FOREIGN KEY (city_id)
      REFERENCES cities(id);

CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    email VARCHAR(254) NOT NULL,
    password VARCHAR(32) NOT NULL,
    name VARCHAR(254) NOT NULL,
    avatar VARCHAR(255),
    birthday DATETIME,
    phone VARCHAR(11),
    skype VARCHAR(50),
    telegram VARCHAR(50) NOT NULL,
    bio TEXT,
    last_online_time DATETIME,
    location_id INT,
    is_performer TINYINT NOT NULL DEFAULT 0,
    rejected_jobs INT DEFAULT NULL,
    is_visible TINYINT NOT NULL DEFAULT 0,
    is_favourite TINYINT NOT NULL DEFAULT 0,
    portfolio VARCHAR(255),
    orders_number INT DEFAULT 0,
    rating DECIMAL DEFAULT 0,
    popularity INT DEFAULT 0,
    PRIMARY KEY (id),
    UNIQUE (email)
);

ALTER TABLE users
    ADD FOREIGN KEY (location_id)
        REFERENCES locations(id);

CREATE TABLE notifications (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    feedback TINYINT NOT NULL DEFAULT 0,
    chat TINYINT NOT NULL DEFAULT 0,
    refuse TINYINT NOT NULL DEFAULT 0,
    start TINYINT NOT NULL DEFAULT 0,
    finish TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY (id)
);

ALTER TABLE notifications
  ADD FOREIGN KEY (user_id)
        REFERENCES users (id);

CREATE TABLE users_categories (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE users_categories
  ADD FOREIGN KEY (user_id)
        REFERENCES users(id);

ALTER TABLE users_categories
  ADD FOREIGN KEY (category_id)
        REFERENCES categories(id);

CREATE TABLE files (
  id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    task_id INT NOT NULL,
    path VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

ALTER TABLE files
    ADD FOREIGN KEY (user_id)
      REFERENCES users(id);

ALTER TABLE files
    ADD FOREIGN KEY (user_id)
      REFERENCES users(id);

CREATE TABLE tasks (
    id INT NOT NULL AUTO_INCREMENT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    name VARCHAR(255) NOT NULL,
    details TEXT NOT NULL,
    category_id INT NOT NULL,
    file_id INT NOT NULL,
    location_id INT,
    description TEXT,
    budget INT DEFAULT NULL,
    user_id INT NOT NULL,
    performer_id INT DEFAULT NULL,
    due_date DATETIME DEFAULT NULL,
    status TINYINT NOT NULL DEFAULT 0,
    PRIMARY KEY (id)
);

ALTER TABLE tasks
  ADD FOREIGN KEY (file_id)
        REFERENCES files(id);

ALTER TABLE tasks
  ADD FOREIGN KEY (category_id)
        REFERENCES categories(id);

ALTER TABLE tasks
  ADD FOREIGN KEY (location_id)
        REFERENCES locations(id);

ALTER TABLE tasks
  ADD  FOREIGN KEY (user_id)
        REFERENCES users(id);

ALTER TABLE tasks
  ADD  FOREIGN KEY (performer_id)
        REFERENCES users(id);

CREATE TABLE tasks_files (
  id INT NOT NULL AUTO_INCREMENT,
    task_id INT NOT NULL,
    file_id INT NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE tasks_files
  ADD FOREIGN KEY (task_id)
        REFERENCES tasks(id);

ALTER TABLE tasks_files
  ADD FOREIGN KEY (file_id)
        REFERENCES files(id);

CREATE TABLE responses (
    id INT NOT NULL AUTO_INCREMENT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    task_id INT NOT NULL,
    performer_id INT NOT NULL,
    comment TEXT,
    price INT,
    PRIMARY KEY (id)
);

ALTER TABLE responses
  ADD FOREIGN KEY (task_id)
        REFERENCES tasks(id);

ALTER TABLE responses
        ADD FOREIGN KEY (performer_id)
      REFERENCES users(id);

CREATE TABLE chats (
    id INT NOT NULL AUTO_INCREMENT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    task_id INT NOT NULL,
    sender_id INT NOT NULL,
    recipient_id INT NOT NULL,
    message TEXT NOT NULL,
    is_read TINYINT DEFAULT 0,
    PRIMARY KEY (id)
);

ALTER TABLE chats
  ADD FOREIGN KEY (sender_id)
        REFERENCES users(id);

ALTER TABLE chats
  ADD FOREIGN KEY (recipient_id)
        REFERENCES users (id);

ALTER TABLE chats
  ADD  FOREIGN KEY (task_id)
        REFERENCES tasks(id);

CREATE TABLE feedbacks (
    id INT NOT NULL AUTO_INCREMENT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    user_id INT NOT NULL,
    reviewer_id INT NOT NULL,
    task_id INT NOT NULL,
    feedback TEXT,
    rating TINYINT NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE feedbacks
  ADD FOREIGN KEY (user_id)
        REFERENCES users(id);

ALTER TABLE feedbacks
  ADD FOREIGN KEY (reviewer_id)
        REFERENCES users(id);

ALTER TABLE feedbacks
  ADD FOREIGN KEY (task_id)
        REFERENCES tasks(id);
