package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;

public class AppointmentDAO {
	private Connection conn;

	public AppointmentDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addAppointment(Appointment ap) {
		boolean f = false;
		
		try {
			String sql = "insert into appointment(userId,fullname,gender,age,appointmentDate,email,phoneNo,deseases,doctorId,address,status) values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, ap.getUserId());
			ps.setString(2, ap.getFullname());
			ps.setString(3, ap.getGender());
			ps.setString(4, ap.getAge());
			ps.setString(5, ap.getAppointmentDate());
			ps.setString(6, ap.getEmail());
			ps.setString(7, ap.getPhoneNo());
			ps.setString(8, ap.getDeseases());
			ps.setInt(9, ap.getDoctorId());
			ps.setString(10, ap.getAddress());
			ps.setString(11, ap.getStatus());
			
			int i = ps.executeUpdate();
			
			if(i == 1) {
				f= true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	public List<Appointment> getAllAppointmentByLoginUser(int userId){
		List<Appointment> ls = new ArrayList<Appointment>();
		Appointment ap = null;

		try{
			String sql = "select * from appointment where userId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,userId);

			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullname(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppointmentDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhoneNo(rs.getString(8));
				ap.setDeseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));

				ls.add(ap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	return ls;
	} 
	public List<Appointment> getAllAppointmentByDoctorLogin(int doctorId){
		List<Appointment> ls = new ArrayList<Appointment>();
		Appointment ap = null;

		try{
			String sql = "select * from appointment where doctorId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,doctorId);

			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullname(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppointmentDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhoneNo(rs.getString(8));
				ap.setDeseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));

				ls.add(ap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	return ls;
	} 
	public Appointment getAppointmentById(int id){
		Appointment ap = null;

		try{
			String sql = "select * from appointment where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,id);

			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullname(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppointmentDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhoneNo(rs.getString(8));
				ap.setDeseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	return ap;
	} 
	public boolean updateComment(int id, int doctId, String comment) {
		boolean f = false;
		try {
			String sql = "update appointment set status=? where id=? and doctorId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, comment);
			ps.setInt(2, id);
			ps.setInt(3, doctId);
			
			int i = ps.executeUpdate();
			
			if(i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public List<Appointment> getAllAppointment(){
		List<Appointment> ls = new ArrayList<Appointment>();
		Appointment ap = null;

		try{
			String sql = "select * from appointment";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				ap = new Appointment();
				ap.setId(rs.getInt(1));
				ap.setUserId(rs.getInt(2));
				ap.setFullname(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAppointmentDate(rs.getString(6));
				ap.setEmail(rs.getString(7));
				ap.setPhoneNo(rs.getString(8));
				ap.setDeseases(rs.getString(9));
				ap.setDoctorId(rs.getInt(10));
				ap.setAddress(rs.getString(11));
				ap.setStatus(rs.getString(12));

				ls.add(ap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	return ls;
	} 
}
