package com.oracle.labor.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oracle.labor.common.codetable.RegioncodeOperation;
import com.oracle.labor.common.codetable.SexOperation;
import com.oracle.labor.common.codetable.SpecialtyOperation;
import com.oracle.labor.service.BioService;
import com.oracle.labor.service.DwService;

@Controller
public class DwtjHandler {

	@Autowired
	DwService dwService;
	
	@Autowired
	BioService bioService;
	
//	@RequestMapping("/{path}")
//	public String path(@PathVariable("path") String path){
//		return "/service/zj/tjhz/"+path;
//	}
	
	//单位推荐--根据单位法人号和单位名称查询出单位信息(Dwxx)列表
	@RequestMapping("/service/getDwxx/{page}")//,String bioNo,String bioName,Map<String,Object> map
	public String getDwxx(@PathVariable("page") int page,String bioNo,String bioName,Map<String,Object> map){
		
		//分页插件
		PageHelper.startPage(page,10);
		PageInfo<Map<String,Object>> info=new PageInfo<Map<String,Object>>(dwService.getDw(bioNo,bioName));
		map.put("info", info);
		return "/service/zj/tjhz/dwtjfw_2";
	}
	
	//单位推荐--显示单位详情(Dwxq)
	@Transactional(readOnly=true)
	@RequestMapping("/service/getDwxq/{bioId}")
	public String getDwxq(@PathVariable("bioId") String bioId,Map<String,Object> map){
		map.put("bio", bioService.getBio(bioId));
		return "/service/zj/tjhz/dwxinxi";
	}
	
	//单位推荐表--获得单位名称和单位地址转到单位推荐条件选择页面
	@RequestMapping("/service/getDwmc/{bioId}")
	public String getDwmc(@PathVariable("bioId") String bioId,Map<String,Object> map){
		map.put("bioInfo", bioService.getBio(bioId));
		return "/service/zj/tjhz/dwtjfw_3";
	}
	
	//加载下拉列表
	//个人求职工种
	@ResponseBody
	@RequestMapping(value="/service/getQzgz/{value}",produces="text/html;charset=UTF-8")
	public String getQzgz(@PathVariable("value") String value){
		return SpecialtyOperation.getOption(value);
	}
	
	//性别
	@ResponseBody
	@RequestMapping(value="/service/getSex/{value}",produces="text/html;charset=UTF-8")
	public String getSex(@PathVariable("value") String value){
		return SexOperation.getOption(value);
	}
	
	//工作地区
	@ResponseBody
	@RequestMapping(value="/service/getGzdq",produces="text/html;charset=UTF-8")
	public String getGzdq(){
		return RegioncodeOperation.getProvince();
	}
	
}
