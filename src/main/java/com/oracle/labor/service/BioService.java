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
	public List<Map<String,Object>> getBio(String bioId){
		return bioDao.selectByBioId(bioId);
	}
	
	//查看单位部分信息
	public List<Map<String,Object>> getBio2(String bioId){
		return bioDao.selectByBioId2(bioId);
	}
	
	//获得bio表信息
	public Bio getBioxx(String bioId){
		return bioDao.selectByPrimaryKey(bioId);
	}
	
	//单位查询
	public List<Map<String,Object>> selectToDw(String bioNo,String bioName,String djsj1,String djsj2,String regType,String orgType,String gwlb,String zpgw, String rylb,String hjxz, String cxfw,String industry){
		return bioDao.selectToDw(bioNo, bioName, djsj1, djsj2, regType, orgType, gwlb, zpgw, rylb, hjxz, cxfw, industry);
	}
	
}
