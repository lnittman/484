INSERT INTO USERS SELECT DISTINCT USER_ID, FIRST_NAME, LAST_NAME, YEAR_OF_BIRTH, MONTH_OF_BIRTH, DAY_OF_BIRTH, GENDER FROM USER_INFORMATION;

CREATE OR REPLACE TRIGGER FRIENDS_TRIGGER BEFORE INSERT ON FRIENDS
FOR EACH ROW
DECLARE TEMP NUMBER;
BEGIN
    IF :new.USER1_ID > :new.USER2_ID THEN
        TEMP := :new.USER1_ID;
        :new.USER1_ID := :new.USER2_ID;
        :new.USER2_ID := TEMP;
    END IF;
END;


INSERT INTO FRIENDS SELECT DISTINCT USER1_ID, USER2_ID FROM ARE_FRIENDS;

CREATE OR REPLACE TRIGGER CITIES_TRIGGER BEFORE INSERT ON CITIES
FOR EACH ROW
BEGIN
    SELECT CITIES_SEQUENCE.nextval into :new.CITY_ID from dual;
END;
/

INSERT INTO CITIES (CITY_NAME, STATE_NAME, COUNTRY_NAME)
SELECT DISTINCT HOMETOWN_CITY, HOMETOWN_STATE, HOMETOWN_COUNTRY FROM USER_INFORMATION UNION
SELECT DISTINCT CURRENT_CITY, CURRENT_STATE, CURRENT_COUNTRY FROM USER_INFORMATION UNION
SELECT DISTINCT EVENT_CITY, EVENT_STATE, EVENT_COUNTRY FROM EVENT_INFORMATION;

DELETE FROM CITIES WHERE CITY_NAME IS NULL AND STATE_NAME IS NULL AND COUNTRY_NAME IS NULL; 

INSERT INTO USER_CURRENT_CITY 
SELECT DISTINCT UI.USER_ID, C.CITY_ID
FROM USER_INFORMATION UI, CITIES C
WHERE C.CITY_NAME = UI.CURRENT_CITY AND C.STATE_NAME = UI.CURRENT_STATE AND C.COUNTRY_NAME = UI.CURRENT_COUNTRY;

INSERT INTO USER_HOMETOWN_CITY
SELECT DISTINCT UI.USER_ID, C.CITY_ID
FROM USER_INFORMATION UI, CITIES C
WHERE C.CITY_NAME = UI.HOMETOWN_CITY AND C.STATE_NAME = UI.HOMETOWN_STATE AND C.COUNTRY_NAME = UI.HOMETOWN_COUNTRY;

CREATE OR REPLACE TRIGGER PROGRAMS_TRIGGER BEFORE INSERT ON PROGRAMS
FOR EACH ROW
BEGIN
    SELECT PROGRAMS_SEQUENCE.nextval into :new.PROGRAM_ID from dual;
END;
/

INSERT INTO PROGRAMS (INSTITUTION, CONCENTRATION, DEGREE) SELECT DISTINCT INSTITUTION_NAME, PROGRAM_CONCENTRATION, PROGRAM_DEGREE FROM USER_INFORMATION;

DELETE FROM PROGRAMS WHERE INSTITUTION IS NULL AND CONCENTRATION IS NULL AND DEGREE IS NULL;

INSERT INTO EDUCATION 
SELECT DISTINCT UI.USER_ID, P.PROGRAM_ID, UI.PROGRAM_YEAR
FROM USER_INFORMATION UI, PROGRAMS P
WHERE UI.INSTITUTION_NAME = P.INSTITUTION AND UI.PROGRAM_CONCENTRATION = P.CONCENTRATION AND UI.PROGRAM_DEGREE = P.DEGREE;

INSERT INTO USER_EVENTS
SELECT DISTINCT EI.EVENT_ID, EI.EVENT_CREATOR_ID, EI.EVENT_NAME, EI.EVENT_TAGLINE, EI.EVENT_DESCRIPTION, EI.EVENT_HOST, EI.EVENT_TYPE, EI.EVENT_SUBTYPE, EI.EVENT_LOCATION, C.CITY_ID, EI.EVENT_START_TIME, EI.EVENT_END_TIME
FROM EVENT_INFORMATION EI, CITIES C
WHERE EI.EVENT_CITY = C.CITY_NAME AND EI.EVENT_STATE = C.STATE_NAME AND EI.EVENT_COUNTRY = C.COUNTRY_NAME;

SET AUTOCOMMIT OFF

INSERT INTO ALBUMS SELECT DISTINCT ALBUM_ID, OWNER_ID, ALBUM_NAME, ALBUM_CREATED_TIME, ALBUM_MODIFIED_TIME, ALBUM_LINK, ALBUM_VISIBILITY, COVER_PHOTO_ID FROM PHOTO_INFORMATION;

INSERT INTO PHOTOS SELECT DISTINCT PHOTO_ID, ALBUM_ID, PHOTO_CAPTION, PHOTO_CREATED_TIME, PHOTO_MODIFIED_TIME, PHOTO_LINK FROM PHOTO_INFORMATION;

COMMIT
SET AUTOCOMMIT ON

INSERT INTO TAGS SELECT DISTINCT PHOTO_ID, TAG_SUBJECT_ID, TAG_CREATED_TIME, TAG_X_COORDINATE, TAG_Y_COORDINATE FROM TAG_INFORMATION;

