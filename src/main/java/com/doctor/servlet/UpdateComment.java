package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDAO;
import com.db.DBConnect;
import com.entity.Appointment;

@WebServlet("/update_comment")
public class UpdateComment extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		int did = Integer.parseInt(req.getParameter("did"));
		String comment = req.getParameter("comment");
		
		AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
		boolean ap = dao.updateComment(id, did, comment);
		HttpSession session = req.getSession();
		
		if(ap) {
			session.setAttribute("sucMsg", "Comment Updated");
			resp.sendRedirect("doctor/patient.jsp");
		}else {
			session.setAttribute("errorMsg", "Comment Updated");
			resp.sendRedirect("doctor/patient.jsp");
		}
	}
}
