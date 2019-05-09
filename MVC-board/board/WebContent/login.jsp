<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>로그인 페이지</title>
<script type="text/javascript">
	function login(){
		document.form.submit();
	}
	
	function cancel(){
		document.form.reset();
	}	
</script>
</head>
<body>
	<form action="login.do" method="post" name="form">
		<table class="table table-striped table-bordered table-hover">
			<caption style="text-align:center">로그인</caption>
			<tr>
				<th>ID</th> 
				<th><input type="text" name="id" /></th>
			</tr>
			<tr>
				<th>PW</th>
				<th><input type="password" name="password" /></th>
			</tr>
			<tr>
				<th></th>
				<th>
					<input type="button" class="btn btn-primary" value="로그인" onClick="login()" />
					<input type="button" class="btn btn-secondary" value="취소" onClick="cancel()" />
					<input type="button" class="btn btn-success" value="회원가입" onClick="window.location='loginform.jsp'" />
				</th>
			</tr>
		</table>
	</form>
</body>
</html>