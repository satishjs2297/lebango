package com.lebango.mapper;

import java.util.List;

import com.lebango.bean.Document;

public interface DocumentMapper {
	void insert(Document document);
	List<Document> get(Document document);
}
