<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>B.O.A.R.D</title>
<link rel="stylesheet" href="/resource/css/style.css?${millis }">
</head>
<body>
	<h1>목록</h1>
	<a href="/board/list?arr=writed">등록순</a>|<a href="/board/list?arr=views">조회순</a>|<a href="/board/list?arr=likes">추천순</a>
	<div class="moim-replys">
	<table>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
					<th>조회</th>
					<th>추천</th>
				</tr>
				<c:forEach items="${list }" var="li">
						<tr>
							<td>${li.boardId }</td>
							<td><a href="/board/detail?boardId=${li.boardId }">${li.title }</a></td>
							<td width="15%">${li.writer }</td>
							<td><fmt:formatDate
									value="${li.writed }" pattern="yyyy.MM.dd" /></td>
							<td width="10%">${li.views }</td>
							<td width="10%">${li.likes }</td>
						</tr>
				</c:forEach>
			</table>
	</div>
</body>
</html>