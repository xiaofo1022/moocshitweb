package com.xiaofo1022.moocshit.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiaofo1022.moocshit.core.CoreUtil;
import com.xiaofo1022.moocshit.mapper.CourseChosenMapper;
import com.xiaofo1022.moocshit.model.CourseChosen;
import com.xiaofo1022.moocshit.model.User;

@Controller
@RequestMapping("/chosen")
public class CourseChosenController {

	@Autowired
	private CourseChosenMapper chosenMapper;
	
	@RequestMapping(value="/addCourseChosen/{planId}", method=RequestMethod.POST)
	@ResponseBody
	int addCourseChosen(@PathVariable int planId, HttpServletRequest request) {
		User user = CoreUtil.getLoginUser(request);
		if (user != null) {
			CourseChosen chosen = new CourseChosen();
			chosen.setCoursePlanId(planId);
			chosen.setStudentId(user.getId());
			chosenMapper.addCourseChosen(chosen);
			return chosen.getId();
		} else {
			return 0;
		}
	}
}
