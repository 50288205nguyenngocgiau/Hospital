package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Doctor;

public class DoctorDAO {
	private Connection conn;

	public DoctorDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean register(Doctor d) {
		boolean f = false;
		try {
			String sql = "insert into doctor(fullname,dob,qualification,specialist,email,mobNo,password) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, d.getFullname());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getSpecialist());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobNo());
			ps.setString(7, d.getPassword());
			
			int i = ps.executeUpdate();
			if(i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public List<Doctor> getAllDoctor(){
		List<Doctor> ls = new ArrayList<Doctor>();
		Doctor doctor = null;
		try {
			String sql = "select * from doctor order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				doctor = new Doctor();
				doctor.setId(rs.getInt(1));
				doctor.setFullname(rs.getString(2));
				doctor.setDob(rs.getString(3));
				doctor.setQualification(rs.getString(4));
				doctor.setSpecialist(rs.getString(5));
				doctor.setEmail(rs.getString(6));
				doctor.setMobNo(rs.getString(7));
				doctor.setPassword(rs.getString(8));
				
				ls.add(doctor);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ls;
	}
	public Doctor getDoctorById(int id){
		Doctor doctor = null;
		try {
			String sql = "select * from doctor where id =?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				doctor = new Doctor();
				doctor.setId(rs.getInt(1));
				doctor.setFullname(rs.getString(2));
				doctor.setDob(rs.getString(3));
				doctor.setQualification(rs.getString(4));
				doctor.setSpecialist(rs.getString(5));
				doctor.setEmail(rs.getString(6));
				doctor.setMobNo(rs.getString(7));
				doctor.setPassword(rs.getString(8));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return doctor;
	}
	public boolean updateDoctor(Doctor d) {
		boolean f = false;
		try {
			String sql = "update doctor set fullname=?,dob=?,qualification=?,specialist=?,email=?,mobNo=?,password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, d.getFullname());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getSpecialist());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobNo());
			ps.setString(7, d.getPassword());
			ps.setInt(8, d.getId());
			
			int i = ps.executeUpdate();
			if(i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public boolean deleteDoctor(int id) {
		boolean f = false;
		try {
			String sql = "delete from doctor where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			int i = ps.executeUpdate();
			
			if(i == 1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public Doctor login(String email, String password) {
		Doctor doctor = null;
		try {
		String sql = "select * from doctor where email=? and password=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, email);
		ps.setString(2, password);
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			doctor = new Doctor();
			doctor.setId(rs.getInt(1));
			doctor.setFullname(rs.getString(2));
			doctor.setDob(rs.getString(3));
			doctor.setQualification(rs.getString(4));
			doctor.setSpecialist(rs.getString(5));
			doctor.setEmail(rs.getString(6));
			doctor.setMobNo(rs.getString(7));
			doctor.setPassword(rs.getString(8));
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return doctor;
	}
	public int countDoctor() {
		int i = 0;
		try {
			String sql = "select * from doctor";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	public int countAppointment() {
		int i = 0;
		try {
			String sql = "select * from appointment";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	public int countAppointmentByDoctorId(int doctorId) {
		int i = 0;
		try {
			String sql = "select * from appointment where doctorId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, doctorId);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	public int countUser() {
		int i = 0;
		try {
			String sql = "select * from user";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	public int countSpecialist() {
		int i = 0;
		try {
			String sql = "select * from specialist";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	public boolean checkoutOldPassword(int doctorId, String oldPassword) {
		boolean f = false;
		
		try {
			String sql = "select * from doctor where id=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, doctorId);
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
	public boolean changePassword(int doctorId, String newPassword) {
		boolean f = false;
		
		try {
			String sql = "update doctor set password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, newPassword);
			ps.setInt(2, doctorId);
			
			int i = ps.executeUpdate();
			
			if(i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	public boolean editDoctorProfile(Doctor d) {
		boolean f = false;
		try {
			String sql = "update doctor set fullname=?,dob=?,qualification=?,specialist=?,email=?,mobNo=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, d.getFullname());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getSpecialist());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobNo());
			ps.setInt(7, d.getId());
			
			int i = ps.executeUpdate();
			if(i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
