CREATE TABLE BOOKLENDING
(DATEOUT DATE,
DUEDATE DATE,
BID REFERENCES BOOK(BID) ON DELETE CASCADE,
BRANCHID REFERENCES LIBRARY_BRANCH(BRANCHID) ON DELETE CASCADE,
CARDNO REFERENCES CARD(CARDNO) ON DELETE CASCADE,
PRIMARY KEY (BID,BRANCHID,CARDNO));