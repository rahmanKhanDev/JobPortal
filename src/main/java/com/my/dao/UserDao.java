package com.my.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.nt.entity.User;

import lombok.Data;

@Data
public class UserDao {

	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}

	// User details registration method to db
	public boolean UserRegister(User user) {
		String query = "insert into user(name,email,password,qualification,role) values(?,?,?,?,?) ";
		boolean f = false;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getQualification());
			ps.setString(5, user.getRole());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return f;
	}

	// User validation method and getting all detailks and setting to User obj
	public User userLogin(String email, String password) {
		
		User user = null;
		String query = "select * from user where email=? and password=?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));
				user.setQualification(rs.getString(5));
				user.setRole(rs.getString(6));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return user;
	}

	
	//getting user object from db
	
	public User userInfoForAdmin(int userId) {
		
		User user = null;
		String query = "select * from user where id=?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, userId);
		
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));
				user.setQualification(rs.getString(5));
				user.setRole(rs.getString(6));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return user;
	}
	
}
