package com.lebango.mapper;

import com.lebango.bean.User;

/**
 *
 * @author edwin < edwinkun at gmail dot com >
 */

public interface UserMapper {
	
	public User getUserById(int user_id);
    public void insert(User user);
    public User findByEmailAndPassword(User user);
    public void updateProfile(User user);
    public void updateApprove(User user);
	public int checkExisting(User user);
	public User getAdmin();
    
}
