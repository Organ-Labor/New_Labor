package com.oracle.labor.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.labor.dao.ZjDwdjjdbMapper;
import com.oracle.labor.dao.ZjDwzpdjbMapper;
import com.oracle.labor.dao.ZjDwzpgzbMapper;
import com.oracle.labor.po.ZjDwdjjdb;
import com.oracle.labor.po.ZjDwzpdjb;
import com.oracle.labor.po.ZjDwzpdjbExample;
import com.oracle.labor.po.ZjDwzpgzb;

@Service
public class DwService {
	
	@Autowired
	ZjDwzpdjbMapper dwDao;
	@Autowired
	ZjDwzpgzbMapper dwgzDao;
	@Autowired
	ZjDwdjjdbMapper dwdjDao;
	
	//根据id获取登记信息
	public ZjDwzpdjb getByid(String id){
	      ZjDwzpdjbExample e = new ZjDwzpdjbExample();
	      e.createCriteria().andZpbhEqualTo(id);
	      List<ZjDwzpdjb> list=dwDao.selectByExample(e);
	      return list.get(0);
	}
	
	//进行冻结|解冻
	@Transactional
	public void dwzp_jxdj(ZjDwdjjdb djjd,String type,String id){
		dwdjDao.insert(djjd);
		ZjDwzpdjbExample e=new ZjDwzpdjbExample();
		e.createCriteria().andZpbhEqualTo(id);
		
		ZjDwzpdjb aa=new ZjDwzpdjb();
		aa.setSfdj(type);
		
		dwDao.updateByExampleSelective(aa,e);
	}
	
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
	
	//获得冻结解冻信息
	public List<Map<String,Object>> getDw_djbyId(String value){
		
		return dwDao.getDw_djbyId(value);
	}
	//根据名称
	public List<Map<String,Object>> getDw_djbyName(String name){
		
		return dwDao.getDw_djbyName(name);
	}
	//根据Bioid获取公司招聘登记信息
	public List<Map<String,Object>> getDw_djbyBioid(String value){
		
		return dwDao.getDw_djbyBioId(value);
	}

}