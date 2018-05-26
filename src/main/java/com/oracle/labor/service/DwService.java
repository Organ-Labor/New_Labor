package com.oracle.labor.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.labor.dao.BipMapper;
import com.oracle.labor.dao.ZjDwdjjdbMapper;
import com.oracle.labor.dao.ZjDwzpdjbMapper;
import com.oracle.labor.dao.ZjDwzpgzbMapper;
import com.oracle.labor.dao.ZjTjxxhzbMapper;
import com.oracle.labor.po.ZjDwdjjdb;
import com.oracle.labor.po.ZjDwzpdjb;
import com.oracle.labor.po.ZjDwzpdjbExample;
import com.oracle.labor.po.ZjDwzpgzb;
import com.oracle.labor.po.ZjTjxxhzb;
import com.oracle.labor.po.ZjTjxxhzbExample;


@Service
public class DwService {
	
	@Autowired
	ZjDwzpdjbMapper dwDao;
	@Autowired
	ZjDwzpgzbMapper dwgzDao;
	@Autowired
	ZjDwdjjdbMapper dwdjDao;
	@Autowired
	ZjTjxxhzbMapper hzDao;
	
	//根据id获取单位回执信息.招聘信息
	public List<Map<String,Object>> select_dwgdbyid(@Param("id") String id){
			return dwDao.select_dwgdbyid(id);
	}
	
	//对延期的进行自动回执
	@Transactional
	public void update_hz(List<String> id){
		ZjTjxxhzbExample e=new ZjTjxxhzbExample();
		e.createCriteria().andTjxidIn(id);
		
		ZjTjxxhzb tjhz=new ZjTjxxhzb();
		SimpleDateFormat date=new SimpleDateFormat("yyyy-MM-dd");
	    String now=date.format(new Date());
		tjhz.setSfcg("y");
		tjhz.setSfhz("y");
		tjhz.setHzsj(now);
		
		hzDao.updateByExampleSelective(tjhz,e);
	}
	
	//获取所有未归档的招聘编号以及回执信息
	
	public List<Map<String,Object>> get_list(){
		return dwDao.getAll_wgd();
	}
	
	//归档
	@Transactional
	public void update_gd(@Param("id") String id,@Param("gdsj") String gdsj){
		dwDao.updatedw_gd(id, gdsj);
		dwDao.updatedwdj_gd(id, gdsj);
		dwDao.updatedwgz_gd(id, gdsj);
	}

	
	//根据条件获取单位信息
	public List<Map<String,Object>> getDw_gd(@Param("bio_no") String bio_no,@Param("bio_name") String bio_name,@Param("DJSJ") String DJSJ,@Param("DJSJZ") String DJSJZ,@Param("SFDJ") String SFDJ){
		return dwDao.getDw_gd(bio_no, bio_name, DJSJ, DJSJZ, SFDJ);
	}
	
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
	
	@Autowired
	BipMapper bipDao;

	
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
    
    //单位推荐-查询招聘条件
    public List<Map<String,Object>> selectTozptj(String bioId,String qzgz){
    	return dwgzDao.selectTozptj(bioId, qzgz);
    }
}

