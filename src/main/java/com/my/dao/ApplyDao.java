package com.my.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.nt.entity.Job;
import com.nt.entity.User;

import lombok.Data;
@Data
public class ApplyDao {
	private Connection con;

	// getting connection
	public ApplyDao(Connection con) {
		super();
		this.con = con;
	}
	
	
	//method to store user info and jobid applied by user
	public boolean jobApplied(User user,Job job) {
		String query = "insert into apply(jobid,userid,uname,email,qualification) values(?,?,?,?,?) ";
		boolean f = false;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1,job.getId());
			ps.setInt(2,user.getId());
			ps.setString(3,user.getName());
			ps.setString(4,user.getEmail());
			ps.setString(5,user.getQualification());
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
	
	
}
