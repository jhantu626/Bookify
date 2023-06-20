package com.admin.servlet;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/editbooks")
public class EditBooksServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String bookName=req.getParameter("bname");
            String author=req.getParameter("author");
            String price=req.getParameter("price");
            String status=req.getParameter("status");
            int id=Integer.parseInt(req.getParameter("id"));
               
            BookDtls b=new BookDtls();
            b.setBookName(bookName);
            b.setAuthor(author);
            b.setPrice(price);
            b.setStatus(status);
            b.setBookId(id);
            
            BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
            
            boolean f=dao.updateEditBook(b);
            HttpSession session=req.getSession();
            if (f) {
                
                session.setAttribute("succMsg", "Book Update Successfully");
                resp.sendRedirect("admin/all_books.jsp");
            }
            else{
                session.setAttribute("failedMsg", "Something Went Wrong on Server");
                resp.sendRedirect("admin/all_books.jsp");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
