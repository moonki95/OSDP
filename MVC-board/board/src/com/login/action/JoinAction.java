/**
 * 사용자 회원가입시 입력하는 Action
 * 
 */
package com.login.action;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.controller.CommandAction;
 
public class JoinAction implements CommandAction {
 
    public String requestPro(HttpServletRequest request,
 
    HttpServletResponse response) throws Throwable {
    	
    	request.setCharacterEncoding("euc-kr");
    	
    	//loginform으로 부터 값을 입력받는 부분    	
		String id = request.getParameter("id");
    	String password = request.getParameter("password");
    	String name = request.getParameter("name");
    	String email = request.getParameter("email");
    	
    	//mysql 데이터베이스에 접속하는 클래스 드라이버 선언
    	Class.forName("com.mysql.jdbc.Driver");
    	
    	//데이터 베이스 연결 관련 변수 선언
    	Connection conn = null;
    	PreparedStatement pstmt = null;    	
    	
    	try{ 		
        	
    		String jdbcDriver = "jdbc:mysql://127.0.0.1/jspdb"; 
    		       //+
					//			"useUnicode=true&characterEncoding = euc-kr";
			String dbUser = "root";
			String dbPass = "1234";
    		
			//데이터베이스에 연결
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
    		
			//각 ?에 해당하는 변수들을 넣어준다.
      		pstmt = conn.prepareStatement(
    				"insert into usr values(?,?,?,?,now())");
    				pstmt.setString(1, id);
    				pstmt.setString(2, password);
    				pstmt.setString(3, name);
    				pstmt.setString(4, email);
    				
    		// pstmt에 저장된 쿼리 실행
    				pstmt.executeUpdate();
    		
    		//로그인 관련 세션 선언
    		HttpSession session = request.getSession();
    		
    		session.setAttribute("id", id);	
    				
    	} catch(SQLException ex){
			
		}finally{
			/*데이터 베이스에 접속하고 나서 데이터 베이스 연결을 끊어준다
			  안그럴 경우 자원의 낭비가 발생
			*/
    		if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
    		if(conn != null) try{conn.close();} catch(SQLException ex){}
    		}
    	
 
        return "join.jsp";
 
    }
 
}