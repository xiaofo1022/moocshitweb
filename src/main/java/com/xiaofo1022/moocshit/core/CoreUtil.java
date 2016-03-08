package com.xiaofo1022.moocshit.core;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.xiaofo1022.moocshit.model.User;

public class CoreUtil {

	public static User getLoginUser(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			return (User)session.getAttribute("user");
		}
		return null;
	}
}
