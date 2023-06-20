package com.user.servlet;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Cart;
import com.sun.corba.se.pept.transport.Connection;
import com.sun.net.httpserver.HttpServer;
import java.io.IOException;
import javafx.scene.input.KeyCode;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int bid=Integer.parseInt(req.getParameter("bid"));
            int uid=Integer.parseInt(req.getParameter("uid"));
        
            BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
            BookDtls b= dao.getBookById(bid);
            
            Cart c=new Cart();
            c.setBid(bid);
            c.setUserId(uid);
            c.setAuthor(b.getAuthor());
            c.setBookName(b.getBookName());
            c.setPrice(Double.parseDouble(b.getPrice()));
            c.setTotalPrice(Double.parseDouble(b.getPrice()));
            CartDAOImpl dao2=new CartDAOImpl(DBConnect.getConn());
            
            HttpSession session=req.getSession();
            boolean f=dao2.addCart(c);
            if(f){
                session.setAttribute("addCart", "Book Added to Cart");
                resp.sendRedirect("all_new_book.jsp");

            }else{
                session.setAttribute("failed", "Failed to add cart");
                resp.sendRedirect("all_new_book.jsp");
            }
            
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
   
}
