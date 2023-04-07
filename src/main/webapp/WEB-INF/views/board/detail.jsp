<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BOARD</title>
<link rel="stylesheet" href="/resource/css/style.css?${millis }">
</head>
<body>
	<div style="border-bottom: solid 1px black">
		<h1>${board.title }</h1>
		<c:choose>
			<c:when test="${empty board.boardPass }">
				<div>
					<a href="/board/check?boardId=${board.boardId }&case=1">수정</a> |
					<a href="/board/check?boardId=${board.boardId }&case=2">삭제</a>
				</div>				
			</c:when>
			<c:otherwise>
				<c:if test="${SessionScope.logon }">
					<c:if test="${logonUser.getid eq board.userId }">
						<div>
							<a href="/board/modify?boardId=${board.boardId }">수정</a> |
							<a href="/board/delete?boardId=${board.boardId }">삭제</a>
						</div>		
					</c:if>
				</c:if>
			</c:otherwise>
		</c:choose>
		조회수${board.views } | 추천${board.likes }
		<br/>
		${board.writer } | ${board.writed }
	</div>
	<div>
		${board.content }
	</div>
</body>