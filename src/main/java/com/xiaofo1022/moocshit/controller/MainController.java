package com.xiaofo1022.moocshit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xiaofo1022.moocshit.core.CoreUtil;
import com.xiaofo1022.moocshit.mapper.CourseMapper;
import com.xiaofo1022.moocshit.mapper.CourseTypeMapper;
import com.xiaofo1022.moocshit.model.Course;
import com.xiaofo1022.moocshit.model.CourseType;
import com.xiaofo1022.moocshit.model.User;

@Controller("mainController")
public class MainController {

	@Autowired
	private CourseMapper courseMapper;
	@Autowired
	private CourseTypeMapper courseTypeMapper;
	
	@RequestMapping(value={"/", "/index"}, method=RequestMethod.GET)
	public String main(HttpServletRequest request, ModelMap modelMap) {
		return "index";
	}
	
	@RequestMapping(value="/course", method=RequestMethod.GET)
	public String course(HttpServletRequest request, ModelMap modelMap) {
		fillCourseModelMap(0, modelMap);
		return "course";
	}
	
	@RequestMapping(value="/course/{courseTypeId}", method=RequestMethod.GET)
	public String courseByType(@PathVariable int courseTypeId, HttpServletRequest request, ModelMap modelMap) {
		fillCourseModelMap(courseTypeId, modelMap);
		return "course";
	}
	
	private void fillCourseModelMap(int courseTypeId, ModelMap modelMap) {
		List<CourseType> courseTypeList = courseTypeMapper.getAllCourseType();
		if (courseTypeList != null && courseTypeList.size() > 0) {
			CourseType courseType = null;
			if (courseTypeId == 0) {
				courseType = courseTypeList.get(0);
			} else {
				courseType = courseTypeMapper.getCourseType(courseTypeId);
			}
			modelMap.addAttribute("courseTypeList", courseTypeList);
			modelMap.addAttribute("courseType", courseType);
			modelMap.addAttribute("courseList", courseMapper.getCourseListByType(courseType.getId()));
		}
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String register(HttpServletRequest request, ModelMap modelMap) {
		return "register";
	}
	
	@RequestMapping(value="/background", method=RequestMethod.GET)
	public String background(HttpServletRequest request, ModelMap modelMap) {
		return "background";
	}
	
	@RequestMapping(value="/mycourse", method=RequestMethod.GET)
	public String mycourse(HttpServletRequest request, ModelMap modelMap) {
		return "mycourse";
	}

	@RequestMapping(value="/myinformation", method=RequestMethod.GET)
	public String myinformation(HttpServletRequest request, ModelMap modelMap) {
		User user = (User)request.getSession(false).getAttribute("user");
		if (user != null) {
			modelMap.addAttribute("userId", user.getId());
		}
		return "myinformation";
	}
	
	@RequestMapping(value="/courseDetail/{courseId}", method=RequestMethod.GET)
	public String courseDetail(@PathVariable int courseId, HttpServletRequest request, ModelMap modelMap) {
		Course course = courseMapper.getCourse(courseId);
		if (course != null) {
			User user = CoreUtil.getLoginUser(request);
			modelMap.addAttribute("userId", user == null ? "" : user.getId());
			modelMap.addAttribute("course", course);
			modelMap.addAttribute("commentCount", course.getCommentList().size());
			modelMap.addAttribute("courseList", courseMapper.getCourseListByType(course.getCourseTypeId()));
		}
		return "coursedetail";
	}
}
