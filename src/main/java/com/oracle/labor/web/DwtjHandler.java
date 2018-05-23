package com.oracle.labor.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oracle.labor.service.DwService;

@Controller
@RequestMapping("/dwtj")
public class DwtjHandler {

	@Autowired
	DwService dwService;
	
	@RequestMapping("/service/saveqzb.do")
	public void save() {
		System.out.println("haha");
	}
	@RequestMapping("/service/getDwxx/{page}")
	public String getDwxx(@PathVariable("page") int page,HttpServletRequest request,Map<String,Object> map){
		
	    String bioId=request.getParameter("bioId");
		String bioName=request.getParameter("bioName");
		System.out.println("从前端传来的参数："+bioId+","+bioName);
		//分页插件
		PageHelper.startPage(page,10);
		PageInfo<Map<String,Object>> info=new PageInfo<Map<String,Object>>(dwService.getDw(bioId, bioName));
		
		map.put("info", info);
		return "dwtjfw_2";
	}
}
