package logic;

import java.util.Date;
import java.util.List;

public class Dentist extends Person {
    private int id;
    private String speciality;
    private List<Appointment> shiftList;
    private User user;
    private Schedule schedule;

    public Dentist() {
    }

    public Dentist(int id, String speciality, List<Appointment> shiftList, User user, Schedule schedule, String dni, String name, String lastname, String phoneNumber, String address, Date bornDate) {
        super(dni, name, lastname, phoneNumber, address, bornDate);
        this.id = id;
        this.speciality = speciality;
        this.shiftList = shiftList;
        this.user = user;
        this.schedule = schedule;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSpeciality() {
        return speciality;
    }

    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }

    public List<Appointment> getShiftList() {
        return shiftList;
    }

    public void setShiftList(List<Appointment> shiftList) {
        this.shiftList = shiftList;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Schedule getSchedule() {
        return schedule;
    }

    public void setSchedule(Schedule schedule) {
        this.schedule = schedule;
    }
    
    
}
