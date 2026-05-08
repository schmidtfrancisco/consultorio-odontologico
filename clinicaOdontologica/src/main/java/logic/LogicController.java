package logic;

import persistence.PersistenceController;

public class LogicController {
    PersistenceController persistenceController = new PersistenceController();
    
    public void createUser(int id, String username, String password, String role) {
        User user = new User(id, username, password, role);
        persistenceController.createUser(user);
    }
}
