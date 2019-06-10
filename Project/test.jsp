<!-- [게시판-1] 공지 게시판 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
<style type="text/css"> 
	a, a:hover{
		color:#000000;
		text-decoration:none;
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
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="bbs.jsp">공지 게시판</a></li>
				<li><a href="bbs2.jsp">민원 게시판</a></li>
				<li><a href="bbs3.jsp">장터 게시판</a></li>
				<!-- active : 현재의 페이지를 알려줌 -->
			</ul>
			<%
				if (userID == null) { //로그인이 되어있지 않다면
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
			<%
				}
			%>

		</div>
	</nav>

	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center">번호</th>
						<th style="background-color: #eeeeee; text-align: center">제목</th>
						<th style="background-color: #eeeeee; text-align: center">작성자</th>
						<th style="background-color: #eeeeee; text-align: center">작성일</th>
<!-- 2019-06-08 조회수 생성_BEGIN_박초희 -->
						<th style="background-color: #eeeeee; text-align: center">조회수</th>
<!-- 2019-06-08 조회수 생성_END_박초희 -->
					</tr>
				</thead>
				<tbody>
					<%		
							Bbs bbs = new Bbs();
// 2019-06-08 조회수 생성_BEGIN_박초희		
					BbsDAO bbsDAO = new BbsDAO();
// 2019-06-08 조회수 생성_END_박초희
							ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
							ArrayList<Bbs> listAll = bbsDAO.getAllList();
							int result; //2019-06-08 [BEST]인기글
							int OrderNum =1;
							int k = listAll.size() - ((pageNumber-1) * 10)+1;
							for (int i = 0; i < list.size(); i++) {
// 2019-06-08 조회수 생성_BEGIN_박초희
								if((list.get(i).getBbsView())==15){
									//String bbsTitle = list.get(i).getBbsTitle();
									//bbs.setBbsTitle("[BEST] "+bbsTitle);
									result = bbsDAO.best(list.get(i).getBbsID(), "[BEST] "+list.get(i).getBbsTitle());
								}
// 2019-06-08 조회수 생성_END_박초희
					%>
					<tr>
						<td><%=k-OrderNum%></td>
						<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp").replaceAll("<", "&lt").replaceAll(">", "&gt").replaceAll("\n", "<br>")%></a></td>
						<td><%=list.get(i).getUserID()%></td>
						<td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"+ list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
<!-- 2019-06-08 조회수 생성_BEGIN_박초희 -->
						<td><%=list.get(i).getBbsView()%></td>
<!-- 2019-06-08 조회수 생성_END_박초희 -->
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
			<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>"
				class="btn btn-success btn-arrow-left">이전</a>
			<%
				}
				if (bbsDAO.nextPage(pageNumber+1)) { //다음 페이지가 존재한다면
			%>

			<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>"
				class="btn btn-success btn-arrow-left">다음</a>
			<%
				}
			%>
			<a href="write.jsp" class="btn btn-primary pull-right">글 작성</a>
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
