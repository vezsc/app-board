<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="root" style="text-align: center">
		<h2>글을 삭제하시겠습니까?</h2>
		<a href="/board/delete-task?boardId=${boardId }"><button>예</button></a> / 
		<a href="/board/detail?boardId=${boardId }"><button>아니요</button></a>
	</div>

</body>
</html>