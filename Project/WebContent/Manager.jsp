<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>	
<%@ page import="bbs.Bbs" %>	
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>	
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>경비In</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">
<%
		String userID = "0";
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
%>
<%
		if(userID.equals("k1nder"))
		{
%>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="main.jsp">경비In</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="main.jsp">홈</a></li>
        <li><a href="#band">경비In 소개</a></li>
        <li><a href="bbs.jsp">공지 게시판</a></li>
        <li><a href="bbs2.jsp">자유 게시판</a></li>
        <li><a href="bbs3.jsp">민원 게시판</a></li>
        <li><a href="bbs4.jsp">장터 게시판</a></li> 
       <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">[관리자 전용]
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="join.jsp">주민정보 등록</a></li>
			<li><a href="Manager.jsp">주민정보 열람</a></li>
          </ul>
        </li>
        <%
				if(userID == "0"){
			%>
		<li><a href="login.jsp">로그인</a></li>
			<%
				}
				else{
			%>
		<li><a href="logoutAction.jsp">로그아웃</a></li>
			<%
				}
			%>
		</ul>
    </div>
  </div>
</nav>
<%
		}
		else{
%>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="main.jsp">경비In</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="main.jsp">홈</a></li>
        <li><a href="#band">경비In 소개</a></li>
        <li><a href="bbs.jsp">공지 게시판</a></li>
        <li><a href="bbs2.jsp">자유 게시판</a></li>
        <li><a href="bbs3.jsp">민원 게시판</a></li>
        <li><a href="bbs4.jsp">장터 게시판</a></li> 
        	<%
				if(userID == "0"){
			%>
		<li><a href="login.jsp">로그인</a></li>
			<%
				}
				else{
			%>
        <li><a href="logoutAction.jsp">로그아웃</a></li> 
			<%
				}
			%>
		</ul>
    </div>
  </div>
</nav>
<%
		}
%>
<div class="container">
		<div class="row">
			<p>공지게시판</p>
			<table class="table table-striped"
				style="text-align: center; border: 1px;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">주민 이름</th>
						<th style="background-color: #eeeeee; text-align: center;">주민 ID</th>
						<th style="background-color: #eeeeee; text-align: center;">주민 PASSWORD</th>
						<th style="background-color: #eeeeee; text-align: center;">주민 동호수</th>
					</tr>
				</thead>
				<tbody>
					<%
						UserDAO userDAO = new UserDAO();
						ArrayList<User> list = userDAO.getList();
						System.out.print(list.size());
						for(int i=0; i<list.size();i++)
						{
					%>
					<tr>
						<td><%=list.get(i).getUserID() %></td>
						<td><%=list.get(i).getUserPassword() %></td>
						<td><%=list.get(i).getUserName() %></td>
						<td><%=list.get(i).getUserGender() %></td>
						<td><%=list.get(i).getUserEmail() %></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>