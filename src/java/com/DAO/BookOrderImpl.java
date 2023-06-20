package com.DAO;
import com.entity.Book_Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookOrderImpl implements BookOrderDAO{
    private Connection con;

    public BookOrderImpl(Connection con) {
        this.con = con;
    } 
    
    
    public int getOrderNo(){
      int i=0;
        try{
            
            String sql="select * from book_order";
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                i++;
            }
            
                    
        }catch(Exception e){
            e.printStackTrace();
        }
       return i;
    }
    
    
        public boolean saveOrder(List<Book_Order> blist){
            boolean f=false;
            
            try {
                
                String sql="insert into book_order(order_id,user_name,email,address,phone,book_name,author,price,payment) values(?,?,?,?,?,?,?,?,?)";
                
                con.setAutoCommit(false);
                PreparedStatement ps=con.prepareStatement(sql);
                for (Book_Order b:blist) {
                    ps.setString(1,b.getOrderID());
                    ps.setString(2, b.getUserName());
                    ps.setString(3, b.getEmail());
                    ps.setString(4, b.getFulladd());
                    ps.setString(5, b.getPhno());
                    ps.setString(6, b.getBookName());
                    ps.setString(7, b.getAuthor());
                    ps.setString(8, b.getPrice());
                    ps.setString(9, b.getPaymentType());
                    ps.addBatch();
                }
                
                int[] count=ps.executeBatch();
                con.commit();
                f=true;
                con.setAutoCommit(true);
                
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            
            return f;
        }
        
        
        
        
        
        
        public List<Book_Order> getBook(String email){
            List<Book_Order> list=new ArrayList<>();
            Book_Order o=null;
            try {
                String sql="select * from book_order where email=?";
                PreparedStatement ps=con.prepareStatement(sql);
                ps.setString(1, email);
                ResultSet rs=ps.executeQuery();
                
                while (rs.next()) {
                    o=new Book_Order();
                    o.setId(rs.getInt(1));
                    o.setOrderID(rs.getString(2));
                    o.setUserName(rs.getString(3));
                    o.setEmail(rs.getString(4));
                    o.setFulladd(rs.getString(5));
                    o.setPhno(rs.getString(6));
                    o.setBookName(rs.getString(7));
                    o.setAuthor(rs.getString(8));
                    o.setPrice(rs.getString(9));
                    o.setPaymentType(rs.getString(10));
                    
                    list.add(o);
                }
                
                
                
            } catch (Exception e) {
                e.printStackTrace();
            }
            return list;
        }

    
        
        
        
        
        
        public List<Book_Order> getAllBook(){
            List<Book_Order> list=new ArrayList<>();
            Book_Order o=null;
            try {
                String sql="select * from book_order ORDER BY id DESC";
                PreparedStatement ps=con.prepareStatement(sql);
                ResultSet rs=ps.executeQuery();
                
                while (rs.next()) {
                    o=new Book_Order();
                    o.setId(rs.getInt(1));
                    o.setOrderID(rs.getString(2));
                    o.setUserName(rs.getString(3));
                    o.setEmail(rs.getString(4));
                    o.setFulladd(rs.getString(5));
                    o.setPhno(rs.getString(6));
                    o.setBookName(rs.getString(7));
                    o.setAuthor(rs.getString(8));
                    o.setPrice(rs.getString(9));
                    o.setPaymentType(rs.getString(10));
                    
                    list.add(o);
                }
                
                
                
            } catch (Exception e) {
                e.printStackTrace();
            }
            return list;
        }
    
    
}