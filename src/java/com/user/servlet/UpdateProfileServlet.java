package com.user.servlet;

import com.DAO.userDAOImpl;
import com.DB.DBConnect;
import com.entity.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String fname = req.getParameter("fname");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String password = req.getParameter("password");
            int id = Integer.parseInt(req.getParameter("id"));

            userDAOImpl dao = new userDAOImpl(DBConnect.getConn());
            User us = new User();
            boolean f = dao.checkPassword(id, password);
            us.setId(id);
            us.setName(fname);
            us.setEmail(email);
            us.setPhno(phno);
            us.setPassword(password);

            HttpSession session = req.getSession();

            if (f) {
                boolean f2 = dao.updateProfile(us);
                if (f2) {
                    session.setAttribute("success", "Profile Update SuccessFully");
                    resp.sendRedirect("edit_profile.jsp");

                } else {
                    session.setAttribute("failedMsg", "Something Went Wrong on server");
                    resp.sendRedirect("edti_profile.jsp");

                }
            } else {
                session.setAttribute("failedMsg", "Your Password is incorrect");
                resp.sendRedirect("edit_profile.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
