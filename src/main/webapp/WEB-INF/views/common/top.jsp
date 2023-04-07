<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div style="width: 100vw">
<c:choose>
	<c:when test="${sessionScope.logon }">
		<div
			class="block-row" style="justify-content: space-between;">
			<div
				style="padding: 10px 20px; display: flex; align-items: center; gap: 10px">
				<a href="/">홈</a> <a href="/board/write">작성하기</a> <a
					href="/board/list">전체글</a>
			</div>
			<div
				style="padding: 10px 20px; display: flex; align-items: center; gap: 10px">
				 <b style="text-align: right;" >${logonUser.nick }님</b>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div style="display: flex; justify-content: flex-end; width: 100%;">
			<div style="padding: 10px 20px;">
				<a href="/user/login">로그인</a>
			</div>
		</div>
	</c:otherwise>
</c:choose>
</div>
<div>
	<h2>디지털컨비전스-<small>공공데이터융합 자바 웹개발자 양성 과정</small></h2>
</div>


