<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/board/check-task">
	<input type="hidden" name="caseCheck" value="${caseCheck }"/>
	<input type="hidden" name="boardId" value="${boardId }"/>
		<div class="root">
			<h3>비밀번호를 입력해주세요.</h3>
			<input type="password" placeholder="비밀번호" name="pass"/>
			<button>전송</button>
			<c:if test="${param.cause eq 'error' }">
				<p>비밀번호가 틀렸습니다.</p>
			</c:if>
		</div>
	</form>

</body>
</html>