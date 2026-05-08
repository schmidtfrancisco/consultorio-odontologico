package logic;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Patient extends Person implements Serializable {
    //private int id;
    private boolean hasSocialWork;
    private String bloodType;
    @OneToOne
    private Responsible responsible;
    @OneToMany(mappedBy="patient")
    private List<Appointment> shiftList;

    public Patient() {
    }

    public Patient(boolean hasSocialWork, String bloodType, Responsible responsible, List<Appointment> shiftList, int id, String dni, String name, String lastname, String phoneNumber, String address, Date birthdate) {
        super(id, dni, name, lastname, phoneNumber, address, birthdate);
        this.hasSocialWork = hasSocialWork;
        this.bloodType = bloodType;
        this.responsible = responsible;
        this.shiftList = shiftList;
    }
        
    /*
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }*/

    public boolean isHasSocialWork() {
        return hasSocialWork;
    }

    public void setHasSocialWork(boolean hasSocialWork) {
        this.hasSocialWork = hasSocialWork;
    }

    public String getBloodType() {
        return bloodType;
    }

    public void setBloodType(String bloodType) {
        this.bloodType = bloodType;
    }      

    public Responsible getResponsible() {
        return responsible;
    }

    public void setResponsible(Responsible responsible) {
        this.responsible = responsible;
    }

    public List<Appointment> getShiftList() {
        return shiftList;
    }

    public void setShiftList(List<Appointment> shiftList) {
        this.shiftList = shiftList;
    }
    
    
}
