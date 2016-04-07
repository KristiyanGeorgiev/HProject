package beans;

import java.util.LinkedList;

/**
 *
 * @author KiKo
 */
public class Account {

    private int id;
    private String uname;
    private String date;

    public Account(int id, String username) {
        this.id = id;
        this.uname = username;
        this.date = date;
        
    }
    
    public void setId(int id) {
        this.id = id;
        this.id = id;
    }
    
    public int getId() {
        return id;
    }
    
    public void setUsername(String username) {
        this.uname = username;
    }
    
    public String getUsername() {
        return uname;
    }
    
    public void setDate(String date) {
        this.date = date;
    }
    
     public String getDate() {
        return date;
    }
   
}

