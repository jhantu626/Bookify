package com.user.servlet;

import com.DAO.userDAOImpl;
import com.DB.DBConnect;
import com.entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            PrintWriter out=resp.getWriter();
        
        
        String fname=req.getParameter("fname");
        String email=req.getParameter("email");
        String phno=req.getParameter("phno");
        String password=req.getParameter("password");
        String check=req.getParameter("check");
        
        
        User us=new User();
        us.setName(fname);
        us.setEmail(email);
        us.setPhno(phno);
        us.setPassword(password);
        
        HttpSession session=req.getSession();
            if (check!=null) {
                userDAOImpl dao=new userDAOImpl(DBConnect.getConn());
            
                boolean f2=dao.checkUser(email);
                if (f2) {
                    boolean f=dao.userRegister(us);
                if (f) {
                    session.setAttribute("success", "User Register Success.");
                    resp.sendRedirect("register.jsp");
                }else{
                    session.setAttribute("failedMsg", "Something Went Wrong...");
                    resp.sendRedirect("register.jsp");                    
                }
                }else{
                    session.setAttribute("failedMsg", "User Already Exist try Another Email");
                    resp.sendRedirect("register.jsp");                    
                
                }
            }else{
                session.setAttribute("failedMsg", "Please Check Terms And Condition");
                    resp.sendRedirect("register.jsp");
            }
        
        

            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    
    
}
