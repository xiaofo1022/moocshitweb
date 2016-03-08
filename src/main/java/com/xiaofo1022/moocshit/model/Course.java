package com.xiaofo1022.moocshit.model;

import java.util.Date;

public class Course {

	private long id;
	private Date insertDatetime;
	private Date updateDatetime;
	private String courseName;
	private long courseTypeId;
	private CourseType courseType;
	private String courseVideoKey;
	private String courseRemark;
	private long uploadUserId;
	private User uploadUser;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Date getInsertDatetime() {
		return insertDatetime;
	}
	public void setInsertDatetime(Date insertDatetime) {
		this.insertDatetime = insertDatetime;
	}
	public Date getUpdateDatetime() {
		return updateDatetime;
	}
	public void setUpdateDatetime(Date updateDatetime) {
		this.updateDatetime = updateDatetime;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public long getCourseTypeId() {
		return courseTypeId;
	}
	public void setCourseTypeId(long courseTypeId) {
		this.courseTypeId = courseTypeId;
	}
	public String getCourseVideoKey() {
		return courseVideoKey;
	}
	public void setCourseVideoKey(String courseVideoKey) {
		this.courseVideoKey = courseVideoKey;
	}
	public String getCourseRemark() {
		return courseRemark;
	}
	public void setCourseRemark(String courseRemark) {
		this.courseRemark = courseRemark;
	}
	public long getUploadUserId() {
		return uploadUserId;
	}
	public void setUploadUserId(long uploadUserId) {
		this.uploadUserId = uploadUserId;
	}
	public CourseType getCourseType() {
		return courseType;
	}
	public void setCourseType(CourseType courseType) {
		this.courseType = courseType;
	}
	public User getUploadUser() {
		return uploadUser;
	}
	public void setUploadUser(User uploadUser) {
		this.uploadUser = uploadUser;
	}
}
