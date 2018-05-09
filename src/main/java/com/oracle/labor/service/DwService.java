package com.oracle.labor.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.labor.dao.ZjDwzpdjbMapper;
import com.oracle.labor.dao.ZjDwzpgzbMapper;
import com.oracle.labor.po.ZjDwzpdjb;
import com.oracle.labor.po.ZjDwzpgzb;

@Service
public class DwService {
	
	@Autowired
	ZjDwzpdjbMapper dwDao;
	@Autowired
	ZjDwzpgzbMapper dwgzDao;
	
	//查询符合条件的单位
	public List<Map<String,Object>> getDw(String bioNo,String bioName){
		//System.out.println(dwDao.getDw(bioNo,bioName).toString());
		return dwDao.getDw(bioNo,bioName);
	}
	//登记单位的招聘信息
	@Transactional
	public void DwZp_save(ZjDwzpdjb b1,ZjDwzpgzb b2){
		//进行两个表的插入操作
		
		dwDao.insert(b1);
		dwgzDao.insert(b2);
		
	}

}
