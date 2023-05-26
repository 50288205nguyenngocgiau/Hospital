package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDAO;
import com.db.DBConnect;
import com.entity.Doctor;

@WebServlet("/doctor_update_profile")
public class EditProfile extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fullname = req.getParameter("fullname");
		String dob = req.getParameter("dob");
		String qualification = req.getParameter("qualification");
		String specialist = req.getParameter("specialist");
		String email = req.getParameter("email");
		String mobno = req.getParameter("mobNo");
		String password = req.getParameter("password");
		
		int id = Integer.parseInt(req.getParameter("id"));
		
		Doctor doctor = new Doctor(id,fullname, dob, qualification, specialist, email, mobno);
		DoctorDAO dao = new DoctorDAO(DBConnect.getConn());
		HttpSession session = req.getSession();
		
		if(dao.editDoctorProfile(doctor)) {
			session.setAttribute("sucProMsg", "Doctor Update Successfully");
			resp.sendRedirect("doctor/edit_profile.jsp");
		}else {
			session.setAttribute("errorProMsg", "Something wrong on server");
			resp.sendRedirect("doctor/edit_profile.jsp");
		}
		
		
	}

}
