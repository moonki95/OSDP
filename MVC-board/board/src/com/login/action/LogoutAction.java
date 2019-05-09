/**
 * �α׾ƿ� ������ ������ �����ϰ� �α��� ȭ������ ���ư�
 */
package com.login.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.controller.CommandAction;

public class LogoutAction implements CommandAction{

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		//���� ����
		session.invalidate();
		return "login.jsp";
	}

}
