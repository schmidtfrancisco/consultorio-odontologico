package logic;

import java.util.Date;
import java.util.List;

public class Patient extends Person {
    private int id;
    private boolean hasSocialWork;
    private String bloodType;
    private Responsible responsible;
    private List<Appointment> shiftList;

    public Patient() {
    }

    public Patient(int id, boolean hasSocialWork, String bloodType, Responsible responsible, List<Appointment> shiftList, String dni, String name, String lastname, String phoneNumber, String address, Date bornDate) {
        super(dni, name, lastname, phoneNumber, address, bornDate);
        this.id = id;
        this.hasSocialWork = hasSocialWork;
        this.bloodType = bloodType;
        this.responsible = responsible;
        this.shiftList = shiftList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

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
