package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Doctor;
import com.entity.User;
import com.mysql.cj.protocol.Resultset;

public class UserDAO {
	private Connection conn;
	
	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean register(User u) {
		boolean f = false;
		try {
			String sql = "insert into user(fullname, email, password) values(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getFullname());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			
			int i = ps.executeUpdate();
			
			if(i == 1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public User login(String email, String password) {
		User u = null;
		try {
			String sql = "select * from user where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				u = new User();
				u.setId(rs.getInt(1));
				u.setFullname(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}
	public boolean checkoutOldPassword(int userId, String oldPassword) {
		boolean f = false;
		
		try {
			String sql = "select * from user where id=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, userId);
			ps.setString(2, oldPassword);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	public boolean changePassword(int userId, String newPassword) {
		boolean f = false;
		
		try {
			String sql = "update user set password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, newPassword);
			ps.setInt(2, userId);
			
			int i = ps.executeUpdate();
			
			if(i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	public User getUserById(int id){
		User user = null;
		try {
			String sql = "select * from user where id =?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				user = new User();
				user.setId(rs.getInt(1));
				user.setFullname(rs.getString(2));
				user.setEmail(rs.getString(3));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
}
