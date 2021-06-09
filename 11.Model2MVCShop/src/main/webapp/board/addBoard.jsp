<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<title>글 쓰기</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<script>
$(function(){

	$('button:contains("목 록")').on('click',function(){
	
		location.href = "/board/listBoard";
	})
})
</script>
<style>

body{
	padding-top: 30px;
}

pre {
	border: 0;
	background-color: transparent;
}
</style>
</head>
<body>
	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">
			<div class="page-header">
				<h3 class=" text-default">글 쓰기</h3>
			</div>

			<div class="row">
				<div class="col-xs-4 col-md-2">
					<strong>제 목</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					${board.boardName}
				</div>
			</div>

			<hr />

			<div class="row">
				<div class="col-xs-4 col-md-2">
					<strong>내 용</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					<pre style="width: 500px; height: 400px;">${board.boardDetail}</pre>
				</div>
			</div>

			<hr />

			<div align="right">
				<button type="button" class="btn btn-default" style="width: 60px;">목 록</button>
			</div>
	</div>

</body>
</html>