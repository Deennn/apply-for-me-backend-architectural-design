
DROP DATABASE IF EXISTS APPLY_FOR_ME;

CREATE DATABASE APPLY_FOR_ME;
USE APPLY_FOR_ME;



CREATE TABLE IF NOT EXISTS APPLIER
(
    id              BIGINT NOT NULL AUTO_INCREMENT,

    user_id         INT    NOT NULL,
    professional_id INT    NOT NULL,
    member_id       int    not null,
    primary key (id)

);


CREATE TABLE IF NOT EXISTS PROFESSIONAL (
                                            id BIGINT NOT NULL AUTO_INCREMENT,
                                            available_for_interview BOOL NOT NULL DEFAULT false,

                                            user_id INT NOT NULL,
                                            member_id int not null,

                                            primary key (id)
    );


CREATE TABLE IF NOT EXISTS PROFESSIONAL_PROFILE (
	`id` BIGINT AUTO_INCREMENT,


CREATE TABLE IF NOT EXISTS PROFESSIONAL_ATTACHMENT (
                                                       id BIGINT NOT NULL AUTO_INCREMENT,
                                                       passport_link VARCHAR(400) NOT NULL,
    resume_link VARCHAR(400) NOT NULL,
    cover_letter_link VARCHAR(400) NOT NULL,
    date_of_birth DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    professional_id INT NOT NULL,
    primary key (id)
    );

CREATE TABLE IF NOT EXISTS PROFESSIONAL_METADATA (
                                                     id BIGINT NOT NULL AUTO_INCREMENT,
                                                     salary_range VARCHAR(30) NOT NULL,
    country_of_residence VARCHAR(150) NOT NULL,
    nationality VARCHAR(150) NOT NULL,
    preferred_job_location_type VARCHAR(150) NOT NULL,
    job_seniority VARCHAR(150) NOT NULL,
    desired_job_title VARCHAR(150) NOT NULL,
    industry VARCHAR(150) NOT NULL,
    years_of_experience VARCHAR(50) NOT NULL,
    linkedin_link VARCHAR(300) NULL,
    other_link_1 VARCHAR(300),
    other_link_2 VARCHAR(300) NULL,
    hobbies VARCHAR(300) NOT NULL,
    other_comment TEXT NULL,
    other_skills TEXT NULL,
    created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    professional_id INT NOT NULL,
    primary key (id)
    );


CREATE TABLE IF NOT EXISTS MEMBER (
                                      id BIGINT NOT NULL AUTO_INCREMENT,
                                      first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    nationality VARCHAR(150) NOT NULL,
    date_of_birth DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    job_title VARCHAR(150) NOT NULL,
    email_address VARCHAR(50) NOT NULL,
    password TEXT NOT NULL,
    active BOOL NOT NULL DEFAULT true,
    created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    primary key (id)
    );


CREATE TABLE IF NOT EXISTS JOB_SUBMISSION (
                                              id BIGINT NOT NULL AUTO_INCREMENT,
                                              job_title VARCHAR(300) NOT NULL,
    job_link VARCHAR(300) NOT NULL,
    other_comment TEXT NOT NULL,
    created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    professional_id INT NOT NULL,
    applier_id INT NOT NULL,
    primary key (id)
    );

	`profile_title` VARCHAR(300) NOT NULL,
	`main_profile` BOOLEAN NOT NULL DEFAULT FALSE,

	`passport_link` VARCHAR(400) NOT NULL,
	`resume_link` VARCHAR(400) NOT NULL,
	`cover_letter_link` VARCHAR(400) NOT NULL,

	`salary_range` VARCHAR(30) NOT NULL,
 	`preferred_job_location_type` VARCHAR(150) NOT NULL,
 	`job_seniority` VARCHAR(150) NOT NULL,
 	`desired_job_title` VARCHAR(150) NOT NULL,

   	`industry` VARCHAR(150) NULL,
 	`years_of_experience` INT NULL,
  	`other_comment` TEXT NULL,
 	`other_skills` TEXT NULL,
	`created_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

  	`professional_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);


