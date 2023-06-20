package com.admin.servlet;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        try{
            String bookName=req.getParameter("bname");
            String author=req.getParameter("author");
            String price=req.getParameter("price");
            String categories=req.getParameter("categories");
            String status=req.getParameter("status");
            Part part=req.getPart("bimg");
            String fileName=part.getSubmittedFileName();
            String email="admin@123";
            
            
            BookDtls b=new BookDtls(bookName,author,price,categories,status,fileName,email);
            
            BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
            
            boolean f=dao.addBooks(b);
            
            HttpSession session=req.getSession();
            
           
            
            if (f) {
                 String path=getServletContext().getRealPath("")+"book";
            
                File file=new File(path);
                part.write(path+File.separator+fileName);
                
                
                
                
                session.setAttribute("succMsg", "Book Add Successfully");
                resp.sendRedirect("admin/add_books.jsp");
            }else{
                session.setAttribute("failedMsg", "Something Wrong on Server");
                resp.sendRedirect("admin/add_books.jsp");
            }

        
            
            
            
            
            
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
    }
    
    
}
