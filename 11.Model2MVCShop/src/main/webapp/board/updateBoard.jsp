<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<title>�� ����</title>

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
	function fncUpdateBoard() {

		let name = $('input[name="boardName"]').val();
		let detail = $('textarea').val();

		if (name == null || name.length < 1) {
			alert("������ �Է����ּ���.");
			return;
		}
		if (detail == null || detail.length < 5) {
			alert("5���� �̻� �Է����ּ���.");
			return;
		}

		$('form').attr('method', 'POST').attr('action', '/board/updateBoard')
				.submit();
	}
	
	$(function(){
		
		$('button:contains("�� ��")').on('click',function(){
			
			fncUpdateBoard();
		})
		
		$('button:contains("�� ��")').on('click',function(){
				
			histroy.go(-1);
		})
	})
	
</script>
<style>
body {
	padding-top: 30px;
}
</style>
</head>
<body>
	<jsp:include page="/layout/toolbar.jsp" />
	<div class="container">
		<form>
			<input type="hidden" name="userId" value="${user.userId}" />
			<input type="hidden" name="boardNo" value="${board.boardNo }"/>
			<div class="page-header">
				<h3 class=" text-default">�� ����</h3>
			</div>

			<div class="row">
				<div class="col-xs-4 col-md-2">
					<strong>�� ��</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					<input class="form-control" type="text" name="boardName"
						style="width: 500px;" value="${board.boardName }" />
				</div>
			</div>

			<hr />

			<div class="row">
				<div class="col-xs-4 col-md-2">
					<strong>�� ��</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					<textarea class="form-control" name="boardDetail"
						style="resize: none; height: 300px; width: 500px;">${board.boardDetail }</textarea>
				</div>
			</div>

			<hr />

			<div align="right">
				<button type="button" class="btn btn-default" style="width: 60px;">�� ��</button>
				<button type="button" class="btn btn-default" style="width: 60px;">�� ��</button>
			</div>
		</form>
	</div>
</body>
</html>