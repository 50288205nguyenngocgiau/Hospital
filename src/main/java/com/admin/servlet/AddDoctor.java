package com.admin.servlet;

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

@WebServlet("/add_doctor")
public class AddDoctor extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fullname = req.getParameter("fullname");
		String dob = req.getParameter("dob");
		String qualification = req.getParameter("qualification");
		String specialist = req.getParameter("specialist");
		String email = req.getParameter("email");
		String mobNo = req.getParameter("mobNo");
		String password = req.getParameter("password");
		
		Doctor doctor = new Doctor(fullname, dob,qualification,specialist,email,mobNo,password);
		
		DoctorDAO dao = new DoctorDAO(DBConnect.getConn());
		
		HttpSession session = req.getSession();
		if(dao.register(doctor)) {
			session.setAttribute("sucMsg", "Doctor Added Successfully");
			resp.sendRedirect("admin/doctor.jsp");
		}else {
			session.setAttribute("errorMsg", "Something wrong on server");
			resp.sendRedirect("admin/doctor.jsp");
		}
	}
}
