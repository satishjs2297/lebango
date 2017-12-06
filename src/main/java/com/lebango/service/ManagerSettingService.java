package com.lebango.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.lebango.bean.ManagerSetting;
import com.lebango.mapper.ManagerSettingMapper;

@Service
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class ManagerSettingService {
	
	@Autowired
	private ManagerSettingMapper managerSettingMapper;
	
	public List<ManagerSetting> loadManagerSettings() {
		return managerSettingMapper.loadManagerSettings();
	}
}
