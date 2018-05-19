package com.oracle.labor.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.labor.dao.BipMapper;
import com.oracle.labor.po.Bip;

@Service
public class BipService {

	@Autowired
	BipMapper bipDao;

	// 获得bip
	public Bip getBip(String bipId) {
		return bipDao.selectByPrimaryKey(bipId);
	}

	// 查询出符合条件的求职者
	public List<Map<String, Object>> getQzz(String gz, String bipSex, String bipHyzk, String bipWhcd, String bipHjxz,
			String bipRylb, String bipJkzk, String bipTNewgraduate, String gzdq, String minAge, String maxAge,
			String minLong,String maxLong) {
		return bipDao.getQzz(gz, bipSex, bipHyzk, bipWhcd, bipHjxz, bipRylb, bipJkzk, bipTNewgraduate, gzdq, minAge,
				maxAge, minLong,maxLong);
	}
	
	//查看求职者详细信息
	public List<Map<String,Object>> getQzzxq(String bipId){
		return bipDao.getQzzxq(bipId);
	}
	
	//个人查询
	public List<Map<String,Object>> selectToGr(String bipSfz,String bipName,String bipSex,String minAge,String maxAge,String whcd1,String whcd2,String hyzk,String jkzk,String djsj1,String djsj2,String zzmm,String qzgw,String rylb,String hjxz,String cxfw){
		return bipDao.selectToGr(bipSfz, bipName, bipSex, minAge, maxAge, whcd1, whcd2, hyzk, jkzk, djsj1, djsj2, zzmm, qzgw, rylb, hjxz, cxfw);
	}

}
