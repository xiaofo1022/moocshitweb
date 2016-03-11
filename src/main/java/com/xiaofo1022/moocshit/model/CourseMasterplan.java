package com.xiaofo1022.moocshit.model;

import java.util.Date;
import java.util.List;

public class CourseMasterplan {

	private int id;
	private Date insertDatetime;
	private Date updateDatetime;
	private String planName;
	private String planPicKey;
	private String planDescription;
	private String planType;
	private int uploaderId;
	private User uploader;
	private int courseCount;
	private List<Course> courseList;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
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
	public String getPlanName() {
		return planName;
	}
	public void setPlanName(String planName) {
		this.planName = planName;
	}
	public String getPlanPicKey() {
		return planPicKey;
	}
	public void setPlanPicKey(String planPicKey) {
		this.planPicKey = planPicKey;
	}
	public String getPlanDescription() {
		return planDescription;
	}
	public void setPlanDescription(String planDescription) {
		this.planDescription = planDescription;
	}
	public String getPlanType() {
		return planType;
	}
	public void setPlanType(String planType) {
		if (planType != null) {
			planType = planType.trim();
		}
		this.planType = planType;
	}
	public int getUploaderId() {
		return uploaderId;
	}
	public void setUploaderId(int uploaderId) {
		this.uploaderId = uploaderId;
	}
	public User getUploader() {
		return uploader;
	}
	public void setUploader(User uploader) {
		this.uploader = uploader;
	}
	public int getCourseCount() {
		return courseCount;
	}
	public void setCourseCount(int courseCount) {
		this.courseCount = courseCount;
	}
	public List<Course> getCourseList() {
		return courseList;
	}
	public void setCourseList(List<Course> courseList) {
		this.courseList = courseList;
	}
}
