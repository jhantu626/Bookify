package com.user.servlet;

import com.DAO.userDAO;
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

@WebServlet("/login")
public class LoginServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String email=req.getParameter("email");
            String password=req.getParameter("password");
            
            userDAOImpl dao=new userDAOImpl(DBConnect.getConn());
            HttpSession session=req.getSession();
            
            if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
                User us=new User();
                us.setName("Admin");
                session.setAttribute("userobj", us);
                resp.sendRedirect("admin/home.jsp");
            }else{
                
                User us=dao.login(email, password);
                if (us!=null) {
                    session.setAttribute("userobj", us);
                    resp.sendRedirect("index.jsp");
                }else{
                    session.setAttribute("failedMsg", "Please Check Email & Password");
                    resp.sendRedirect("login.jsp");
                }
                
//                resp.sendRedirect("home.jsp");
            }
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
}
