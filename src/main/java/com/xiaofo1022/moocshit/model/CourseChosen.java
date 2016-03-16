package com.xiaofo1022.moocshit.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CourseChosen {
	
	private int id;
	private Date insertDatetime;
	private Date updateDatetime;
	private int coursePlanId;
	private CourseMasterplan courseMasterplan;
	private int studentId;
	private User student;
	private int isStart;
	private int studyProgress;
	private int studentCount;
	private Date deadLineDate;
	private String deadLine;
	private static final SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
	
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
	public int getCoursePlanId() {
		return coursePlanId;
	}
	public void setCoursePlanId(int coursePlanId) {
		this.coursePlanId = coursePlanId;
	}
	public CourseMasterplan getCourseMasterplan() {
		return courseMasterplan;
	}
	public void setCourseMasterplan(CourseMasterplan courseMasterplan) {
		this.courseMasterplan = courseMasterplan;
	}
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public User getStudent() {
		return student;
	}
	public void setStudent(User student) {
		this.student = student;
	}
	public int getIsStart() {
		return isStart;
	}
	public void setIsStart(int isStart) {
		this.isStart = isStart;
	}
	public int getStudyProgress() {
		return studyProgress;
	}
	public void setStudyProgress(int studyProgress) {
		this.studyProgress = studyProgress;
	}
	public Date getDeadLineDate() {
		return deadLineDate;
	}
	public void setDeadLineDate(Date deadLineDate) {
		this.deadLineDate = deadLineDate;
	}
	public int getStudentCount() {
		return studentCount;
	}
	public void setStudentCount(int studentCount) {
		this.studentCount = studentCount;
	}
	public String getDeadLine() {
		if (this.deadLineDate != null) {
			return sdf.format(this.deadLineDate);
		}
		return deadLine;
	}
	public void setDeadLine(String deadLine) {
		this.deadLine = deadLine;
		if (this.deadLine != null) {
			try {
				this.deadLineDate = sdf.parse(this.deadLine);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
	}
}
