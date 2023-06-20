package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
    private static Connection conn;
    
    public static Connection getConn(){
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/ebook-app";
            String user="root";
            String password="pritam@123";
            conn=DriverManager.getConnection(url, user, password);
        
        
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return conn;
    }
    
}
