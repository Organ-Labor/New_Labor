package com.oracle.labor.service;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.labor.dao.BipMapper;
import com.oracle.labor.dao.ZjDwzpdjbMapper;

@Service
public class DwService {
	
	@Autowired
	ZjDwzpdjbMapper dwDao;
	
	@Autowired
	BipMapper bipDao;
	
	//查询符合条件的单位
	public List<Map<String,Object>> getDw(String bioNo,String bioName){
		//System.out.println(dwDao.getDw(bioNo,bioName).toString());
		return dwDao.getDw(bioNo,bioName);
	}
	
	//根据单位编号查询出单位招聘岗位
	public String getZpgz(String bioId){
		System.out.println("DwService里查找的招聘岗位："+dwDao.getZpgz(bioId));
		
		List<Map<String,Object>> list=dwDao.getZpgz(bioId);
		StringBuilder sb=new StringBuilder();
		
		//拼接
		for(Map<String,Object> m:list){
			sb.append("<option value='"+m.get("gzbh")+"'>").append(m.get("zpgz")).append("</option>");
		}
		
		System.out.println("在DwService中输出的结果："+sb.toString());
		
		return sb.toString();
	}
	
    public List<Map<String,Object>> getBB(String bioId,String bipId,String gzbh){
    	return dwDao.getBB(bioId, bipId, gzbh);
    }
    
    //推荐查询
    public List<Map<String,Object>> getSearch(String bipSex,String hjxz,String minAge,String maxAge,String rylb,String gz,String whcd1,String whcd2,String orgtype,String gwlb,String djsj1,String djsj2,String tjsj1,String tjsj2,String hzzt){
    	return dwDao.getSearch(bipSex, hjxz, minAge, maxAge, rylb, gz, whcd1, whcd2, orgtype, gwlb, djsj1, djsj2, tjsj1, tjsj2, hzzt);
    }
}
