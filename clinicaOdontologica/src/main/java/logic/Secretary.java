package logic;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

@Entity
public class Secretary extends Person {
    //private int id;
    private String sector;
    @OneToOne
    private User user;

    public Secretary() {
    }

    public Secretary(String sector, User user, int id, String dni, String name, String lastname, String phoneNumber, String address, Date birthdate) {
        super(id, dni, name, lastname, phoneNumber, address, birthdate);
        this.sector = sector;
        this.user = user;
    }    

    /*
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }*/

    public String getSector() {
        return sector;
    }

    public void setSector(String sector) {
        this.sector = sector;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
   
    
}
