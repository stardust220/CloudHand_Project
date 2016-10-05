/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cloudhand.model;

import cloudhand.domain.CHException;
import cloudhand.domain.Service;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author chenqingqi
 */
public class ServiceUpdate {
    private ServicesDAO dao = new ServicesDAO();
    
    public void insert(Service s) throws CHException{
        dao.insert(s);
    }
    
    public void delete(Service s) throws CHException{
        dao.delete(s);
    }    
    
    public void update(Service s) throws CHException {
        dao.update(s);
    }
    public Service get(Integer id) throws CHException{
        return dao.get(id);
    }
    
    public List<Service> getAll() throws CHException, SQLException {
        return dao.getAll();
    }
    
    public void addExtraPrice(Service s){
        double price = s.getListPrice()+s.getExtra();
        s.setListPrice(price);
    }
}
