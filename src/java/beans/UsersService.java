/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import MySqlDatabase.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UsersService {

    public User getUserByUsername(String username) {

        User user = new User();
        try {
            Database conn = new Database();
            Connection connection = conn.Connection();

            PreparedStatement query = connection.prepareStatement("SELECT * FROM users WHERE uname = ?");

            query.setString(1, username);
            ResultSet rs = query.executeQuery();;

            while (rs.next()) {
                user.setUsername(username);
                user.setFirstname(rs.getString("first_name"));
                user.setLastname(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
                user.setCountry(rs.getString("country"));
                user.setStreet(rs.getString("street"));
                user.setPostcode(rs.getString("postcode"));
                user.setPassword(rs.getString("pass"));
            }

            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }

        return user;
    }

    public void updateUser(User user,String oldUsername) {

        try {
            Database conn = new Database();
            Connection connection = conn.Connection();

            PreparedStatement query = connection.prepareStatement("update users  set uname=? , pass=? , first_name=? , last_name =?,email=? , country=? , street =? , postcode=? where uname=?");

            query.setString(1, user.getUsername());
            query.setString(2, user.getPassword());

            query.setString(3, user.getFirstname());
            query.setString(4, user.getLastname());
            query.setString(5, user.getEmail());
            query.setString(6, user.getCountry());
            query.setString(7, user.getStreet());
            query.setString(8, user.getPostcode());
            query.setString(9, oldUsername);

              query.executeUpdate();

            connection.close();

        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
