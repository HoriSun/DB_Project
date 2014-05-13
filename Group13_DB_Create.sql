CREATE DATABASE IF NOT EXISTS DBJob character set UTF8;
USE DBJob;

CREATE TABLE student(
    sid INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    university VARCHAR(45) NOT NULL,
    email VARCHAR(45) NULL,
    phone VARCHAR(45) NOT NULL,
    password VARCHAR(45) NOT NULL,
    PRIMARY KEY (sid));
	
CREATE TABLE job_wanted(
    sid INT NOT NULL,
    jid INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (jid, sid),
    INDEX sid_idx (sid ASC),
    CONSTRAINT sid
        FOREIGN KEY (sid)
        REFERENCES student (sid)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION);

CREATE TABLE enterprise(
    eid INT NOT NULL AUTO_INCREMENT,
    ename VARCHAR(45) NOT NULL,
    phone VARCHAR(45) NOT NULL,
    email VARCHAR(45) NULL,
    password VARCHAR(45) NOT NULL,
    detail_information VARCHAR(200) NULL,
    PRIMARY KEY (eid));

CREATE TABLE job(
    jid INT NOT NULL,
    workplace VARCHAR(45) NULL,
    category VARCHAR(45) NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    payment VARCHAR(45) NULL,
    rec_num INT NULL,
    detail VARCHAR(45) NULL,
    PRIMARY KEY (jid),
    CONSTRAINT jid
        FOREIGN KEY (jid)
        REFERENCES job_wanted (jid)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION);

CREATE TABLE recuiting(
    jid INT NOT NULL AUTO_INCREMENT,
    eid INT NOT NULL,
    PRIMARY KEY (jid),
    CONSTRAINT eid
        FOREIGN KEY (eid)
        REFERENCES enterprise (eid)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION);
