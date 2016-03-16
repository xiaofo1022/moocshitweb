package com.xiaofo1022.moocshit.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xiaofo1022.moocshit.core.CoreUtil;
import com.xiaofo1022.moocshit.core.GlobalData;
import com.xiaofo1022.moocshit.dao.CourseTypeDao;
import com.xiaofo1022.moocshit.mapper.CommentMapper;
import com.xiaofo1022.moocshit.mapper.CourseChosenMapper;
import com.xiaofo1022.moocshit.mapper.CourseMapper;
import com.xiaofo1022.moocshit.mapper.CourseMasterplanMapper;
import com.xiaofo1022.moocshit.mapper.CourseTypeMapper;
import com.xiaofo1022.moocshit.model.Course;
import com.xiaofo1022.moocshit.model.CourseChosen;
import com.xiaofo1022.moocshit.model.CourseMasterplan;
import com.xiaofo1022.moocshit.model.CourseType;
import com.xiaofo1022.moocshit.model.User;

@Controller("mainController")
public class MainController {

	@Autowired
	private CourseMapper courseMapper;
	@Autowired
	private CourseTypeMapper courseTypeMapper;
	@Autowired
	private CommentMapper commentMapper;
	@Autowired
	private CourseMasterplanMapper courseMasterplanMapper;
	@Autowired
	private CourseTypeDao courseTypeDao;
	@Autowired
	private CourseChosenMapper chosenMapper;
	
	@RequestMapping(value={"/", "/index"}, method=RequestMethod.GET)
	public String main(HttpServletRequest request, ModelMap modelMap) {
		modelMap.addAttribute("hotestCourseList", courseMapper.getHotestCourseList());
		modelMap.addAttribute("bestCourseList", courseMapper.getBestCourseList());
		modelMap.addAttribute("latestCourseList", courseMapper.getLatestCourseList());
		return "index";
	}
	
	@RequestMapping(value="/course", method=RequestMethod.GET)
	public String course(HttpServletRequest request, ModelMap modelMap) throws UnsupportedEncodingException {
		List<CourseType> courseTypeList = courseTypeDao.getAllCourseType();
		modelMap.addAttribute("courseTypeList", courseTypeList);
		
		String typeName = request.getParameter("typeName");
		if (typeName != null) {
			typeName = new String(typeName.getBytes("ISO-8859-1"), "UTF-8");
		}
		if (typeName != null && !typeName.equals("") && !typeName.equals(GlobalData.ALL_TYPE)) {
			modelMap.addAttribute("selectedType", typeName);
			modelMap.addAttribute("courseList", courseMasterplanMapper.getPlanListByType(typeName));
		} else {
			modelMap.addAttribute("selectedType", GlobalData.ALL_TYPE);
			modelMap.addAttribute("courseList", courseMasterplanMapper.getAllPlanList());
		}
		
		return "course";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String register(HttpServletRequest request, ModelMap modelMap) {
		return "register";
	}
	
	@RequestMapping(value="/courseintro/{planId}", method=RequestMethod.GET)
	public String courseintro(@PathVariable int planId, HttpServletRequest request, ModelMap modelMap) {
		fillCourseIntroModelmap(planId, request, modelMap);
		return "courseintro";
	}
	
	@RequestMapping(value="/courseedit/{planId}", method=RequestMethod.GET)
	public String courseedit(@PathVariable int planId, HttpServletRequest request, ModelMap modelMap) {
		fillCourseIntroModelmap(planId, request, modelMap);
		return "courseedit";
	}
	
	public void fillCourseIntroModelmap(int planId, HttpServletRequest request, ModelMap modelMap) {
		CourseMasterplan masterplan = courseMasterplanMapper.getCourseMasterplan(planId);
		if (masterplan != null) {
			masterplan.setCourseList(courseMapper.getCourseListByPlan(planId));
		}
		modelMap.addAttribute("masterplan", masterplan);
		User user = CoreUtil.getLoginUser(request);
		if (user != null) {
			modelMap.addAttribute("userId", user.getId());
			modelMap.addAttribute("isChosen", chosenMapper.isChosen(planId, user.getId()) > 0);
			modelMap.addAttribute("isStart", chosenMapper.isStart(planId, user.getId()) > 0);
		}
		modelMap.addAttribute("chosenCount", chosenMapper.getStudentCount(planId));
		modelMap.addAttribute("planId", planId);
	}
	
	@RequestMapping(value="/chosenstatus", method=RequestMethod.GET)
	public String chosenstatus(HttpServletRequest request, ModelMap modelMap) {
		List<CourseChosen> chosenStatusList = chosenMapper.getChosenStatusList();
		if (chosenStatusList != null && chosenStatusList.size() > 0) {
			for (CourseChosen chosen : chosenStatusList) {
				chosen.setStudentCount(chosenMapper.getChosenCount(chosen.getCoursePlanId(), chosen.getIsStart()));
			}
		}
		modelMap.addAttribute("chosenStatusList", chosenStatusList);
		return "chosenstatus";
	}
	
	@RequestMapping(value="/coursemanage", method=RequestMethod.GET)
	public String coursemanage(HttpServletRequest request, ModelMap modelMap) {
		User user = CoreUtil.getLoginUser(request);
		if (user != null) {
			modelMap.addAttribute("courseList", courseMasterplanMapper.getPlanListByUser(user.getId()));
		}
		return "coursemanage";
	}
	
	@RequestMapping(value="/uploadvideo/{planId}", method=RequestMethod.GET)
	public String background(@PathVariable int planId, HttpServletRequest request, ModelMap modelMap) {
		User user = CoreUtil.getLoginUser(request);
		if (user != null) {
			List<CourseMasterplan> planList = courseMasterplanMapper.getPlanListByUser(user.getId());
			if (planList != null && planList.size() > 0) {
				CourseMasterplan selectedPlan = courseMasterplanMapper.getCourseMasterplan(planId);
				if (selectedPlan == null) {
					selectedPlan = new CourseMasterplan();
				}
				modelMap.addAttribute("selectedPlan", selectedPlan);
				modelMap.addAttribute("planList", planList);
			}
		}
		return "uploadvideo";
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
	
	@RequestMapping(value="/courseDetail/{planId}", method=RequestMethod.GET)
	public String courseDetail(@PathVariable int planId, HttpServletRequest request, ModelMap modelMap) {
		CourseMasterplan courseMasterplan = courseMasterplanMapper.getCourseMasterplan(planId);
		if (courseMasterplan != null) {
			User user = CoreUtil.getLoginUser(request);
			if (user != null) {
				courseMasterplan.setCourseList(courseMapper.getCourseListByPlan(planId));
				modelMap.addAttribute("userId", user.getId());
				List<Course> courseList = courseMasterplan.getCourseList();
				if (courseList != null && courseList.size() > 0) {
					int courseIndex = chosenMapper.getStudyProgress(planId, user.getId());
					if (courseIndex > 0) {
						courseIndex = courseIndex - 1;
					}
					Course course = courseList.get(courseIndex);
					if (course != null) {
						modelMap.addAttribute("course", course);
						modelMap.addAttribute("commentCount", course.getCommentList().size());
					}
					modelMap.addAttribute("courseList", courseList);
				}
			}
			modelMap.addAttribute("coursePlan", courseMasterplan);
		}
		return "coursedetail";
	}
}
