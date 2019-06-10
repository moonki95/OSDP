<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>	
<%@ page import="bbs.Bbs" %>	
<%@ page import="java.util.ArrayList" %>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/mystyle.css">
<title>JSP 게시판 만들기</title>

<style>
a,a:hover {
	color: #000000;
	text-decoration: none;
}
</style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

	<!-- 로그인이 된 사람들의 세션을 만들어 준다. 

		 회원값이 있는 사람들은 userID에 정보가 담기게 되고

		 아닌 사람은 null값을 가지게 된다.

	-->
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="main.html">아빠트</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#myPage">홈</a></li>
        <li><a href="#band">아빠트 소개</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">게시판
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="bbs.jsp">공지 게시판</a></li>
            <li><a href="bbs2.jsp">자유 게시판</a></li>
            <li><a href="bbs3.jsp">민원 게시판</a></li>
            <li><a href="bbs4.jsp">장터 게시판</a></li> 
          </ul>
        </li>
        <li><a href="#tour">블라블라</a></li>
        <li><a href="login.jsp">로그인</a></li>
        
        <li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
      </ul>
    </div>
  </div>
</nav>	
	<div class="container">
		 <div class="row">
		 <p>공지게시판</p>
		 	<table class="table table-striped" style="text-align:center; border:1px; solid #dddddd">
		 		<thead>
					<tr>
						<th style="background-color:#eeeeee; text-align: center;">번호</th>
						<th style="background-color:#eeeeee; text-align: center;">제목</th>
						<th style="background-color:#eeeeee; text-align: center;">작성자</th>
						<th style="background-color:#eeeeee; text-align: center;">작성일</th>
						<th style="background-color:#eeeeee; text-align: center;">조회수</th>
					</tr>		 		
		 		</thead>
		 		<tbody>
		 			<%
		 				Bbs bbs = new Bbs();
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						ArrayList<Bbs> listAll = bbsDAO.getAllList();
						int result=0;
						int OrderNum =1;
						int k = listAll.size() - ((pageNumber-1) * 10)+1;
						int cnt=0;
						for (int i = 0; i < list.size(); i++) {
							if((list.get(i).getBbsView())==3){
								if(cnt!=0) continue;//
								result = bbsDAO.best(list.get(i).getBbsID(), "[BEST] "+list.get(i).getBbsTitle());//
								cnt++;//
							}
					%>
					<tr>
						<td><%=k-OrderNum%></td>
						<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>&modNum=<%=0%>#<%=0%>"><%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp").replaceAll("<", "&lt").replaceAll(">", "&gt").replaceAll("\n", "<br>")%></a></td>
						<td><%=list.get(i).getUserID()%></td>
						<td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"
						+ list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
						<td><%=list.get(i).getBbsView() %></td>
					</tr>
					<%
					OrderNum++;
						}
					%>
		 		</tbody>
		 	</table>
		 	<%
		 		if(pageNumber != 1){
		 	%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arraw-left">이전</a>
		 	<%		
		 		} if(bbsDAO.nextPage(pageNumber + 1)){
		 	%>
		 		<a href="bbs.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arraw-left">다음</a>
		 	<%
		 		}
		 	%>
		 	<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		 </div>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>	
<script src="js/bootstrap.min.js"></script> 
</body>
</html>
