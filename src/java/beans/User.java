/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.*;
import MySqlDatabase.Database;
import java.util.logging.Level;
import java.util.logging.Logger;

public class User {  

   private String username;
   private String password;
   private String firstname;
   private String lastname;
   private String email;
   private String country;
   private String street;
   private String postcode;
        

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setUsername(String username) {
       this.username = username;
    }

    public String getUsername() {
        return username;
    }
    
    public void setStreet(String street) {
       this.street = street;
    }

    public String getStreet() {
        return street;
    }
    
    public void setPostcode(String postcode) {
       this.postcode = postcode;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCountry() {
        return country;

    }


    public void RegisterUser()
    {
        try
        {    
            Database conn = new Database();
            Connection connection= conn.Connection();

            String sqlString="INSERT INTO users (first_name,last_name,email,uname,pass,country,street,postcode,regdate) VALUES ('"+firstname+"','"+lastname+"','"+email+"','"+username+"','"+password+"','"+country+"','"+street+"','"+postcode+"',CURDATE())";
            
            Statement myStatement = connection.createStatement();
            
            try
            {    
                myStatement.executeUpdate(sqlString);
                myStatement.close();
                connection.close();
            } catch (SQLException ex) {Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);}
        } catch (SQLException ex) {Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);}  
    }
    
    public void GetUser()
    {
            try 
            {      
                Database conn=new Database();
                Connection connection= conn.Connection();
                
                String sqlString = "SELECT * FROM users WHERE username = '"+username+"'";
                Statement statement = connection.createStatement();
                ResultSet rs=statement.executeQuery(sqlString);

                while(rs.next())
                {
                    firstname= rs.getString("firstname");
                    lastname = rs.getString("lastname");
                    username= rs.getString("username");
                    email= rs.getString("email");
                    country= rs.getString("country");
                    street= rs.getString("street");
                    postcode= rs.getString("postcode");
                }
                
                statement.close();
                connection.close();
                
            } catch (SQLException ex) {Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);} 
            
    }
    
    public boolean authenticateUser()
    {
        boolean auth = false;
        try {
            //-----------------Getting Connection-----------------------------------------        
            Database conn = new Database();
            Connection connection= conn.Connection();
            //-----------------Getting Connection----------------------------------------- 
            PreparedStatement query = connection.prepareStatement("select count(*) from users where pass=? and uname=?");

            query.setString(1, password);
            query.setString(2, username);

            ResultSet rs = query.executeQuery();
            rs.next();
            int rowCount = rs.getInt(1);

            if (rowCount > 0) {
                auth = true;
            }
            
            connection.close();

        } catch (Exception e2) {
            System.out.println(e2);
        }

        return auth;
    }
    
}

