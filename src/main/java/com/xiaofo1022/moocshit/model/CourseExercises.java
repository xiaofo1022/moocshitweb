package com.xiaofo1022.moocshit.model;

import java.util.Date;

public class CourseExercises {

  private int id;
  private Date insertDatetime;
  private Date updateDatetime;
  private int courseId;
  private String exercisesText;
  private int score;
  private int isDone;
  private int isActive;
  
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
}
