package com.user.servlet;

import com.DAO.BookOrderImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_Order;
import com.entity.Cart;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javafx.scene.paint.Color;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            HttpSession session = req.getSession();

            String name = req.getParameter("username");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String address = req.getParameter("address");
            String landmark = req.getParameter("landmark");
            String city = req.getParameter("city");
            String state = req.getParameter("state");
            String pincode = req.getParameter("pincode");
            String paymentType = req.getParameter("payment");
            int id = Integer.parseInt(req.getParameter("id"));

            String fullAdd = address + "," + landmark + "," + city + "," + state + "," + pincode;

            CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());

            List<Cart> clist = dao.getBookByUser(id);

            if (clist.isEmpty()) {
                session.setAttribute("failedMsg", "Add Item");
                resp.sendRedirect("checkout.jsp");
            } else {
                BookOrderImpl dao2 = new BookOrderImpl(DBConnect.getConn());
                Book_Order o = null;

                ArrayList<Book_Order> orderList = new ArrayList<>();
                Random r = new Random();

                for (Cart cl : clist) {
                    o = new Book_Order();
                    o.setOrderID("BOOK-ORDER-00" + r.nextInt(100000));
                    o.setUserName(name);
                    o.setEmail(email);
                    o.setPhno(phno);
                    o.setFulladd(fullAdd);
                    o.setBookName(cl.getBookName());
                    o.setAuthor(cl.getAuthor());
                    o.setPrice(cl.getPrice() + "");
                    o.setPaymentType(paymentType);
                    orderList.add(o);

                }

                if ("noselect".equals(paymentType)) {
                    session.setAttribute("failedMsg", "Please choose Payment Method");
                    resp.sendRedirect("checkout.jsp");

                } else {

                    boolean f = dao2.saveOrder(orderList);
                    if (f) {
                        resp.sendRedirect("order_success.jsp");

                    } else {
                        session.setAttribute("failedMsg", "Your Order Failed");
                        resp.sendRedirect("checkout.jsp");
                    }

                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
