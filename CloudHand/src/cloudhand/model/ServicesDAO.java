/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cloudhand.model;

import cloudhand.domain.CHException;
import cloudhand.domain.Category;
import cloudhand.domain.Service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author chenqingqi
 */
public class ServicesDAO implements DAOInterface<Integer, Service> {

    private static final String COLUMNS = "title, author_name,"
            + "list_price,extra_fees,category_id,photo_url,review";
    private static final String TABLE = "services";
    private static final String INSERT_SQL = "INSERT INTO " + TABLE + "("
            + COLUMNS + ") VALUES(?,?,?,?,?,?,?)";
    private static final String INSERT_WITH_ID_SQL = "INSERT INTO " + TABLE + "("
            + COLUMNS + ",id) VALUES(?,?,?,?,?,?,?,?)";
    private static final String UPDATE_SQL = "UPDATE " + TABLE + " SET "
            + "title=?, description=?, author_name=?, list_price,"
            + "extra_fees=?, category_id=?, photo_url=?, review=?";
    private static final String DELETE_SQL = "DELETE FROM" + TABLE +"WHERE id=?";
    private static final String SELECT_ALL_SQL = "SELECT services.id, category.name as catgor_name,"+ COLUMNS + " FROM " + TABLE  
            + " JOIN category ON services.category_id=category.id";
    private static final String SELECT_SQL_BY_ID = SELECT_ALL_SQL +" WHERE services.id=?";
    private static final String SELECT_SQL_BY_NAME = "";
    private static final String SELECT_SQL_BY_AUTHER_NAME = "";
    private static final String SELECT_SQL_BY_PUB_NAME = "";

    @Override
    public void insert(Service s) throws CHException {
        if (s == null) {
            throw new IllegalArgumentException("服務刪除失敗-服務資料不得為null");
        }

        try (Connection connection = RDBConnection.getConnection(); //1.2.取得連線
                PreparedStatement pstmt = connection.prepareStatement(
                        s.getId() < 1 ? INSERT_SQL : INSERT_WITH_ID_SQL,
                        s.getId() < 1 ? Statement.RETURN_GENERATED_KEYS : Statement.NO_GENERATED_KEYS
                );) {

            pstmt.setString(1, s.getTitle());
            pstmt.setString(2, s.getAuthorname());
            pstmt.setDouble(3, s.getListPrice());
            pstmt.setInt(4, s.getExtra());
            pstmt.setInt(5, s.getCategory().getId());
            pstmt.setString(6, s.getPhotoUrl());
            pstmt.setInt(7, s.getReview());

            if (s.getId() > 0) {
                pstmt.setInt(8, s.getId());
            }

            pstmt.executeUpdate();

            if (s.getId() < 1) {
                try (ResultSet rs = pstmt.getGeneratedKeys()) {
                    while (rs.next()) {
                        s.setId(rs.getInt(1));
                    }
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(ServicesDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw new CHException("service 新增失敗", ex);
        } catch (CHException ex) {
            Logger.getLogger(ServicesDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
    }

    @Override
    public void delete(Service s) throws CHException {
        if (s == null) {
            throw new IllegalArgumentException("cannot delete Services");
        }

        try (Connection connection = RDBConnection.getConnection();
                PreparedStatement pstmt = connection.prepareStatement(DELETE_SQL);) {
            pstmt.setInt(1, s.getId());

            pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ServicesDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw new CHException("刪除失敗", ex);
        } catch (CHException ex) {
            Logger.getLogger(ServicesDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }

    }
    
    
    @Override
    public void update (Service s) throws CHException {
        if(s == null){
            throw new IllegalArgumentException("cannot delete Services");
        }
        
        try (Connection connection = RDBConnection.getConnection();
                PreparedStatement pstmt = connection.prepareStatement(UPDATE_SQL);
            ){
                pstmt.setString(1, s.getTitle());
                pstmt.setString(2, s.getAuthorname());
                pstmt.setDouble(3, s.getListPrice());
                pstmt.setInt(4, s.getExtra());
                pstmt.setInt(5, s.getCategory().getId());
                pstmt.setString(6, s.getPhotoUrl());
                
                
                pstmt.executeUpdate();
            }

            catch (SQLException ex) {
            Logger.getLogger(ServicesDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw new CHException("update fail", ex);
        }catch (CHException ex) {
            Logger.getLogger(ServicesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    @Override
    public Service get(Integer id) throws CHException {
        try (Connection connection = RDBConnection.getConnection();
                PreparedStatement pstmt = connection.prepareStatement(SELECT_SQL_BY_ID);
                ){
                pstmt.setInt(1, id);
                Service s = null;
                try(ResultSet rs = pstmt.executeQuery();){
                    while(rs.next()){
                        s = new Service();
                        s.setId(rs.getInt("id"));
                        String title = rs.getString("title");
                        s.setTitle(title);                       
                        String author_name = rs.getString("author_name");
                        s.setAuthorname(author_name);  
                        s.setListPrice(rs.getDouble("list_price"));
                        s.setListPrice(rs.getInt("extra_fees"));
                        
                        int catId = rs.getInt("id");
                        String catName = rs.getString("catgor_name");
                        Category category = new Category(catId,catName);
                        s.setCategory(category);
                        s.setPhotoUrl("photo_url");
                    }
                    return s;                              
                }

        }catch (SQLException ex) {
            Logger.getLogger(ServicesDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw new CHException("get fail", ex);
        }
        
    }
    
    public List<Service> getAll() throws SQLException, CHException {
        List<Service> list = new ArrayList<>();
        try (Connection connection = RDBConnection.getConnection();
                PreparedStatement pstmt = connection.prepareStatement(SELECT_ALL_SQL);
                ResultSet rs = pstmt.executeQuery();
                ){
            while(rs.next()){
            Service s = new Service();
            s.setId(rs.getInt("id"));
            String title = rs.getString("title");
            s.setTitle(title);
            String author_name = rs.getString("author_name");
            s.setAuthorname(author_name);
            s.setListPrice(rs.getDouble("list_price"));
            s.setListPrice(rs.getInt("extra_fees"));
            int catId = rs.getInt("id");
            String catName = rs.getString("catgor_name");
            Category category = new Category(catId,catName);
            s.setCategory(category);
            s.setPhotoUrl(rs.getString("photo_url"));  
            list.add(s);
            }
            return list;
        }catch (SQLException ex) {
            Logger.getLogger(ServicesDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw new CHException("Fail to search all services", ex);
        }
    }
}    

