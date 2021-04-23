package ua.telecom.phonebook.userrecords.repository;

import ua.telecom.phonebook.userrecords.model.UserRecord;

import java.util.List;


public interface UserRecordRepository {

    
    UserRecord save(UserRecord user, int userId);

   
    boolean delete(int id, int userId);

    
    UserRecord get(int id, int userId);

    
    List<UserRecord> getAll(int userId);

}