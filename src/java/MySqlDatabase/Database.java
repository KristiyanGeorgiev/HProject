/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MySqlDatabase;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Database
{
    public Connection Connection()
    {
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/honours",
            "kristiyan", "kris");
            return con;
            
        } catch (ClassNotFoundException | SQLException ex) {Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);}
        return null;
    }
}

