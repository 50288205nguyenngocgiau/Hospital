package com.entity;

public class Specialist {
	private int id;
	private String specialName;
	public Specialist(int id, String specialName) {
		super();
		this.id = id;
		this.specialName = specialName;
	}
	public Specialist() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSpecialName() {
		return specialName;
	}
	public void setSpecialistName(String specialName) {
		this.specialName = specialName;
	}
	
	
}
