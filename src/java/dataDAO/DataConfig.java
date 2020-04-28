/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;



/**
 *
 * @author Hp-Pc
 */
public class DataConfig {

    private static Connection conn = null;
    private static String connURL = "";
    private static String username = "";
    private static String password = "";
    private static String img = "";
    private static int pageGap, pageSize;
    private static String sqldriver = "";

    public static void initConfig() {
        try {
            InitialContext initContext = new InitialContext();
            Context enviContext = (Context) initContext.lookup("java:/comp/env");
            connURL = (String) enviContext.lookup("connURL");
            sqldriver = (String) enviContext.lookup("sqldriverclass");
            username = (String) enviContext.lookup("username");
            password = (String) enviContext.lookup("password");
            img = (String) enviContext.lookup("imagePath");
            pageGap = (int) enviContext.lookup("pageGap");
            pageSize = (int) enviContext.lookup("pageSize");
            

        } catch (NamingException ex) {
            Logger.getLogger(DataConfig.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    public Connection getConnection(){
        initConfig();
        
        try {
            Class.forName(sqldriver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DataConfig.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        System.out.println("Conect successfully!!!");
        
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(connURL, username, password);
        } catch (SQLException ex) {
            Logger.getLogger(DataConfig.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        System.out.println(conn.toString());
        return conn;
    }
    
    public void closeData(Connection conn, PreparedStatement pre, ResultSet rs){
        try {
            if(conn != null && !conn.isClosed()){ 
                conn.close();
            }
            
            if(pre != null && !pre.isClosed()){
                pre.close();
            }
            
            if(rs!= null && !rs.isClosed()){
                rs.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(DataConfig.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    public static String getImg() {
        return img;
    }

    public static void setImg(String img) {
        DataConfig.img = img;
    }

    public static int getPageGap() {
        return pageGap;
    }

    public static void setPageGap(int pageGap) {
        DataConfig.pageGap = pageGap;
    }

    public static int getPageSize() {
        return pageSize;
    }

    public static void setPageSize(int pageSize) {
        DataConfig.pageSize = pageSize;
    }

}
