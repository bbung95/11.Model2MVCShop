<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<title>상품등록</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--   jQuery , Bootstrap CDN  -->
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
<style>
body {
	padding-top: 50px;
}

body>div.container {
	border: 0.5px solid;
	margin-top: 30px;
}
</style>
<script type="text/javascript">
	function fncAddProduct() {
		//Form 유효성 검증

		let name = $('input[name="prodName"]').val();
		let detail = $('textarea[name="prodDetail"]').val();
		let manuDate = $('input[name="manuDate"]').val();
		let price = $('input[name="price"]').val();

		alert(name + ":" + detail + ":" + manuDate + ":" + price);

		if (name == null || name.length < 1) {
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if (detail == null || detail.length < 5) {
			alert("상품상세정보를 5글자 이상 입력하여야 합니다.");
			return;
		}
		if (manuDate == null || manuDate.length < 1) {
			alert("제조일자는 반드시 입력하셔야 합니다.");
			return;
		}
		if (price == null || price.length < 1) {
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}

		$('form').attr('method', 'POST').attr('action', '/product/addProduct')
				.submit();
	}

	$(function() {

		$('button:contains("등 록")').on('click', function() {
			fncAddProduct();
		});

		$('a[role="button"]:contains("취 소")').on('click', function() {
			$('form')[0].reset();
		});

	});

	// jQuery 달력
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : 'yy-mm-dd'
		});

	});
</script>
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">

		<h1 class="bg-default text-center">상 품 등 록</h1>

		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">

			<div class="form-group">
				<label for="userId" class="col-sm-offset-1 col-sm-3 control-label">상품이름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="prodName"
						placeholder="상품이름">
				</div>
			</div>

			<div class="form-group">
				<label for="password" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="price"
						placeholder="가격">
				</div>
			</div>

			<div class="form-group">
				<label for="userName" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="manuDate"
						id="datepicker" autocomplete="off" />
				</div>
			</div>

			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">상품정보</label>
				<div class="col-sm-4">
					<textarea class="form-control col-sm-5" rows="5" name="prodDetail"
						placeholder="상품정보" style="resize: none;"></textarea>
				</div>
			</div>

			<div class="form-group">
				<label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">이미지선택</label>
				<div class="col-sm-4">
					<input type="file" name="file" class="ct_input_g form-control"
						multiple="multiple" />
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button class="btn btn-default">등 록</button>
					<a class="btn btn-default btn" href="#" role="button">취 소</a>
				</div>
			</div>
		</form>
		<!-- form Start /////////////////////////////////////-->

	</div>

</body>
</html>
