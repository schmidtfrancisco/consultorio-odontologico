package logic;

import java.util.Date;

public class Secretary extends Person {
    private int id;
    private String sector;
    private User user;

    public Secretary() {
    }

    public Secretary(int id, String sector, User user, String dni, String name, String lastname, String phoneNumber, String address, Date bornDate) {
        super(dni, name, lastname, phoneNumber, address, bornDate);
        this.id = id;
        this.sector = sector;
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

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
