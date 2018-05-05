package com.oracle.labor.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.labor.dao.BioMapper;
import com.oracle.labor.po.Bio;

@Service
public class BioService {

	@Autowired
	BioMapper bioDao;
	
	//查看单位详细信息
	public Bio getBio(String bioId){
		return bioDao.selectByPrimaryKey(bioId);
	}
	
}
