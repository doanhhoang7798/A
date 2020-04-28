/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

/**
 *
 * @author Hp-Pc
 */
public class ProductDAO extends DataConfig {

    public ArrayList<Product> getAll() throws SQLException {
        ArrayList<Product> arrlist = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pre = null;
        ResultSet rs = null;

            String query = "select * from menu";
            conn = this.getConnection();
            pre = conn.prepareStatement(query);
            rs = pre.executeQuery();

            while (rs.next()) {
                Product pro = new Product();
                pro.setId(rs.getInt("id"));
                pro.setName(rs.getString("name"));                
                pro.setFulldescription(rs.getString("fulldescription"));
                pro.setShortdescription(rs.getString("shortdescription"));
                pro.setImg(rs.getString("img"));
                arrlist.add(pro);
            }
        
            this.closeData(conn, pre, rs);     
        return arrlist;
    }

    
    
    public ArrayList<Product> getPros(int pageSize, int pageIndex){

        
        Connection conn = this.getConnection();
        PreparedStatement pre = null;
        ResultSet rs = null;
        ArrayList<Product> arrlist = new ArrayList<>();
        
        //get the row number(rn) of table menu
        String query = "select * from(select row_number() over "
                + "(order by id asc) as rn,*from menu) "
                + "as x where rn between ? * (?-1)+1 and ? * ?";
        
        try {
            pre = conn.prepareStatement(query);
            pre.setInt(1, pageSize);
            pre.setInt(2, pageIndex);
            pre.setInt(3, pageSize);
            pre.setInt(4, pageIndex);
            rs = pre.executeQuery();
            
            while(rs.next()){
                Product pro = new Product();
                pro.setId(rs.getInt("id"));
                pro.setName(rs.getString("name"));                
                pro.setFulldescription(rs.getString("fulldescription"));
                pro.setShortdescription(rs.getString("shortdescription"));
                pro.setImg(rs.getString("img"));
                pro.setIndex(rs.getInt("rn"));
                arrlist.add(pro);
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            this.closeData(conn, pre, rs);
        }
        return arrlist;
    }
    
    public int getTotalPros(){
        Connection conn = this.getConnection();
        PreparedStatement pre = null;
        ResultSet rs = null;
        
        String query = "select count(*) as total from menu";
        
        
        try {
            pre = conn.prepareStatement(query);
            rs = pre.executeQuery();
            
            if(rs.next()){
                return rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            this.closeData(conn, pre, rs);
        }
        return 0;
    }
    
    public Product getProById(int id) throws SQLException{
        String query = "Select * from menu where id= ? ";
        
        Connection conn = this.getConnection();
        PreparedStatement pre = conn.prepareCall(query);
        pre.setInt(1, id);
        
        ResultSet rs = null;
        rs = pre.executeQuery();
        Product pro = new Product();
        
        if(rs.next()){
            pro.setId(id);
            pro.setImg(rs.getString("img"));
            pro.setShortdescription(rs.getString("shortdescription"));
            pro.setName(rs.getString("name"));           
            pro.setFulldescription(rs.getString("fulldescription"));
        }
        
        this.closeData(conn, pre, rs);
        return pro;
    }
    
}
