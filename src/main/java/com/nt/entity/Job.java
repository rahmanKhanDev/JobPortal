package com.nt.entity;

import lombok.Data;

@Data//lombok api annotation for boiler plate code
public class Job {
private int id;
private String title;
private String description;
private String category;
private String status;
private String location;
private String pdate;


public Job() {
	super();
	// TODO Auto-generated constructor stub
}

//parameterized constructor
public Job(String title, String description, String category, String status, String location, String pdate) {
	super();
	this.title = title;
	this.description = description;
	this.category = category;
	this.status = status;
	this.location = location;
	this.pdate = pdate;
}

}
