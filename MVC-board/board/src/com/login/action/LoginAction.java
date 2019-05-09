/**
 * 占싸깍옙占쏙옙 화占썽에占쏙옙 ID占쏙옙 PW 占쌉력쏙옙 占쏙옙占쏙옙풔占� Action
 */
package com.login.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.controller.CommandAction;

public class LoginAction implements CommandAction{

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("euc-kr");
		
		//占쌉력뱄옙占쏙옙 id占쏙옙 pw占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
		String id = request.getParameter("id");
    	String password = request.getParameter("password");    	
    	    	
    	Class.forName("com.mysql.jdbc.Driver");
    	HttpSession session = request.getSession();
    	Connection conn = null;    	
    	Statement stmt = null;
    	ResultSet rs = null;
    	
    	try{
    		
    		String jdbcDriver = "jdbc:mysql://127.0.0.1/jspdb";
    		         //+
					 //			"useUnicode=true&characterEncoding = euc-kr";
			String dbUser = "root";
			String dbPass = "1234";
    		
			//占쏙옙占쏙옙占싶븝옙占싱쏙옙 占쏙옙占쏙옙
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);			
			stmt = conn.createStatement();
		
			//id占쏙옙 pw占쏙옙 占승댐옙 db 占싯삼옙 占쏙옙占쏙옙 占쏙옙占쏙옙
			String query = "select * from usr where id = '"+id+"' and password = '"+password+"';";					
			//占쏙옙占쏙옙 占쏙옙占쏙옙占싹울옙 占쏙옙占쏙옙占� 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙			
			rs = stmt.executeQuery(query);
			
			//占싸깍옙占쏙옙 占쏙옙占쏙옙占� 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙
			Boolean isLogin = false;
			
			//占쏙옙占� 占싯삼옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 true
			while(rs.next()){
				isLogin = true;
			}			
			//占쏙옙占쏙옙占� 占싯삼옙占쏙옙 占실몌옙 占쏙옙占실울옙 id 占쌩곤옙
			if(isLogin){				
				session.setAttribute("id", id);
			//占쏙옙占� 占싯삼옙占쏙옙 占싫듸옙 占쏙옙 占쏙옙占쏙옙 占싯억옙 호占쏙옙
			}else if(!isLogin && id != null){
				return "loginerror2.jsp";
			}
    	} catch(SQLException ex){

    	}finally{
    		//占쌘울옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙
    		if(stmt != null) try{stmt.close();} catch(SQLException ex){}
    		if(conn != null) try{conn.close();} catch(SQLException ex){}
    		if(rs != null) try{rs.close();} catch(SQLException ex){}
    		}    	       	
    	return "list.do";
	}
	
}
