<%@ page language="java" contentType="text/html; charset=EUC-kr"
	pageEncoding="EUC-kr"%>
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

<!-- ���ӳ�Ʈ �߰��� -->
<script src="/summernote/summernote-lite.js"></script>
<script src="/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/summernote/summernote-lite.css">


<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<script type="text/javascript" src="../javascript/calendar.js">
	
</script>

<script type="text/javascript">
	function fncAddBoard() {

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

		$('form').attr('method', 'POST').attr('action', '/board/addBoard')
				.submit();
	}

	$(function() {

		$('button:contains("�� ��")').on('click', function() {

			fncAddBoard();
		});

		$('button:contains("�� ��")').on('click', function() {

			$('form')[0].reset();
		});

	});
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
			<div class="page-header">
				<h3 class=" text-default">�� ����</h3>
			</div>

			<div class="row">
				<div class="col-xs-4 col-md-2">
					<strong>�� ��</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					<input class="form-control" type="text" name="boardName"
						style="width: 300px;" />
				</div>
			</div>
			<div class="row">
				<textarea class="summernote" name="boardDetail"></textarea>
			</div>
			<div align="right">
				<button type="button" class="btn btn-default" style="width: 60px;">�� ��</button>
				<button type="button" class="btn btn-default" style="width: 60px;">�� ��</button>
			</div>
		</form>
	</div>
	<script>
		$('.summernote').summernote(
				{
					height : 500,
					lang : "ko-KR",
					focus : true,
					toolbar : [
							// �۲� ����
							[ 'fontname', [ 'fontname' ] ],
							// ���� ũ�� ����
							[ 'fontsize', [ 'fontsize' ] ],
							// ����, ����Ӳ�, ����,��� ��, ���������
							[
									'style',
									[ 'bold', 'italic', 'underline',
											'strikethrough', 'clear' ] ],
							// ���ڻ�
							[ 'color', [ 'forecolor', 'color' ] ],
							// ǥ�����
							[ 'table', [ 'table' ] ],
							// �۸Ӹ� ��ȣ, ��ȣ�ű��, ��������
							[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
							// �ٰ���
							[ 'height', [ 'height' ] ],
							// �׸�÷��, ��ũ�����, ������÷��
							[ 'insert', [ 'picture', 'link', 'video' ] ],
							// �ڵ庸��, Ȯ���ؼ�����, ����
							[ 'view', [ 'codeview', 'fullscreen', 'help' ] ] ],
					// �߰��� �۲�
					fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS',
							'Courier New', '���� ���', '�ü�', '����ü', '����', '����ü',
							'����ü' ],
					// �߰��� ��Ʈ������
					fontSizes : [ '8', '9', '10', '11', '12', '14', '16', '18',
							'20', '22', '24', '28', '30', '36', '50', '72' ]
				});
	</script>

	<%-- <div class="container">
		<form>
			<input type="hidden" name="userId" value="${user.userId}" />

			<div class="page-header">
				<h3 class=" text-default">�� ����</h3>
			</div>

			<div class="row">
				<div class="col-xs-4 col-md-2">
					<strong>�� ��</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					<input class="form-control" type="text" name="boardName"
						style="width: 500px;" />
				</div>
			</div>

			<hr />

			<div class="row">
				<div class="col-xs-4 col-md-2">
					<strong>�� ��</strong>
				</div>
				<div class="col-xs-8 col-md-4">
					<textarea class="form-control" name="boardDetail"
						style="resize: none; height: 300px; width: 500px;"></textarea>
				</div>
			</div>

			<hr />

			<div align="right">
				<button type="button" class="btn btn-default" style="width: 60px;">��
					��</button>
				<button type="button" class="btn btn-default" style="width: 60px;">��
					��</button>
			</div>
		</form>
	</div> --%>
</body>
</html>
