package com.nt.entity;

import lombok.Data;

@Data
public class User {
private int id;
private String name;
private String email;
private String password;
private String qualification;
private String role;



//parametrized constructor
public User(String name, String email,String password ,String qualification,String role) {
	super();
	this.name = name;
	this.email = email;
	this.password=password;
	this.qualification = qualification;
	this.role = role;
	
}



public User() {
	super();
	// TODO Auto-generated constructor stub
}



}
