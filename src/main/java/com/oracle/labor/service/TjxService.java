package com.oracle.labor.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.labor.dao.ZjTjxxbMapper;
import com.oracle.labor.po.ZjTjxxb;

@Service
public class TjxService {

	 @Autowired
	 ZjTjxxbMapper tjxDao;
	 
	 public void insert(ZjTjxxb record){
		 tjxDao.insert(record);
	 }
	 
	 public List<Map<String,Object>> selectTohz(String bipSfz,String bipName,String bioNo,String bioName,String tjsj1,String tjsj2,String tjxlx){
		 return tjxDao.selectTohz(bipSfz, bipName, bioNo, bioName, tjsj1, tjsj2, tjxlx);
	 }
}
