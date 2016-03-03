package com.xiaofo1022.moocshit.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xiaofo1022.moocshit.dao.CourseDao;
import com.xiaofo1022.moocshit.dao.CourseTypeDao;

@Controller("mainController")
public class MainController {

	@Autowired
	private CourseDao courseDao;
	@Autowired
	private CourseTypeDao courseTypeDao;
	
	@RequestMapping(value={"/", "/index"}, method=RequestMethod.GET)
	public String main(HttpServletRequest request, ModelMap modelMap) {
		return "index_logined";
	}
	
	@RequestMapping(value="/course", method=RequestMethod.GET)
	public String course(HttpServletRequest request, ModelMap modelMap) {
		return "index";
	}
	
	@RequestMapping(value="/background", method=RequestMethod.GET)
	public String background(HttpServletRequest request, ModelMap modelMap) {
		return "background";
	}
	
	@RequestMapping(value="/mycourse", method=RequestMethod.GET)
	public String mycourse(HttpServletRequest request, ModelMap modelMap) {
		return "mycourse";
	}
	
	@RequestMapping(value="/courseDetail/{courseId}", method=RequestMethod.GET)
	public String courseDetail(@PathVariable int courseId, HttpServletRequest request, ModelMap modelMap) {
		modelMap.addAttribute("course", courseDao.getCourse(courseId));
		return "coursedetail";
	}
}
