<!-- [게시판-3] 장터 게시판 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs4.Bbs4DAO"%>
<%@ page import="bbs4.Bbs4"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1.0">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>경비In 웹 사이트</title>
<style type="text/css">
a, a:hover {
	color: #000000;
	text-decoration: none;
}
</style>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID"); //로그인시, userID에 해당 아이디가 입력됨.
		}
		/*2019-05-21*/
		int pageNumber = 1; //기본 페이지를 의미함
		if (request.getParameter("pageNumber") != null) {
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
			<p>장터게시판</p>
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center">번호</th>
						<th style="background-color: #eeeeee; text-align: center">제목</th>
						<th style="background-color: #eeeeee; text-align: center">작성자</th>
						<th style="background-color: #eeeeee; text-align: center">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<%
						Bbs4DAO bbs4DAO = new Bbs4DAO();
						ArrayList<Bbs4> list = bbs4DAO.getList(pageNumber);
						ArrayList<Bbs4> listAll = bbs4DAO.getAllList();
						int result; //2019-06-08 [BEST]인기글		
						int OrderNum = 1;
						int k = listAll.size() - ((pageNumber - 1) * 10) + 1;
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=k - OrderNum%></td>
						<%
							if(list.get(i).getBbsView() >= 15)
							{
						%>
						<td><a
							href="view4.jsp?bbsID=<%=list.get(i).getBbsID()%>&modNum=<%=0%>#<%=0%>">[BEST] <%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp").replaceAll("<", "&lt")
						.replaceAll(">", "&gt").replaceAll("\n", "<br>")%></a></td>
						<%
							}
							else{
						%>
						<td><a
							href="view4.jsp?bbsID=<%=list.get(i).getBbsID()%>&modNum=<%=0%>#<%=0%>"><%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp").replaceAll("<", "&lt")
						.replaceAll(">", "&gt").replaceAll("\n", "<br>")%></a></td>
						<%
							}
						%>
						<td><%=list.get(i).getUserID()%></td>
						<td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"
						+ list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
						<td><%=list.get(i).getBbsView()%></td>
					</tr>
					<%
						OrderNum++;
						}
					%>
				</tbody>
			</table>
			<!-- 페이지를 보여주는 하단 부분 -->
			<%
				if (pageNumber != 1) {
			%>
			<a href="bbs4.jsp?pageNumber=<%=pageNumber - 1%>"
				class="btn btn-success btn-arrow-left">이전</a>
			<%
				}
				if (bbs4DAO.nextPage(pageNumber + 1)&& k-OrderNum != 0) { //다음 페이지가 존재한다면
			%>

			<a href="bbs4.jsp?pageNumber=<%=pageNumber + 1%>"
				class="btn btn-success btn-arrow-left">다음</a>
			<%
				}
			%>
			<a href="write4.jsp" class="btn btn-primary pull-right">글 작성</a>
		</div>
	</div>

	<!--  시도#1
	<script src="https://code.jquery.com/jqurey-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	-->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>﻿
	 -->
</body>
</html>