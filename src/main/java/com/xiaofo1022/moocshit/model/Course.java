package com.xiaofo1022.moocshit.model;

import java.util.Date;
import java.util.List;

public class Course {

	private long id;
	private Date insertDatetime;
	private Date updateDatetime;
	private String courseName;
	private long coursePlanId;
	private String courseVideoKey;
	private String courseRemark;
	private long uploadUserId;
	private User uploadUser;
	private double totalScore;
	private int playTimes;
	private List<Comment> commentList;
	private int courseIndex;
	private int exercisesId;
	
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
	public User getUploadUser() {
		return uploadUser;
	}
	public void setUploadUser(User uploadUser) {
		this.uploadUser = uploadUser;
	}
	public double getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(double totalScore) {
		this.totalScore = totalScore;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	public int getPlayTimes() {
		return playTimes;
	}
	public void setPlayTimes(int playTimes) {
		this.playTimes = playTimes;
	}
	public long getCoursePlanId() {
		return coursePlanId;
	}
	public void setCoursePlanId(long coursePlanId) {
		this.coursePlanId = coursePlanId;
	}
	public int getCourseIndex() {
		return courseIndex;
	}
	public void setCourseIndex(int courseIndex) {
		this.courseIndex = courseIndex;
	}
  public int getExercisesId() {
    return exercisesId;
  }
  public void setExercisesId(int exercisesId) {
    this.exercisesId = exercisesId;
  }
}
