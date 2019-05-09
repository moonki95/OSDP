<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
    <script> 

function writeCheck()
  {
   var form = document.writeform;
   
  if( !form.subject.value )
   {
    alert( "제목을 적어주세요" );
    form.subject.focus();
    return;
   }
 
  if( !form.content.value )
   {
    alert( "내용을 적어주세요" );
    form.content.focus();
    return;
   }  
 
  form.submit();
  }
 </script>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>BOARD 테이블 레코드 삽입</title>
</head>
<body>
	<div style="text-align:right">
		사용자ID : ${id} <input type=button class="btn btn-info" value="로그아웃" OnClick="window.location='logout.do'">
	</div>
	<form id="inform" action ="/board/write.do" method="post">
		<table style="text-align:center" class="table table-striped table-bordered table-hover">
			<caption style="text-align:center">게시판 작성</caption>
			<tr >
				<th>제목</th>
				<th style="text-align:left"><input type="text" name="subject"></th>
			</tr>
			<tr>
				<th>작성자</th>
				<th style="text-align:left">${id} </th>
			</tr>
			<tr>
				<th>email</th>
				<th style="text-align:left"><input type="email" name="email"></th>
			</tr>
			<tr>	
				<th>내용</th>
				<th style="text-align:left"><textarea name="content" rows="10" placeholder="내용을 입력하세요" form="inform"></textarea></th>
			</tr>	
			<tr>
				<th></th>
				<th style="text-align:right">		
					<input type=submit class="btn btn-success" value="등록" Onclick="javascript:writeCheck();">
					<input type=button class="btn btn-secondary" value="취소" OnClick="window.location='list.do'">
				</th>
			</tr>
		</table>
	</form>
</body>
</html>