CREATE TABLE IF NOT EXISTS MEMBER (
	`id` BIGINT AUTO_INCREMENT,
	`first_name` VARCHAR(40) NOT NULL,
 	`last_name` VARCHAR(40) NOT NULL,
 	`nationality_id` INT NOT NULL,
 	`country_of_residence_id` INT NOT NULL
	`date_of_birth` DATE NOT NULL DEFAULT CURRENT_DATE,
  	`current_job_title` VARCHAR(200) NOT NULL,
  	`phone_number` VARCHAR(15) NOT NULL,
  	`email_address` VARCHAR(50) NOT NULL,
  	`password` TEXT NOT NULL,
  	`avatar` VARCHAR(300) NOT NULL,
  	`active` BOOLEAN NOT NULL DEFAULT TRUE,
  	`created_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

	PRIMARY KEY (`id`)
);


CREATE TABLE IF NOT EXISTS JOB_SUBMISSION (
	`id` BIGINT AUTO_INCREMENT,
  	`job_title` VARCHAR(300) NOT NULL,
  	`job_link` VARCHAR(300) NOT NULL,
  	`other_comment` TEXT NOT NULL,
  	`created_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

  	`professional_id` INT NOT NULL,
  	`applier_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);


CREATE TABLE IF NOT EXISTS COUNTRY (
	`id` BIGINT AUTO_INCREMENT,
  	`title` VARCHAR(300) NOT NULL,
  	`abbreviation` VARCHAR(10) NOT NULL,
  	`created_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updated_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,


CREATE TABLE IF NOT EXISTS MEMBER_ROLE (
                                           id BIGINT NOT NULL,
                                           title VARCHAR(200) NOT NULL,

    member_id INT NOT NULL,
    primary key (id)
    );


CREATE TABLE IF NOT EXISTS ROLES (
	`id` BIGINT AUTO_INCREMENT,
  	`title` VARCHAR(200) NOT NULL,

	PRIMARY KEY (`id`)
);



ALTER TABLE PROFESSIONAL
    ADD CONSTRAINT professional_member_id
        FOREIGN KEY (`member_id`)
            REFERENCES MEMBER (id);



ALTER TABLE `MEMBER`
    ADD UNIQUE `email_phone_uq` (`email_address`, `phone_number`);

ALTER TABLE `MEMBER_ROLES`
    ADD UNIQUE `member_role_uq` (`member_id`, `role_id`);

ALTER TABLE `MEMBER`
    ADD CONSTRAINT `nationality_fk`
        FOREIGN KEY (`nationality_id`)
            REFERENCES `COUNTRY` (`id`)
                ON DELETE SET NULL
                ON UPDATE SET NULL;

ALTER TABLE `MEMBER`
    ADD CONSTRAINT `country_of_residence_fk`
        FOREIGN KEY (`country_of_residence_id`)
            REFERENCES `COUNTRY` (`id`)
                ON DELETE SET NULL
                ON UPDATE SET NULL;

ALTER TABLE `APPLIER`
    ADD CONSTRAINT `member_fk`
        FOREIGN KEY (`member_id`)
            REFERENCES `MEMBER` (`id`)
                ON DELETE CASCADE
                ON UPDATE CASCADE;

ALTER TABLE `APPLIER`
    ADD CONSTRAINT `professional_fk`
        FOREIGN KEY (`professional_id`)
            REFERENCES `PROFESSIONAL` (`id`)
                ON DELETE SET NULL
                ON UPDATE CASCADE;

ALTER TABLE `PROFESSIONAL`
    ADD CONSTRAINT `member_fk`
        FOREIGN KEY (`member_id`)
            REFERENCES `MEMBER` (`id`)
                ON DELETE CASCADE
                ON UPDATE CASCADE;

ALTER TABLE PROFESSIONAL_PROFILE
    ADD CONSTRAINT `professional_fk`
        FOREIGN KEY (`professional_id`)
            REFERENCES PROFESSIONAL (`id`)
                ON DELETE CASCADE
                ON UPDATE CASCADE;

ALTER TABLE JOB_SUBMISSION
    ADD CONSTRAINT `professional_fk`
        FOREIGN KEY (`professional_id`)
            REFERENCES PROFESSIONAL (`id`);

ALTER TABLE JOB_SUBMISSION
    ADD CONSTRAINT `applier_fk`
        FOREIGN KEY (`applier_id`)
            REFERENCES APPLIER (`id`);

ALTER TABLE MEMBER_ROLES
    ADD CONSTRAINT `role_fk`
        FOREIGN KEY (`role_id`)
            REFERENCES `ROLES` (`id`)
                ON DELETE CASCADE
                ON UPDATE CASCADE;

ALTER TABLE MEMBER_ROLES
    ADD CONSTRAINT `member_fk`
        FOREIGN KEY (`member_id`)
            REFERENCES `MEMBER` (`id`)
                ON DELETE CASCADE
                ON UPDATE CASCADE;