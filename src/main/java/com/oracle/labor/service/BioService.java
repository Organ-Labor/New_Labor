package com.oracle.labor.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.labor.dao.BioMapper;
import com.oracle.labor.po.Bio;
import com.oracle.labor.po.BioExample;

@Service
public class BioService {
     
	@Autowired
	BioMapper bioDao;
	
	@Transactional
	public void save(Bio bio){
		bioDao.insert(bio);
	}
	//查看单位详细信息
	public Bio getBio(String bioId){
		BioExample e=new BioExample();
	    e.createCriteria().andBioIdEqualTo(bioId);
		return bioDao.selectByPrimaryKey(bioId);
	}
	
}
