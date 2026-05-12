package persistence;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logic.User;
import persistence.exceptions.NonexistentEntityException;

public class PersistenceController {
    AppointmentJpaController appointmentJpa = new AppointmentJpaController();
    DentistJpaController dentistJpa = new DentistJpaController();
    PatientJpaController patientJpa = new PatientJpaController();
    PersonJpaController personJpa = new PersonJpaController();
    ResponsibleJpaController responsibleJpa = new ResponsibleJpaController();
    ScheduleJpaController scheduleJpa = new ScheduleJpaController();
    SecretaryJpaController secretaryJpa = new SecretaryJpaController();
    UserJpaController userJpa = new UserJpaController();

    public void createUser(User user) {
        userJpa.create(user);
    }
    
    public User getUser(int userId) {
        return userJpa.findUser(userId);
    }

    public List<User> getUsers() {
        return userJpa.findUserEntities();
    }

    public void editUser(User userToEdit) {
        try {
            userJpa.edit(userToEdit);
        } catch (Exception ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void deleteUser(int userId) {
        try {
            userJpa.destroy(userId);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(PersistenceController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
