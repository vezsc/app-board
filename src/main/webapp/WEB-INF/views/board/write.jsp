<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>B.O.R.A.D</title>
</head>
<body>
	<div style="text-align: center">
	<div>
	<h2>디지털컨비전스-<small>공공데이터융합 자바 웹개발자 양성 과정</small></h2>
	
	<p>개발공부를 하면서 몰랐던 것이나 고민이 있다면 글을 남겨주세요</p>
	</div>
	
	<c:if test="${param.cause eq 'error' }">
		글의 양식이 맞지 않습니다. 다시 작성해주세요
	</c:if>
	<form action="/board/write-task" method="post">
		<c:if test="${!sessionScope.logon }">
			<input type="text" name="writer" placeholder="닉네임"/> | <input type="password" name="boardPass" placeholder="비밀번호"/>
		</c:if>
		<div>
		</div>
		<div>
			<input type="text" name="title" placeholder="제목을 입력해주세요"/>
		</div>
		<div>
			<textarea cols="100" rows="10" name="content" placeholder="내용을 입력해주세요"></textarea>
		</div>
		<div align="right">
			<button>등록</button>
		</div>
	</form>
	</div>
</body>
</html>