package logic;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;

@Entity
public class Responsible extends Person implements Serializable {
    //private int id;
    private String responsabilityType;

    public Responsible() {
    }

    public Responsible(String responsabilityType, int id, String dni, String name, String lastname, String phoneNumber, String address, Date birthdate) {
        super(id, dni, name, lastname, phoneNumber, address, birthdate);
        this.responsabilityType = responsabilityType;
    }

    /*
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }*/

    public String getResponsabilityType() {
        return responsabilityType;
    }

    public void setResponsabilityType(String responsabilityType) {
        this.responsabilityType = responsabilityType;
    }
}
