package com.oracle.labor.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.labor.common.util.GenerateID;
import com.oracle.labor.dao.BioMapper;
import com.oracle.labor.po.Bio;

@Service
public class BioService {
     
	@Autowired
	BioMapper bioDao;
	
	@Transactional
	public void save(Bio bio){
		bio.setBioId(GenerateID.getGenerateId());
		bioDao.insert(bio);
	}
	
}
