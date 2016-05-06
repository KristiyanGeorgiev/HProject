package beans;

import MySqlDatabase.Database;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Product {

    private int id;
    private String name;
    private float price;
    private InputStream img;
    private String imgString;
    private String type;

    public Product() {
    }

    public Product(String name, float price, InputStream img, String type) {
        this.name = name;
        this.price = price;
        this.img = img;
        this.type = type;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }
    
    public void setType(String type) {
       this.type = type;
    }

    public String getType() {
        return this.type;
    }
    

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return this.id;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getPrice() {
        return this.price;
    }

    public void setImg(InputStream img) {
        this.img = img;
    }

    public InputStream getImg() {
        return this.img;
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

    public boolean save() {
        boolean success = false;
        try {
            //-----------------Getting Connection-----------------------------------------        
            Database conn = new Database();

            Connection connection = conn.Connection();
            //-----------------Getting Connection----------------------------------------- 
            int id = getMaxId();

            PreparedStatement insertProduct = connection.prepareStatement("insert into products values(?,?,?,?,?)");

            id = id + 1;
            insertProduct.setInt(1, id);
            insertProduct.setString(2, name);
            insertProduct.setFloat(3, price);
            insertProduct.setBlob(4, img);
            insertProduct.setString(5, type);

            int i = insertProduct.executeUpdate();

            connection.close();
            int newID = getMaxId();
            if (newID > id - 1) {
                success = true;
            }
        } catch (Exception e2) {
            System.out.println(e2);
        }
        return success;

    }

    public void setImgString(String img) {
        this.imgString = img;
    }

    public String getImgString() {
        return this.imgString;
    }
}
