package com.my.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nt.entity.Job;

import lombok.Data;

@Data

//dao class
public class JobDao {

	private Connection con;

	// getting connection
	public JobDao(Connection con) {
		super();
		this.con = con;
	}

	// creating addjob method to add job details in db
	public boolean addJobs(Job j) {
		boolean f = false;
		String query = "INSERT INTO jobs( title,description,category,status,location) VALUES (?,?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5, j.getLocation());
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
	// creating getALlJobs method to get jobs details from db

	public List<Job> getAllJobs() {
		// Creating list to store job object
		List<Job> list = new ArrayList<>();
		String query = "select * from jobs order by id";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Job j = new Job();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7) + "");
				list.add(j);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;

	}

	// get jobs by id for updating
	public Job getJobBYId(int id) {
		// Creating list to store job object
		Job j = null;
		String query = "select * from jobs where id=?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				j = new Job();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7) + "");

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return j;

	}

	// updating job details by id
	public boolean updateJob(Job j) {
		boolean f = false;
		String query = "update jobs set title=?,description=?,category=?,status=?,location=? where id=?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5, j.getLocation());
			ps.setInt(6, j.getId());
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
	
	// Deleting job details by id
	public boolean deleteJob(int id) {
		boolean f = false;
		String query = "delete from jobs where id=?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
		    ps.setInt(1, id);
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
	
//getting all active job for user
	public List<Job> getAllJobsForUser() {
		// Creating list to store job object
		List<Job> list = new ArrayList<>();
		String query = "select * from jobs where status=? order by id";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1,"Active");
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				Job j = new Job();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7) + "");
				list.add(j);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;

	}
	
	// getting ALlJobs from db with location and category

	public List<Job> getJobsWithLocationAndCategory(String location,String category) {
		// Creating list to store job object
		List<Job> list = new ArrayList<>();
		String query = "select * from jobs where location=? and category=? order by id";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, location);
			ps.setString(2, category);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				Job j = new Job();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7) + "");
				list.add(j);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;

	}
	
	
	// getting ALlJobs from db with location or category

	public List<Job> getJobsWithLocationORCategory(String location,String category) {
		// Creating list to store job object
		List<Job> list = new ArrayList<>();
		String query = "select * from jobs where location=? or category=? order by id";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, location);
			ps.setString(2, category);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				Job j = new Job();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7) + "");
				list.add(j);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;

	}
	
	// get jobs by id for updating
		public Job getJobBYIdForAdmin(int jobId) {
			// Creating list to store job object
			Job j = null;
			String query = "select * from jobs where id=?";
			try {
				PreparedStatement ps = con.prepareStatement(query);
				ps.setInt(1, jobId);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					j = new Job();
					j.setId(rs.getInt(1));
					j.setTitle(rs.getString(2));
					j.setDescription(rs.getString(3));
					j.setCategory(rs.getString(4));
					j.setStatus(rs.getString(5));
					j.setLocation(rs.getString(6));
					j.setPdate(rs.getTimestamp(7) + "");

				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return j;

		}

	
	
}
