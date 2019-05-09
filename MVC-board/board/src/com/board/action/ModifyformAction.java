/**
 * �Խ��� ������ ���� ǥ���ϴ� Action
 */
package com.board.action;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.beans.board;
import com.board.controller.CommandAction;
 
public class ModifyformAction implements CommandAction {
 
    public String requestPro(HttpServletRequest request,
 
    HttpServletResponse response) throws Throwable {
    	
    	Class.forName("com.mysql.jdbc.Driver");
    	String url = "jdbc:mysql://127.0.0.1/jspdb";
    	String dbUser = "root";
    	String dbPass = "1234";
    	Connection conn = null;
    	Statement stmt = null;    	
    	ResultSet rs = null;
    		try{
    			
    			HttpSession session = request.getSession();
            	
        		if(session.getAttribute("id") == null){
        			return "loginerror.jsp";
        		}
    			
    			request.setCharacterEncoding("euc-kr");
    			String num = request.getParameter("num");
    			
    			conn = DriverManager.getConnection(url,dbUser,dbPass);    			    			
    			String query = "select * from board where num = " + num;
    					
    			stmt = conn.createStatement();
    			
    			rs = stmt.executeQuery(query);
    			    			    	
    			ArrayList<board> articleList = new ArrayList<board>();
    			
        		while(rs.next()){        			
        			board article = new board();
        			article.setNum(rs.getInt("num"));    			
        			article.setSubject(rs.getString("subject"));
        			article.setContent(rs.getString("content"));
        			article.setId(rs.getString("id"));
        			article.setBoarddate(rs.getString("boarddate"));
        			article.setEmail(rs.getString("email"));
        			articleList.add(article);
        		}
        		request.setAttribute("articleList",articleList);
        		
    			stmt.close();
    			conn.close();
    			rs.close();
    		 
     } catch(SQLException e) {
    	System.out.println( e.toString() );
    } finally{
    	if(rs != null) try{rs.close();} catch(SQLException ex){}
    	if(stmt != null) try{stmt.close();} catch(SQLException ex){}			
		if(conn != null) try{conn.close();} catch(SQLException ex){}
		}
    	
 
        return "modifyform.jsp";
 
    }
 
}