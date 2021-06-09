<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- ToolBar Start /////////////////////////////////////-->
<div class="navbar  navbar-inverse navbar-fixed-top">

	<div class="container">

		<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>

		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
			<button class="navbar-toggle collapsed" data-toggle="collapse"
				data-target="#target">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<!-- toolBar Button End //////////////////////// -->

		<!--  dropdown hover Start -->
		<div class="collapse navbar-collapse" id="target"
			data-hover="dropdown"
			data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">

			<!-- Tool Bar �� �پ��ϰ� ����ϸ�.... -->
			<ul class="nav navbar-nav">

				<!--  ȸ������ DrowDown -->
				<c:if test="${!empty sessionScope.user }">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false"> <span>ȸ������</span>
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="#">����������ȸ</a></li>

							<c:if test="${sessionScope.user.role == 'admin'}">
								<li><a href="#">ȸ��������ȸ</a></li>
							</c:if>

							<li class="divider"></li>
							<li><a href="#">etc...</a></li>
						</ul></li>
				</c:if>
				<!-- �ǸŻ�ǰ���� DrowDown  -->
				<c:if test="${sessionScope.user.role == 'admin'}">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false"> <span>�ǸŻ�ǰ����</span>
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="#">�Ǹų���</a></li>
							<li><a href="#">�ǸŻ�ǰ���</a></li>
							<li><a href="#">�ǸŻ�ǰ����</a></li>
							<li class="divider"></li>
							<li><a href="#">etc..</a></li>
						</ul></li>
				</c:if>

				<!-- ���Ű��� DrowDown -->
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"> <span>��ǰ����</span>
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="#">�� ǰ �� ��</a></li>

						<c:if test="${sessionScope.user.role == 'user'}">
							<li><a href="#">�����̷���ȸ</a></li>
						</c:if>

						<li><a href="#">�ֱٺ���ǰ</a></li>
						<li class="divider"></li>
						<li><a href="#">etc..</a></li>
					</ul></li>

				<li><a href="#">�Խ���</a></li>
			</ul>

			<div class="collapse navbar-collapse" id="target">
				<ul class="nav navbar-nav navbar-right">

					<c:if test="${!empty sessionScope.user}">

						<li><a href="#">�α׾ƿ�</a></li>
					</c:if>
					<c:if test="${empty sessionScope.user}">
						<li><a href="#">ȸ������</a></li>
						<li><a href="#">�� �� ��</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<!-- dropdown hover END -->

</div>
</div>
<!-- ToolBar End /////////////////////////////////////-->



<script type="text/javascript">
	
	function history() {
		popWin = window
				.open(
						"/history.jsp",
						"popWin",
						"left=400, top=300, width=400, height=300, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
	}

	//============= logout Event  ó�� =============	
	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a:contains('�α׾ƿ�')").on("click", function() {
			$(self.location).attr("href", "/user/logout");
			//self.location = "/user/logout"
		});
	});

	//============= ȸ��������ȸ Event  ó�� =============	
	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a:contains('ȸ��������ȸ')").on("click", function() {
			//$(self.location).attr("href","/user/logout");
			self.location = "/user/listUser"
		});
	});

	//=============  ����������ȸȸ Event  ó�� =============	
	$("a:contains('����������ȸ')").on(
			"click",
			function() {
				//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$(self.location).attr("href",
						"/user/getUser?userId=${sessionScope.user.userId}");
			});

	$("a:contains('ȸ������')").on("click", function() {

		location.href = "/user/addUserView.jsp";
	});
	
	$("a:contains('�� �� ��')").on("click", function() {

		//location.href = "/user/loginView.jsp";
		popWin = window
		.open(
				"/user/loginView.jsp",
				"popWin",
				"left=460, top=300, width=460, height=300, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
	});
	
	$("a:contains('�� ǰ �� ��')").on("click", function() {

		location.href = "/product/listProduct?menu=search";
	});

	$("a:contains('�Խ���')").on("click", function() {

		location.href = "/board/listBoard";
	});

	$("a:contains('�ֱٺ���ǰ')").on("click", function() {

		history();
	});

	$("a:contains('�����̷���ȸ')").on("click", function() {

		location.href = "/purchase/listPurchase";
	});

	$("a:contains('�Ǹų���')").on("click", function() {

		location.href = "/purchase/listSale";
	});

	$("a:contains('�ǸŻ�ǰ���')").on("click", function() {

		location.href = "/product/addProduct";
	});

	$("a:contains('�ǸŻ�ǰ����')").on("click", function() {

		location.href = "/product/listProduct?menu=manage";
	});
</script>
