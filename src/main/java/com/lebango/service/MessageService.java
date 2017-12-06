package com.lebango.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lebango.bean.Message;
import com.lebango.bean.User;
import com.lebango.mapper.MessageMapper;

@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class MessageService {
	@Autowired
	private MessageMapper messageMapper;
	
	public List<Message> get(User user) {
		return messageMapper.get(user);
	}
	
	public void insert(Message message) {
		messageMapper.create(message);
		return;
	}
}
