package logic;

import java.util.Date;

public class Responsible extends Person {
    private int id;
    private String responsabilityType;

    public Responsible() {
    }

    public Responsible(int id, String responsabilityType, String dni, String name, String lastname, String phoneNumber, String address, Date bornDate) {
        super(dni, name, lastname, phoneNumber, address, bornDate);
        this.id = id;
        this.responsabilityType = responsabilityType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getResponsabilityType() {
        return responsabilityType;
    }

    public void setResponsabilityType(String responsabilityType) {
        this.responsabilityType = responsabilityType;
    }
}
