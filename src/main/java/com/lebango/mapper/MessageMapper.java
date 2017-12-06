package com.lebango.mapper;

import java.util.List;

import com.lebango.bean.Message;
import com.lebango.bean.User;

public interface MessageMapper {
	List<Message> get(User user);
	void create(Message message);
}
