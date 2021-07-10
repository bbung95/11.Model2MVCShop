<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<title>Ȩ</title>

<meta charset="EUC-KR">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--   jQuery , Bootstrap CDN  -->
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

	// ����ȭ�� ��ũ��
	$(function() {

		var loading = false;
		let page = 1;
		const pageSize = 6;
		const pageUnit = 5;

		$(window).scroll(
				function() {
					console.log(page);
					if ($(document).height() - $(window).height() == $(window)
							.scrollTop()) {

						if (!loading) {
							loading = true;
							mainProduct();
						} else {
							alert("�ε����Դϴ�.");
						}
					}
				});

		function mainProduct() {

			$
					.ajax({
						url : "/product/json/listProduct/" + pageSize + "/"
								+ pageUnit + "/" + page,
						method : "POST",
						contentType : "application/json; charset=utf-8",
						dataType : "JSON",
						success : function(data, status) {
							
							// ��ǰ��ü ��½� 1�������� �ٽ� �ʱ�ȭ
							if ((Math.round(data.totalCount / 6)) == page) {
								page = 1;
							}
							//alert(status);
							//alert("ServerData : "+serverData);
							//alert("JSONData : "+data);

							let list = data.list;

							for (var i = 0; i < data.list.length; i++) {
								
								let fileArry = list[i].fileName.split("/");
								
								let displayValue = "<div class='col-sm-6 col-md-4'>"
										+ "<div class='thumbnail' onclick='javascript:fncGetProduct("+list[i].prodNo+")'>"
										+ "<img src='/images/uploadFiles/"+fileArry[0]+"' alt='' style='height: 300px;'>"
										+ "<div class='caption'>"
										+ "<h3>"
										+ list[i].prodName
										+ "</h3>"
										+ "<p>"
										+ list[i].prodDetail + "</p>"
								"</div>"
								"</div>"
								"</div>";
								$('#enters > div').append(displayValue);

							}
							loading = false;
							page++;

						}
					});
		}
		mainProduct();
	});
	
	function fncGetProduct(prodNo){
		
		location.href = "/product/getProduct?prodNo="+prodNo;
	}
	
	// ������  (ajax���� x)
	/* $(function(){
		
		$('#enters').children('.thumbnail').on('click',function(){
			alert("asda");
			let prodNo = $(this).attr('prodno');
			location.href = "/product/getProduct?prodNo="+prodNo;
		});
	}); */
</script>
<!--  CSS �߰� : ���ٿ� ȭ�� ������ ���� �ذ� :  �ּ�ó�� ��, �� Ȯ��-->
<style>
body {
	padding-top: 70px;
}

#enters {
	margin: auto;
}

</style>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />

	<div id="enters" class="container" align="center">
		<div class="row"></div>
	</div>
</body>

</html>