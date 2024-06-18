package com.my.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nt.entity.JobAppliedUserInfo;

public class GetAppliedUserDao {

	private Connection con;

	// getting connection
	public GetAppliedUserDao(Connection con) {
		super();
		this.con = con;
	}

	public List<JobAppliedUserInfo> getAppliedUserInfo(int jobId) {
		String query = "select * from apply where jobid=?";
		List<JobAppliedUserInfo> list=new ArrayList<>();
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, jobId);
			ResultSet rs = ps.executeQuery();
		
			while (rs.next()) {
				JobAppliedUserInfo userInfo = new JobAppliedUserInfo();
				userInfo.setJobId(rs.getInt(1));
				userInfo.setUseId(rs.getInt(2));
				userInfo.setUname(rs.getString(3));
				userInfo.setEmail(rs.getString(4));
				userInfo.setQualification(rs.getString(5));
				list.add(userInfo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

}
