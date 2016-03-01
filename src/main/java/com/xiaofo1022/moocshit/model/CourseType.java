package com.xiaofo1022.moocshit.model;

public class CourseType {

	private int id;
	private String typeName;
	private int parentTypeId;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public int getParentTypeId() {
		return parentTypeId;
	}
	public void setParentTypeId(int parentTypeId) {
		this.parentTypeId = parentTypeId;
	}
}
