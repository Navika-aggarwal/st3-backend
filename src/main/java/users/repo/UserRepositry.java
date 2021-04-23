package ua.telecom.phonebook.users.repository;

import ua.telecom.phonebook.users.model.User;

import java.util.List;


public interface UserRepository {

    User save(User user);

    
    boolean delete(int id);

    
    User get(int id);

    
    User getByPhoneNumber(String phoneNumber);

    List<User> getAll();
}