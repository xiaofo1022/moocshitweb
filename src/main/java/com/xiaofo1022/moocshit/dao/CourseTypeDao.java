package com.xiaofo1022.moocshit.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xiaofo1022.moocshit.core.GlobalData;
import com.xiaofo1022.moocshit.mapper.CourseTypeMapper;
import com.xiaofo1022.moocshit.model.CourseType;

@Repository
public class CourseTypeDao {

	@Autowired
	private CourseTypeMapper courseTypeMapper;
	
	public List<CourseType> getAllCourseType() {
		List<CourseType> typeList = courseTypeMapper.getAllCourseType();
		CourseType allType = new CourseType();
		allType.setTypeName(GlobalData.ALL_TYPE);
		typeList.add(0, allType);
		return typeList;
	}
}
