SELECT E.sid FROM Enrolled E
JOIN Course C on C.cid = E.cid 
WHERE C.title = 'EECS484'
INTERSECT
SELECT E.sid FROM Enrolled E
JOIN Course C on C.cid = E.cid 
WHERE C.title = 'EECS485'
UNION
SELECT E.sid FROM Enrolled E
JOIN Course C on C.cid = E.cid 
WHERE C.title = 'EECS482'
INTERSECT
SELECT E.sid FROM Enrolled E
JOIN Course C on C.cid = E.cid 
WHERE C.title = 'EECS486'
UNION
SELECT E.sid FROM Enrolled E
JOIN Course C on C.cid = E.cid 
WHERE C.title = 'EECS281'
