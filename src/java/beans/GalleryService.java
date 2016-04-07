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

public class GalleryService {

    public List<Gallery> getAllImages() {
        List<Gallery> images = new ArrayList<>();
        try {
            //-----------------Getting Connection-----------------------------------------        
            Database conn = new Database();

            Connection connection = conn.Connection();
            //-----------------Getting Connection----------------------------------------- 
            PreparedStatement query = connection.prepareStatement("select * from images  ORDER BY `id`  DESC");

            ResultSet rs = query.executeQuery();

            while (rs.next()) {
                Gallery image = new Gallery();

                image.setId(rs.getInt("id"));
                image.setName(rs.getString("name"));

                Blob blob = rs.getBlob("image");
                byte[] imgData = new byte[10];
                imgData = blob.getBytes(1, (int) blob.length());
                String b64 = javax.xml.bind.DatatypeConverter.printBase64Binary(imgData);

                image.setImgString(b64);

                images.add(image);
            }

            connection.close();

        } catch (Exception e2) {
            System.out.println(e2);
        }

        return images;
    }
    
        public Gallery getGalleryById(String id) {
            
        Gallery image = new Gallery();
        try {
            //-----------------Getting Connection-----------------------------------------        
            Database conn = new Database();

            Connection connection = conn.Connection();
            //-----------------Getting Connection----------------------------------------- 
            PreparedStatement query = connection.prepareStatement("select * from images where id=?  ORDER BY `id`  DESC");

            query.setInt(1, Integer.parseInt(id));
            ResultSet rs = query.executeQuery();

            while (rs.next()) {
               

                image.setId(rs.getInt("id"));
                image.setName(rs.getString("name"));

                Blob blob = rs.getBlob("image");
                byte[] imgData = new byte[10];
                imgData = blob.getBytes(1, (int) blob.length());
                String b64 = javax.xml.bind.DatatypeConverter.printBase64Binary(imgData);

                image.setImgString(b64);

                
            }

            connection.close();

        } catch (Exception e2) {
            System.out.println(e2);
        }

        return image;
    }

    public boolean delete(String id) {
        boolean success = false;
        try {
            //-----------------Getting Connection-----------------------------------------        
            Database conn = new Database();

            Connection connection = conn.Connection();
            //-----------------Getting Connection----------------------------------------- 

            PreparedStatement deleteImage = connection.prepareStatement("DELETE FROM images WHERE id=?");

            deleteImage.setInt(1, Integer.parseInt(id));

            int i = 0;
            i = deleteImage.executeUpdate();
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

    public boolean update(String id, String name) {
        boolean success = false;
        try {
            //-----------------Getting Connection-----------------------------------------        
            Database conn = new Database();

            Connection connection = conn.Connection();
            //-----------------Getting Connection----------------------------------------- 

            PreparedStatement updateImage = connection.prepareStatement("update images set name=? where id=? ");
            updateImage.setString(1, name);
            updateImage.setInt(2, Integer.parseInt(id));

            int i = updateImage.executeUpdate();

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

}
