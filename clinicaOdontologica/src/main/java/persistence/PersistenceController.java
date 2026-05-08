package persistence;

import logic.User;

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
    
    
}
