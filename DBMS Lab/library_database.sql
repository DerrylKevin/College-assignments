
CREATE TABLE PUBLISHER (
    NAME VARCHAR2(20) PRIMARY KEY,
    PHONE INTEGER,
    ADDRESS VARCHAR2(20)
);

CREATE TABLE BOOK (
    BOOK_ID INTEGER PRIMARY KEY,
    TITLE VARCHAR2(20),
    PUB_YEAR VARCHAR2(20),
    PUBLISHER_NAME REFERENCES PUBLISHER(NAME) ON DELETE CASCADE
);

CREATE TABLE BOOK_AUTHORS (
    AUTHOR_NAME VARCHAR2(20),
    BOOK_ID REFERENCES BOOK(BOOK_ID) ON DELETE CASCADE,
    PRIMARY KEY(BOOK_ID, AUTHOR_NAME)
);

CREATE TABLE LIBRARY_PROGRAM (
    PROGRAM_ID INTEGER PRIMARY KEY,
    PROGRAM_NAME VARCHAR2(50),
    ADDRESS VARCHAR2(50)
);

CREATE TABLE BOOK_COPIES (
    NO_OF_COPIES INTEGER,
    BOOK_ID REFERENCES BOOK(BOOK_ID) ON DELETE CASCADE,
    PROGRAM_ID REFERENCES LIBRARY_PROGRAM(PROGRAM_ID) ON DELETE CASCADE,
    PRIMARY KEY (BOOK_ID, PROGRAM_ID)
);

CREATE TABLE BOOK_LENDING (
    DATE_OUT DATE,
    DUE_DATE DATE,
    CARD_NO INTEGER,
    BOOK_ID REFERENCES BOOK(BOOK_ID) ON DELETE CASCADE,
    PROGRAM_ID REFERENCES LIBRARY_PROGRAM(PROGRAM_ID) ON DELETE CASCADE,
    PRIMARY KEY(BOOK_ID, PROGRAM_ID, CARD_NO)
);


INSERT INTO PUBLISHER VALUES('MCGRAW-HILL', 9989076589, 'BANGALORE');
INSERT INTO PUBLISHER VALUES('PEARSON', 9889076565, 'NEWDELHI');
INSERT INTO PUBLISHER VALUES('RANDOM HOUSE', 74556793459, 'HYDERABAD');
INSERT INTO PUBLISHER VALUES('HACHETTE LIVRE', 8970862340, 'CHENNAI');
INSERT INTO PUBLISHER VALUES('GRUPOPLANETA', 775620238, 'BANGALORE');
SELECT * FROM PUBLISHER;

INSERT INTO BOOK VALUES (1, 'DBMS', 'JAN-2017', 'MCGRAW-HILL');
INSERT INTO BOOK VALUES (2, 'ADBMS', 'JUNE-2016', 'MCGRAW-HILL');
INSERT INTO BOOK VALUES (3, 'CN', 'SEP-2016', 'PEARSON');
INSERT INTO BOOK VALUES (4, 'CG', 'NOV-2015', 'GRUPOPLANETA');
INSERT INTO BOOK VALUES (5, 'OS', 'MAY-2016', 'PEARSON');
SELECT * FROM BOOK;

INSERT INTO BOOK_AUTHORS VALUES ('NAVATHE', 1);
INSERT INTO BOOK_AUTHORS VALUES ('NAVATHE', 2);
INSERT INTO BOOK_AUTHORS VALUES ('TANENBAUM', 3);
INSERT INTO BOOK_AUTHORS VALUES ('EDWARDANGEL', 4);
INSERT INTO BOOK_AUTHORS VALUES ('GALVIN', 5);
SELECT * FROM BOOK_AUTHORS;

INSERT INTO LIBRARY_PROGRAM VALUES (10, 'RR NAGAR', 'BANGALORE');
INSERT INTO LIBRARY_PROGRAM VALUES (11, 'RNSIT', 'BANGALORE');
INSERT INTO LIBRARY_PROGRAM VALUES (12, 'RAJAJI NAGAR', 'BANGALORE');
INSERT INTO LIBRARY_PROGRAM VALUES (13, 'NITTE', 'MANGALORE');
INSERT INTO LIBRARY_PROGRAM VALUES (14, 'MANIPAL', 'UDUPI');
SELECT * FROM LIBRARY_PROGRAM;

INSERT INTO BOOK_COPIES VALUES (10, 1, 10);
INSERT INTO BOOK_COPIES VALUES (5, 1, 11);
INSERT INTO BOOK_COPIES VALUES (2, 2, 12);
INSERT INTO BOOK_COPIES VALUES (5, 2, 13);
INSERT INTO BOOK_COPIES VALUES (7, 3, 14);
INSERT INTO BOOK_COPIES VALUES (1, 5, 10);
INSERT INTO BOOK_COPIES VALUES (3, 4, 11);
SELECT * FROM BOOK_COPIES;

INSERT INTO BOOK_LENDING VALUES ('01-JAN-2017', '01-JUN-17', 101, 1, 10);
INSERT INTO BOOK_LENDING VALUES ('11-JAN-2017', '11-MAR-17', 101, 3, 14);
INSERT INTO BOOK_LENDING VALUES ('21-FEB-2017', '21-APR-17', 101, 2, 13);
INSERT INTO BOOK_LENDING VALUES ('15-MAR-2017', '15-JUL-17', 101, 4, 11);
INSERT INTO BOOK_LENDING VALUES ('12-APR-2017', '12-MAY-17', 104, 4, 11);
SELECT * FROM BOOK_LENDING;


SELECT B.BOOK_ID, B.TITLE, B.PUBLISHER_NAME, A.AUTHOR_NAME, C.NO_OF_COPIES, L.PROGRAM_ID 
FROM BOOK B, BOOK_AUTHORS A, BOOK_COPIES C, LIBRARY_PROGRAM L
WHERE B.BOOK_ID = A.BOOK_ID AND B.BOOK_ID = C.BOOK_ID AND L.PROGRAM_ID = C.PROGRAM_ID;

SELECT CARD_NO 
FROM BOOK_LENDING 
WHERE DATE_OUT BETWEEN '01-JAN-2017' AND '01-JUL-2017'
GROUP BY CARD_NO HAVING COUNT (*) > 3;

DELETE FROM BOOK
WHERE BOOK_ID = 3;
SELECT * FROM BOOK;

CREATE VIEW V_PUBLICATION AS SELECT PUB_YEAR FROM BOOK;
SELECT * FROM V_PUBLICATION;

CREATE VIEW V_BOOKS AS  SELECT B.BOOK_ID , B.TITLE, C.NO_OF_COPIES FROM BOOK B, BOOK_COPIES C, LIBRARY_PROGRAM L 
WHERE B.BOOK_ID = C.BOOK_ID AND C.PROGRAM_ID = L.PROGRAM_ID;
SELECT * FROM V_BOOKS;








