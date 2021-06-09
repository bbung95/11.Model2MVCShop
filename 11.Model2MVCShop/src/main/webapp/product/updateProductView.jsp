<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>��ǰ���� ����</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<script type="text/javascript" src="../javascript/calendar.js">
	
</script>
<script type="text/javascript">
	function fncUpdateProduct() {
		//Form ��ȿ�� ����

		let name = $('input[name="prodName"]').val();
		let detail = $('textarea[name="prodDetail"]').val();
		let manuDate = $('input[name="manuDate"]').val();
		let price = $('input[name="price"]').val();

		if (name == null || name.length < 1) {
			alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if (detail == null || detail.length < 5) {
			alert("��ǰ�������� 5���� �̻� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if (manuDate == null || manuDate.length < 1) {
			alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if (price == null || price.length < 1) {
			alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}

		$('form').attr('method', 'POST').attr('action',
				'/product/updateProduct').submit();
	}

	function fncDeleteProduct() {

		if (confirm("��ǰ�� �����Ͻðڽ��ϱ�?")) {
			alert("��ǰ�� �����Ǿ����ϴ�.");
			$('form').attr('method', 'POST').attr('action',
					'/product/deleteProduct').submit();
		}
	}
	
	$(function(){
		
		$('button:contains("�� ��")').on('click', function(){
			
			fncUpdateProduct();
		})
		
		$('a[role="button"]:contains("�� ��")').on('click', function(){
			
			fncDeleteProduct();
		})
		
		$('a[role="button"]:contains("�� ��")').on('click', function(){
			
			$('form')[0].reset();
		})
	})
	
		// jQuery �޷�
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : 'yy-mm-dd'
		});

	});
</script>
<style>
body {
	padding-top: 50px;
}

body>div.container {
	border: 0.5px solid;
	margin-top: 30px;
}
</style>
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">

		<h1 class="bg-default text-center">��ǰ���� ����</h1>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
			<input type="hidden" name="prodNo" value="${product.prodNo }"/>
			<div class="form-group">
				<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̸�</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="prodName"
						value="${product.prodName}" />
				</div>
			</div>

			<div class="form-group">
				<label for="password" class="col-sm-offset-1 col-sm-3 control-label">����</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="price"
						value="${product.price}" />
				</div>
			</div>

			<div class="form-group">
				<label for="userName" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="manuDate"
						id="datepicker" autocomplete="off" value="${product.manuDate}" />
				</div>
			</div>

			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">��ǰ����</label>
				<div class="col-sm-4">
					<textarea class="form-control col-sm-5" rows="5" name="prodDetail"
						value="${product.prodDetail }" style="resize: none;"></textarea>
				</div>
			</div>

			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�̹�������</label>
				<div class="col-sm-4">
					<input type="file" name="file" class="ct_input_g form-control"
						multiple="multiple" value="${product.fileName }" />
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button class="btn btn-default">�� ��</button>
					<a class="btn btn-default btn" href="#" role="button">�� ��</a> 
					<a class="btn btn-default btn" href="#" role="button">�� ��</a>
				</div>
			</div>
		</form>
		<!-- form Start /////////////////////////////////////-->

	</div>
</body>
</html>