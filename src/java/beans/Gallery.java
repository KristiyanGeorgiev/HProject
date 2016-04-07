package beans;

import MySqlDatabase.Database;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Gallery {

    private int id;
    private String name;
    private InputStream img;
    private String imgString;

    public Gallery() {
    }

    public Gallery(String name, InputStream img) {
        this.name = name;
        this.img = img;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return this.id;
    }
    
    public void setImg(InputStream img) {
        this.img = img;
    }

    public InputStream getImg() {
        return this.img;
    }
    
    public void setImgString(String img) {
        this.imgString = img;
    }

    public String getImgString() {
        return this.imgString;
    }

    private int getMaxId() {
        int maxID = -1;
        try {
            //-----------------Getting Connection-----------------------------------------        
            Database conn = new Database();

            Connection connection = conn.Connection();
            //-----------------Getting Connection----------------------------------------- 
            Statement s2 = connection.createStatement();
            s2.execute("SELECT MAX(id) FROM images");
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

            PreparedStatement insertImage = connection.prepareStatement("insert into images values(?,?,?)");

            id = id + 1;
            insertImage.setInt(1, id);
            insertImage.setString(2, name);
            insertImage.setBlob(3, img);

            int i = insertImage.executeUpdate();

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
}

