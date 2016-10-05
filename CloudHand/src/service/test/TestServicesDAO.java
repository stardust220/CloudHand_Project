/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service.test;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import cloudhand.domain.*;
import cloudhand.model.ServicesDAO;
/**
 *
 * @author Administrator
 */
public class TestServicesDAO {
    public static void main(String[] args) {
        try {
            ServicesDAO dao = new ServicesDAO();
            
            Category category = new Category(1, "Logo");
            Service service = new Service();

            service.setId(19);
            service.setCategory(category);
            service.setTitle("Xavier 【English's Singature】Logo Design");
            service.setDescription("");
            service.setAuthorname("XavierYu");
            service.setListPrice(1178);
            service.setExtra(100);
            service.setPhotoUrl("http://99job.tw/wp-content/uploads/2016/06/117-300x207.jpg");
            service.setReview(3);
            dao.insert(service); 

            System.out.println(dao.get(1));
//                   
        } catch (CHException ex) {
            Logger.getLogger(TestServicesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
