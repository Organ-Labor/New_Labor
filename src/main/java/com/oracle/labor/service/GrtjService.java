package com.oracle.labor.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.labor.dao.BipMapper;

@Service
public class GrtjService {
	@Autowired
	BipMapper bipDao;
	/**
	 * 通过姓名或身份证号查询出人员信息
	 * @param id
	 * @param name
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<Map<String,Object>> searchPerson(String id,String name){
//		System.out.println("\n\n\n"+"___________"+"\n\n\n");
//		System.out.println("参数是"+id+" "+name);
//		System.out.println("\n\n\n"+"___________"+"\n\n\n");
		if(id=="") {
			name="%"+name+"%";
			return bipDao.searchByName(name);
		}else {
			return bipDao.searchById(id);
		}
	}
	/**
	 * 根据身份证号找出姓名
	 * @param id 
	 * @return 个人身份证号
	 */
	public String getName(String id) {
		return bipDao.getName(id);
	}
	
	/**
	 * 根据法人码找出单位名
	 * @param id
	 * @return
	 */
	public String getDwName(String id) {
		return bipDao.getDwName(id);
	}
	/**
	 * 查询个人基本信息及推荐条件
	 * @param id 个人求职登记表的登记编号
	 * @return
	 */
	@Transactional(readOnly=true)
	public Map<String,Object> recommend(String id){
		return bipDao.recommend(id);
	}
	
	/**
	 * 查询个人信息详情
	 * @param id 个人的bip_id
	 * @return
	 */
	@Transactional(readOnly=true)
	 public Map<String,Object> showPersonDetails(String id){
		 return bipDao.showPersonDetails(id);
	 }
	
	public List<Map<String,Object>> getGz(String id){
		return bipDao.getGz(id);
	}
	
	/**
	 * 根据条件查询单位信息
	 * @param dwxz
	 * @param dwhy
	 * @param dwjjlx
	 * @param xb
	 * @param ppfw
	 * @param whcd
	 * @param gzppfw
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<Map<String,Object>> dwList(
	    		String dwxz,
	    		String dwhy,
	    		String dwjjlx,
	    		String xb,
	    		String ppfw,
	    		String whcd,
	    		String gzppfw){
		 return bipDao.dwList(dwxz, dwhy, dwjjlx, xb, ppfw, whcd, gzppfw);
	 }
	
	@Transactional(readOnly=true)
	public List<Map<String,Object>> dwDetails(String id) {
		return bipDao.dwDetails(id);
	}
	
	@Transactional(readOnly=true)
	public List<Map<String,Object>> hzcx(
			String id,
			String name,
			String pio_no,
			String pio_name,
			String date_f,
			String date_l,
			String lx
			){
		return bipDao.hzcx(id, name, pio_no, pio_name, date_f, date_l, lx);
	}
	
	public void updateHz(String hzno,String sfcg,String cgyx,String bcg) {
		bipDao.updateHz(hzno, sfcg, cgyx, bcg);
	}
	
	public Map<String,Object> selectDw(String id){
		return bipDao.selectDw(id);
	}
}
