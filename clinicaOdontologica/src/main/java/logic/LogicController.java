package logic;

import persistence.PersistenceController;

public class LogicController {

    PersistenceController persistenceController = new PersistenceController();

    public void createUser(String username, String password, String role) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        if (role.equals("dentist")) {
            user.setRole("Odontólogo");
        } else {
            if (role.equals("secretary")) {
                user.setRole("Secretario");
            } else {
                user.setRole("Administrador");
            }
        }

        persistenceController.createUser(user);
    }
}
