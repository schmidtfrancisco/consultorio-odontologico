package logic;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Appointment implements Serializable {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
    @Temporal(TemporalType.DATE)
    private Date appointmentDate;
    private String appointmentTime;
    private String condition;
    @ManyToOne
    @JoinColumn(name="appointment_id")
    private Dentist dentist;
    @ManyToOne
    @JoinColumn(name="appointment_id2")
    private Patient patient;

    public Appointment() {
    }

    public Appointment(int id, Date appointmentDate, String appointmentTime, String condition) {
        this.id = id;
        this.appointmentDate = appointmentDate;
        this.appointmentTime = appointmentTime;
        this.condition = condition;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(Date appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public String getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(String appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }
    
    
}
