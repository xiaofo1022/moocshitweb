package com.xiaofo1022.moocshit.model;

import java.util.Date;

public class CourseExercisesResult {

  private int id;
  private Date insertDatetime;
  private Date updateDatetime;
  private int courseId;
  private int coursePlanId;
  private int userId;
  private String exercisesText;
  private int score;
  private int isDone;
  private int isActive;
  
  private CourseMasterplan courseMasterplan;
  private Course course;
  private User user;
  
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
  public int getCourseId() {
    return courseId;
  }
  public void setCourseId(int courseId) {
    this.courseId = courseId;
  }
  public int getCoursePlanId() {
    return coursePlanId;
  }
  public void setCoursePlanId(int coursePlanId) {
    this.coursePlanId = coursePlanId;
  }
  public int getUserId() {
    return userId;
  }
  public void setUserId(int userId) {
    this.userId = userId;
  }
  public String getExercisesText() {
    return exercisesText;
  }
  public void setExercisesText(String exercisesText) {
    this.exercisesText = exercisesText;
  }
  public int getScore() {
    return score;
  }
  public void setScore(int score) {
    this.score = score;
  }
  public int getIsDone() {
    return isDone;
  }
  public void setIsDone(int isDone) {
    this.isDone = isDone;
  }
  public int getIsActive() {
    return isActive;
  }
  public void setIsActive(int isActive) {
    this.isActive = isActive;
  }
  public CourseMasterplan getCourseMasterplan() {
    return courseMasterplan;
  }
  public void setCourseMasterplan(CourseMasterplan courseMasterplan) {
    this.courseMasterplan = courseMasterplan;
  }
  public Course getCourse() {
    return course;
  }
  public void setCourse(Course course) {
    this.course = course;
  }
  public User getUser() {
    return user;
  }
  public void setUser(User user) {
    this.user = user;
  }
}
