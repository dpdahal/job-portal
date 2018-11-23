CREATE DATABASE jobs;

CREATE TABLE tbl_job_categories(
id int AUTO_INCREMENT PRIMARY KEY,
category_name text,
status int DEFAULT 0
);

CREATE TABLE tbl_companies(
id int AUTO_INCREMENT PRIMARY KEY,
company_name varchar(200) UNIQUE,
company_address varchar(255),
company_contact int(100),
company_optional_contact_number int(100),
company_email varchar(200),
company_username varchar(100) unique,
company_password varchar(100),
company_website varchar(200),
company_logo varchar(100)
);

CREATE TABLE tbl_job_post(
id int AUTO_INCREMENT PRIMARY KEY,
company_name varchar(255),
address varchar(255),
contact_number int (100),
email varchar(100),
position varchar(255),
qualification varchar(100),
experience varchar(100),
openings text,
gender ENUM('male','femail'),
company_logo varchar(100),
documents varchar(200),
description text,
post_date date,
exip_date date,
status int DEFAULT 0

);

CREATE TABLE tbl_job_seekers(
id int AUTO_INCREMENT PRIMARY KEY,
fist_name varchar(50),
middle_name varchar(50),
last_name varchar(50),
gender ENUM('male','female'),
date_of_birth date,
married_status ENUM ('single','married') ,
mobile_number int (20),
telephone_number varchar(30),
current_address varchar(100),
permanent_address varchar(100),
email varchar(100) UNIQUE,
username varchar(100) UNIQUE,
password varchar(100),

);

CREATE TABLE tbl_job_apply(
id int AUTO_INCREMENT PRIMARY KEY,
company_name varchar(100),
email varchar(100) UNIQUE,
field varchar(100) not null,
postion varchar(200),
experience varchar(20),
level varchar(100) not null,
full_name varchar(200),
current_address varchar(100),
permanent_address varchar(100),
type varchar(100),
document_name varchar(100),
description text
);


CREATE TABLE tbl_manage_job_post(
id int AUTO_INCREMENT PRIMARY KEY,
company_id int,
job_category_id int,
job_post_id int,
FOREIGN KEY(company_id) REFERENCES tbl_companies(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(job_category_id) REFERENCES tbl_job_categories(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(job_post_id) REFERENCES tbl_job_post(id) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE tbl_manage_job_apply(
id int AUTO_INCREMENT PRIMARY KEY,
seeker_id int,
apply_id int,
company_id int,
category_id int,
FOREIGN KEY (seeker_id) REFERENCES tbl_job_seekers(id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (apply_id) REFERENCES tbl_job_apply(id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (company_id) REFERENCES tbl_companies(id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (category_id) REFERENCES tbl_job_categories(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tbl_contacts(
id int AUTO_INCREMENT PRIMARY KEY,
name varchar(100),
email varchar(100),
subject varchar(255),
message text,
created_at datetime
);

CREATE TABLE tbl_companies_id(
id int AUTO_INCREMENT PRIMARY KEY,
company_id int,
company_type_id int,
FOREIGN KEY(company_id) REFERENCES tbl_companies(id) on UPDATE CASCADE on DELETE CASCADE,
FOREIGN KEY(company_type_id) REFERENCES tbl_companies_type(id) on UPDATE CASCADE on DELETE CASCADE
);
CREATE TABLE tbl_job_seeker_manage(
id int AUTO_INCREMENT PRIMARY KEY,
category_id int,
seeker_id int,
FOREIGN KEY(category_id) REFERENCES tbl_job_categories(id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(seeker_id) REFERENCES tbl_job_seekers(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tbl_articles(
id int AUTO_INCREMENT PRIMARY KEY,
title text,
image varchar(100),
description text,
created_at datetime,
updated_at datetime
);

CREATE TABLE tbl_manage_articles(
id int AUTO_INCREMENT PRIMARY KEY,
article_id int,
category_id int,
FOREIGN KEY(article_id) REFERENCES tbl_articles(id) on UPDATE CASCADE on DELETE CASCADE,
FOREIGN KEY(category_id) REFERENCES tbl_job_categories(id) on UPDATE CASCADE on DELETE CASCADE

);


CREATE TABLE tbl_payments(
id int AUTO_INCREMENT PRIMARY KEY,
amount int,
payment_date datetime,
payment_status boolean DEFAULT 0
);

CREATE TABLE tbl_manage_payment(
id int AUTO_INCREMENT PRIMARY KEY,
payment_id int,
category_id int,
company_id int,
FOREIGN KEY(payment_id) REFERENCES tbl_payments(id) on UPDATE CASCADE on DELETE CASCADE,
FOREIGN KEY(category_id) REFERENCES tbl_job_categories(id) on UPDATE CASCADE on DELETE CASCADE,
FOREIGN KEY (company_id) REFERENCES tbl_companies(id) on UPDATE CASCADE on DELETE CASCADE
);




