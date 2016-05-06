package beans;

import MySqlDatabase.Database;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProductService {

     public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        try {
            //-----------------Getting Connection-----------------------------------------        
            Database conn = new Database();

            Connection connection = conn.Connection();
            //-----------------Getting Connection----------------------------------------- 
            PreparedStatement query = connection.prepareStatement("select * from products   ORDER BY `id`  DESC");

             
            ResultSet rs = query.executeQuery();

            while (rs.next()) {
                Product product = new Product();

                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getFloat("price"));
                product.setType(rs.getString("type"));

                Blob blob = rs.getBlob("image");
                byte[] imgData = new byte[10];
                imgData = blob.getBytes(1, (int) blob.length());
                String b64 = javax.xml.bind.DatatypeConverter.printBase64Binary(imgData);

                product.setImgString(b64);

                products.add(product);
            }

            connection.close();

        } catch (Exception e2) {
            System.out.println(e2);
        }

        return products;
    }
    public List<Product> getAllProducts(String type) {
        List<Product> products = new ArrayList<>();
        try {
            //-----------------Getting Connection-----------------------------------------        
            Database conn = new Database();

            Connection connection = conn.Connection();
            //-----------------Getting Connection----------------------------------------- 
            PreparedStatement query = connection.prepareStatement("select * from products where type=?  ORDER BY `id`  DESC");

            query.setString(1, type);
            ResultSet rs = query.executeQuery();

            while (rs.next()) {
                Product product = new Product();

                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getFloat("price"));
                product.setType(rs.getString("type"));

                Blob blob = rs.getBlob("image");
                byte[] imgData = new byte[10];
                imgData = blob.getBytes(1, (int) blob.length());
                String b64 = javax.xml.bind.DatatypeConverter.printBase64Binary(imgData);

                product.setImgString(b64);

                products.add(product);
            }

            connection.close();

        } catch (Exception e2) {
            System.out.println(e2);
        }

        return products;
    }
    
        public Product getProductById(String id) {
       Product product = new Product();
        try {
            //-----------------Getting Connection-----------------------------------------        
            Database conn = new Database();

            Connection connection = conn.Connection();
            //-----------------Getting Connection----------------------------------------- 
            PreparedStatement query = connection.prepareStatement("select * from products where id=?  ORDER BY `id`  DESC");

            query.setInt(1, Integer.parseInt(id));
            ResultSet rs = query.executeQuery();

            while (rs.next()) {
               

                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getFloat("price"));

                Blob blob = rs.getBlob("image");
                byte[] imgData = new byte[10];
                imgData = blob.getBytes(1, (int) blob.length());
                String b64 = javax.xml.bind.DatatypeConverter.printBase64Binary(imgData);

                product.setImgString(b64);

                
            }

            connection.close();

        } catch (Exception e2) {
            System.out.println(e2);
        }

        return product;
    }

    public boolean delete(String id) {
        boolean success = false;
        try {
            //-----------------Getting Connection-----------------------------------------        
            Database conn = new Database();

            Connection connection = conn.Connection();
            //-----------------Getting Connection----------------------------------------- 

            PreparedStatement deleteProduct = connection.prepareStatement("DELETE FROM products WHERE id=?");

            deleteProduct.setInt(1, Integer.parseInt(id));

            int i = 0;
            i = deleteProduct.executeUpdate();
            connection.close();

            int newID = getMaxId();
            if (i != 0) {
                success = true;
            }
        } catch (Exception e2) {
            System.out.println(e2);
        }
        return success;

    }

    public boolean update(String id, String name, float price) {
        boolean success = false;
        try {
            //-----------------Getting Connection-----------------------------------------        
            Database conn = new Database();

            Connection connection = conn.Connection();
            //-----------------Getting Connection----------------------------------------- 

            PreparedStatement updateProduct = connection.prepareStatement("update products set name=?, price=? where id=? ");
            updateProduct.setString(1, name);
            updateProduct.setFloat(2, price);
            updateProduct.setInt(3, Integer.parseInt(id));

            int i = updateProduct.executeUpdate();

            if (i != 0) {
                success = true;
            }
            connection.close();

        } catch (Exception e2) {
            System.out.println(e2);
        }
        return success;
    }

    private int getMaxId() {
        int maxID = -1;
        try {
            //-----------------Getting Connection-----------------------------------------        
            Database conn = new Database();

            Connection connection = conn.Connection();
            //-----------------Getting Connection----------------------------------------- 
            Statement s2 = connection.createStatement();
            s2.execute("SELECT MAX(id) FROM products");
            ResultSet rs2 = s2.getResultSet();
            if (rs2.next()) {
                maxID = rs2.getInt(1);
            }

            connection.close();

        } catch (Exception e2) {
            System.out.println(e2);
        }
        return maxID;
    }

}
