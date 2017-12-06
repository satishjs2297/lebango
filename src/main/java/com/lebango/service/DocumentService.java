package com.lebango.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lebango.bean.Document;
import com.lebango.mapper.DocumentMapper;

@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class DocumentService {
	@Autowired
	private DocumentMapper documentMapper;
	
	public void insert(Document document) {
		documentMapper.insert(document);
	}
	public List<Document> get(Document document) {
		return documentMapper.get(document);
	}
}
