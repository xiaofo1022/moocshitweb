package com.xiaofo1022.moocshit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiaofo1022.moocshit.core.GlobalData;
import com.xiaofo1022.moocshit.mapper.CourseExercisesMapper;
import com.xiaofo1022.moocshit.mapper.CourseExercisesResultMapper;
import com.xiaofo1022.moocshit.mapper.CourseMapper;
import com.xiaofo1022.moocshit.mapper.CourseMasterplanMapper;
import com.xiaofo1022.moocshit.mapper.CourseTypeMapper;
import com.xiaofo1022.moocshit.model.Course;
import com.xiaofo1022.moocshit.model.CourseExercises;
import com.xiaofo1022.moocshit.model.CourseExercisesResult;
import com.xiaofo1022.moocshit.model.CourseMasterplan;
import com.xiaofo1022.moocshit.model.CourseType;
import com.xiaofo1022.moocshit.model.User;

@Controller
@RequestMapping("/course")
public class CourseController {

	@Autowired
	private CourseMapper courseMapper;
	@Autowired
	private CourseTypeMapper courseTypeMapper;
	@Autowired
	private CourseMasterplanMapper courseMasterplanMapper;
	@Autowired
	private CourseExercisesMapper courseExercisesMapper;
	@Autowired
	private CourseExercisesResultMapper exercisesResultMapper;
	
	@RequestMapping(value="/allCourseType", method=RequestMethod.GET)
	@ResponseBody
	public List<CourseType> getAllCourseType() {
		return courseTypeMapper.getAllCourseType();
	}
	
	@RequestMapping(value="/addCourseType", method=RequestMethod.POST)
	@ResponseBody
	public int addCourseType(@RequestBody CourseType courseType) {
		courseTypeMapper.addCourseType(courseType);
		return courseType.getId();
	}
	
	@RequestMapping(value="/addCourse", method=RequestMethod.POST)
	@ResponseBody
	public long addCourse(@RequestBody Course course, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			User user = (User)session.getAttribute("user");
			course.setUploadUserId(user.getId());
		}
		courseMapper.addCourse(course);
		return course.getId();
	}
	
	@RequestMapping(value="/allCourse", method=RequestMethod.GET)
	@ResponseBody
	public List<Course> allCourse() {
		return courseMapper.getAllCourse();
	}
	
	@RequestMapping(value="/addPlayTimes/{courseId}", method=RequestMethod.GET)
	@ResponseBody
	public int addPlayTimes(@PathVariable int courseId) {
		courseMapper.addPlayTimes(courseId);
		return GlobalData.SUCCESS_CODE;
	}
	
	@RequestMapping(value="/addCourseMasterplan", method=RequestMethod.POST)
	@ResponseBody
	public int addCourseMasterplan(@RequestBody CourseMasterplan courseMasterplan, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			User user = (User)session.getAttribute("user");
			courseMasterplan.setUploaderId(user.getId());
		}
		courseMasterplanMapper.addCourseMasterplan(courseMasterplan);
		return courseMasterplan.getId();
	}
	
	@RequestMapping(value="/courseExercises/{courseId}", method=RequestMethod.GET)
  @ResponseBody
  public CourseExercises getCourseExercisesByCourseId(@PathVariable int courseId) {
	  CourseExercises existExer = courseExercisesMapper.getCourseExercisesByCourseId(courseId);
	  if (existExer != null) {
	    existExer.setExercisesText(existExer.getExercisesText().replaceAll("&apos;", "'"));
	  }
    return existExer;
  }
	
	@RequestMapping(value="/addCourseExercises", method=RequestMethod.POST)
  @ResponseBody
  public int addCourseExercises(@RequestBody CourseExercises courseExercises) {
	  courseExercises.setExercisesText(courseExercises.getExercisesText().replaceAll("'", "&apos;"));
	  CourseExercises existExer = courseExercisesMapper.getCourseExercisesByCourseId(courseExercises.getCourseId());
	  if (existExer == null) {
	    courseExercisesMapper.addCourseExercises(courseExercises);
	  } else {
	    courseExercisesMapper.updateCourseExercises(courseExercises.getExercisesText(), courseExercises.getCourseId());
	  }
    return courseExercises.getId();
  }
	
	@RequestMapping(value="/finishExercises", method=RequestMethod.POST)
  @ResponseBody
  public int finishExercises(@RequestBody CourseExercisesResult courseExercisesResult, HttpServletRequest request) {
	  courseExercisesResult.setExercisesText(courseExercisesResult.getExercisesText().replaceAll("'", "&apos;"));
	  exercisesResultMapper.deleteResult(courseExercisesResult.getCourseId());
	  exercisesResultMapper.addCourseExercisesResult(courseExercisesResult);
	  return courseExercisesResult.getId();
  }
	
	@RequestMapping(value="/getExercisesResult", method=RequestMethod.GET)
  @ResponseBody
	public CourseExercisesResult getExercisesResult(@RequestParam("courseId") int courseId, @RequestParam("userId") int userId) {
	  return exercisesResultMapper.getCourseExercisesResultByCourseIdAndUserId(courseId, userId);
	}
	
	@RequestMapping(value="/doneTheExercises", method=RequestMethod.GET)
  @ResponseBody
	public int doneTheExercises(@RequestParam("courseId") int courseId, @RequestParam("userId") int userId, @RequestParam("score") int score) {
	  return exercisesResultMapper.updateResult(courseId, userId, score);
	}
}
