package com.xiaofo1022.moocshit.dao.test;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xiaofo1022.moocshit.mapper.CourseMapper;
import com.xiaofo1022.moocshit.mapper.CourseTypeMapper;
import com.xiaofo1022.moocshit.model.Course;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:spring-config.xml")
public class CourseDaoTest {
	
	@Autowired
	private CourseMapper courseMapper;
	@Autowired
	private CourseTypeMapper courseTypeMapper;
	
	@Test
	public void testCourseDao() {
		Course course = courseMapper.getCourse(1);
		Assert.assertNotNull(course);
		Assert.assertEquals(course.getId(), 1);
		
		//CourseType courseType = courseTypeMapper.getCourseType(course.getCourseTypeId());
		//Assert.assertNotNull(courseType.getTypeName());
		//Assert.assertNotNull(course.getCourseType().getTypeName());
	}
}
