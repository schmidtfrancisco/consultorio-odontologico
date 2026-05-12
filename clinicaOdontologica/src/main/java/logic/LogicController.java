package logic;

import java.util.List;
import persistence.PersistenceController;

public class LogicController {

    PersistenceController persistenceController = new PersistenceController();

    public void createUser(String username, String password, String role) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setRole(getFriendlyRole(role));

        persistenceController.createUser(user);
    }

    public List<User> getUsers() {
        return persistenceController.getUsers();
    }

    public void editUser(int userId, String username, String password, String role) {
        User userToEdit = persistenceController.getUser(userId);
        userToEdit.setUsername(username);
        if (password != null && !password.isEmpty()) {
            userToEdit.setPassword(password);
        }
        userToEdit.setRole(getFriendlyRole(role));

        persistenceController.editUser(userToEdit);
    }
    
    public void deleteUser(int userId) {
        persistenceController.deleteUser(userId);
    }
    
    private String getFriendlyRole(String role) {
        String friendlyRole = "Administrador";
        if (role.equals("dentist")) {
            friendlyRole = "Odontólogo";
        } else {
            if (role.equals("secretary")) {
                friendlyRole = "Secretario";
            } 
        }
        return friendlyRole;
    }
}
