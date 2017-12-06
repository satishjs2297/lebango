package com.lebango.mapper;

import java.util.List;

import com.lebango.bean.Card;

public interface CardMapper {
	
	List<Card> getAll();
	List<Card> getByUser(int user_id);
	void insert(Card card);
	void update(Card card);
	void delete(Card card);
}
