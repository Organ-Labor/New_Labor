package com.oracle.labor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.labor.common.util.GenerateID;
import com.oracle.labor.dao.BipForeignlanguageMapper;
import com.oracle.labor.dao.BipMapper;
import com.oracle.labor.dao.BipSkillMapper;
import com.oracle.labor.dao.ZjGrqzdjbMapper;
import com.oracle.labor.dao.ZjGrqzdjjdbMapper;
import com.oracle.labor.dao.ZjGrqzgzbMapper;
import com.oracle.labor.po.Bip;
import com.oracle.labor.po.BipExample;
import com.oracle.labor.po.BipForeignlanguage;
import com.oracle.labor.po.BipSkill;
import com.oracle.labor.po.ZjGrqzdjb;
import com.oracle.labor.po.ZjGrqzdjbExample;
import com.oracle.labor.po.ZjGrqzdjjdb;
import com.oracle.labor.po.ZjGrqzgzb;

@Service
public class QZService {
	@Autowired
	BipMapper qzDao;//基本信息表
	@Autowired
	BipForeignlanguageMapper wyDao;//外语表
	@Autowired
	BipSkillMapper jnDao;//技能表
	@Autowired
	ZjGrqzdjbMapper djbDao;//求职登记表
	@Autowired
	ZjGrqzdjjdbMapper jdbDao;//冻结解冻表
	@Autowired
	ZjGrqzgzbMapper gzbDao;//工种表
	
	@Transactional
	public void saveBip(Bip bip,BipForeignlanguage fl,BipSkill skill,ZjGrqzdjb djb,ZjGrqzgzb gzb){
		//保存基本信息表
		qzDao.insert(bip);
		//保存个人外语表
		wyDao.insert(fl);
		//保存个人技能表
		jnDao.insert(skill);
		//保存求职登记表
		djbDao.insert(djb); 
		//保存工种表
		gzbDao.insert(gzb);
		
	}
	public Bip cha1(String ct){
		BipExample example=new BipExample();
		example.createCriteria().andBipCitizenidEqualTo(ct);
		List<Bip> list=qzDao.selectByExample(example);
		Bip b=list.get(0);
		return b;
		
	}
	public ZjGrqzdjb cha2(String id){
		ZjGrqzdjbExample example=new ZjGrqzdjbExample();
		example.createCriteria().andBipIdEqualTo(id);
		List<ZjGrqzdjb> list=djbDao.selectByExample(example);
		ZjGrqzdjb z=list.get(0);
		return z;
	}
	
	public void savejdb(ZjGrqzdjjdb jdb){
		jdbDao.insert(jdb);
	}
	
//	public void selectjbd(String s,String s1,String s2){
//		ZjGrqzdjjdbExample example=new ZjGrqzdjjdbExample();
//		example.createCriteria().andQzbhEqualTo(s);
//		List<ZjGrqzdjjdb> list=jdbDao.selectByExample(example);
//		ZjGrqzdjjdb jdb=list.get(0);
//		jdb.setJidsj(s2);
//		jdb.setJidyy(s1);
//		jdbDao.updateByPrimaryKey(jdb);
//	}
	
	public void updata(String qzbh,String s){
		ZjGrqzdjbExample example=new ZjGrqzdjbExample();
		example.createCriteria().andQzbhEqualTo(qzbh);
		ZjGrqzdjb djb=djbDao.selectByPrimaryKey(qzbh);
		djb.setSfdj(s);
		djbDao.updateByPrimaryKey(djb);
		
	}
	
	

}
