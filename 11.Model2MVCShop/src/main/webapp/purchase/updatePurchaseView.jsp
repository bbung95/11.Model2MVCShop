<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>�������� ����</title>
<!--   jQuery , Bootstrap CDN  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
</script>
<script>
	function fncUpdatePurchase() {

		let name = $('input[name="receiverName"]').val();
		let phone = $('input[name="receiverPhone"]').val();
		let addr = $('input[name="divyAddr"]').val();

		if (name == null || name.length < 1) {
			alert("�����ڸ��� �Է����ּ���.")
			return;
		}
		if (phone == null || phone.length < 1) {
			alert("��ȣ�� �Է����ּ���.");
			return;
		}
		if (addr == null || addr.length < 1) {
			alert("�ּҸ� �Է����ּ���.");
			return;
		}

		$('form').attr('method', 'POST').attr('action',
				'/purchase/updatePurchase').submit();
	}
	$(function() {

		$('button:contains("�� ��")').on('click', function() {
			fncUpdatePurchase();
		});

		$('a[role="button"]:contains("�� ��")').on('click', function() {
			$('form')[0].reset();
		});

	});

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

		<h1 class="bg-default text-center">�������� ����</h1>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
			<input type="hidden" name="tranNo" value="${purchase.tranNo}" />
			<div class="form-group">
				<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">������
					���̵�</label>
				<div class="col-sm-4">${purchase.buyer.userId}</div>
			</div>

			<div class="form-group">
				<label for="password" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��ȣ</label>
				<div class="col-sm-4">${purchase.purchaseProd.prodNo }</div>
			</div>

			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
				<div class="col-sm-4">
					<input type="text" name="receiverName"
						value="${purchase.receiverName}" class="ct_input_g form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�����ڿ���ó</label>
				<div class="col-sm-4">
					<input type="text" name="receiverPhone"
						value="${purchase.receiverPhone}" class="ct_input_g form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label>
				<div class="col-sm-4">
					<input type="text" name="divyAddr" value="${purchase.divyAddr}"
						class="ct_input_g form-control" />
				</div>
			</div>

			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
				<div class="col-sm-4">
					<input type="text" name="divyRequest"
						class="ct_input_g form-control" value="${purchase.divyRequest}" />
				</div>
			</div>

			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">����������</label>
				<div class="col-sm-4">
					<input type="text" id="datepicker" name="divyDate"
						class="ct_input_g form-control" autocomplete="off"/>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button class="btn btn-default">�� ��</button>
					<a class="btn btn-default btn" href="#" role="button">�� ��</a>
				</div>
			</div>
		</form>
		<!-- form Start /////////////////////////////////////-->

	</div>

</body>
</html>