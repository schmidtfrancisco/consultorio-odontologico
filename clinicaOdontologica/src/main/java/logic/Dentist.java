package logic;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Dentist extends Person implements Serializable {
    //private int id;
    private String speciality;
    @OneToMany(mappedBy="dentist")
    private List<Appointment> shiftList;
    @OneToOne
    private User user;
    @OneToOne
    private Schedule schedule;

    public Dentist() {
    }

    public Dentist(String speciality, List<Appointment> shiftList, User user, Schedule schedule, int id, String dni, String name, String lastname, String phoneNumber, String address, Date birthdate) {
        super(id, dni, name, lastname, phoneNumber, address, birthdate);
        this.speciality = speciality;
        this.shiftList = shiftList;
        this.user = user;
        this.schedule = schedule;
    }

    /*
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }*/

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
