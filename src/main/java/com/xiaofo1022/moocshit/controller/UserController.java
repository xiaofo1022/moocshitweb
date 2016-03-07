package com.xiaofo1022.moocshit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiaofo1022.moocshit.core.LoginResponse;
import com.xiaofo1022.moocshit.core.RoleEnum;
import com.xiaofo1022.moocshit.mapper.UserMapper;
import com.xiaofo1022.moocshit.model.User;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserMapper userMapper;
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	@ResponseBody
	public LoginResponse login(@RequestBody User user, HttpServletRequest request, ModelMap modelMap) {
		User loginUser = userMapper.login(user);
		if (loginUser != null && loginUser.getId() > 0) {
			HttpSession session = request.getSession(true);
			session.setAttribute("user", userMapper.getUser(loginUser.getId()));
			return new LoginResponse("success");
		} else {
			return new LoginResponse("用户名或密码错误");
		}
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	@ResponseBody
	public String logout(HttpServletRequest request, ModelMap modelMap) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.removeAttribute("user");
			session.invalidate();
		}
		return "success";
	}
	
	@RequestMapping(value="/addUser", method=RequestMethod.POST)
	@ResponseBody
	public int addUser(@RequestBody User user) {
		user.setRoleId(Integer.valueOf(RoleEnum.STUDENT.toString()));
		userMapper.addUser(user);
		return user.getId();
	}
	
	@RequestMapping(value="/getUser/{userId}", method=RequestMethod.GET)
	@ResponseBody
	public User getUser(@PathVariable int userId) {
		return userMapper.getUser(userId);
	}
	
	@RequestMapping(value="/updateUser", method=RequestMethod.POST)
	@ResponseBody
	public int updateUser(@RequestBody User user) {
		return userMapper.updateUser(user);
	}
}
