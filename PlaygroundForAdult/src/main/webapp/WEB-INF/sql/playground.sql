
SELECT *
		FROM Member m
	INNER JOIN MEMBER_INFO mi ON m._UniqueID = mi._USERUNIQUEID
	LEFT JOIN WEB_FILE wf ON m._UniqueID = wf._UniqueID
		WHERE m._ID = 'test11' AND m._STATE = 'true'

SELECT mb.*, mbinfo.*, wfile.*
			FROM MEMBER mb
	INNER JOIN MEMBER_INFO mbinfo ON mb._UniqueID = mbinfo._UniqueID
	LEFT JOIN WEB_FILE wfile ON mb._UniqueID = wfile._UniqueID
			WHERE mb._UniqueID = 3


// 이미지 파일
select * 
FROM WEB_FILE
WHERE board_no is null


// 게시물 파일
select b.* , f.*
FROM board b
left join WEB_FILE f ON b.no = f.no
WHERE f.board_no is not null
AND
