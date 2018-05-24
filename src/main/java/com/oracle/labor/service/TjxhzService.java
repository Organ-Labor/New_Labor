package com.oracle.labor.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.labor.dao.ZjTjxxhzbMapper;
import com.oracle.labor.po.ZjTjxxhzb;

@Service
public class TjxhzService {
	@Autowired
	ZjTjxxhzbMapper tjxhzDao;
	
	public void insert(ZjTjxxhzb record){
		tjxhzDao.insert(record);
	}

}
