package com.oracle.labor.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.labor.common.codetable.ComputergradeOperation;
import com.oracle.labor.common.codetable.EducationallevelOperation;
import com.oracle.labor.common.codetable.EmploytypeOperation;
import com.oracle.labor.common.codetable.HealthstateOperation;
import com.oracle.labor.common.codetable.IndustryOperation;
import com.oracle.labor.common.codetable.LanguageOperation;
import com.oracle.labor.common.codetable.MarriageOperation;
import com.oracle.labor.common.codetable.OrgtypeOperation;
import com.oracle.labor.common.codetable.PersonneltypeOperation;
import com.oracle.labor.common.codetable.ProficiencyOperation;
import com.oracle.labor.common.codetable.RegioncodeOperation;
import com.oracle.labor.common.codetable.RegtypeOperation;
import com.oracle.labor.common.codetable.RprtypeOperation;
import com.oracle.labor.common.codetable.SpecialtyOperation;
import com.oracle.labor.common.codetable.ZjdgwlbOperation;
import com.oracle.labor.po.Bio;
import com.oracle.labor.service.BioService;

@Controller
public class DWZPHandler {
	
	@Autowired
	BioService bioservice;
	
    //单位性质
	@ResponseBody
	@RequestMapping(value="/service/Orgtypes/{value}",produces="text/html;charset=UTF-8")
	public String getOrgtypes(@PathVariable("value") String value){
		return OrgtypeOperation.getOption(value);
	}
	
	//经济类型
	@ResponseBody
	@RequestMapping(value="/service/Regtypes/{value}",produces="text/html;charset=UTF-8")
	public String getRegtypes(@PathVariable("value") String value){
		return RegtypeOperation.getOption(value);
	}
	
	//行业类别
	@ResponseBody
	@RequestMapping(value="/service/Industrys/{value}",produces="text/html;charset=UTF-8")
	public String getIndustry(@PathVariable("value") String value){
		return IndustryOperation.getOption(value);
	}
	
	//得到省
	@ResponseBody
	@RequestMapping(value="/service/Provinces",produces="text/html;charset=UTF-8")
	public String getProvince(){
		return RegioncodeOperation.getProvince();
	}
	//市
	@ResponseBody
	@RequestMapping(value="/service/Citys/{value}",produces="text/html;charset=UTF-8")
	public String getCitys(@PathVariable("value") String value){
		return RegioncodeOperation.getSelectedRegion(value,"city");
	}
	//区
	@ResponseBody
	@RequestMapping(value="/service/villages/{value}",produces="text/html;charset=UTF-8")
	public String getVillages(@PathVariable("value") String value){
		return RegioncodeOperation.getSelectedRegion(value,"village");
	}
	
	//保存单位基本信息
	 @RequestMapping("/service/save/{value}")
	    public String save(Bio bio,@PathVariable("value") String value) {
		    bio.setBioRgaRegioncode(value);
	        bioservice.save(bio);
	        return "redirect:/service/zj/dwzp/dwdj_3.jsp";
	    }
	//工种
		@ResponseBody
		@RequestMapping(value="/service/Specialtys",produces="text/html;charset=UTF-8")
		public String getSpecialty(){
			return SpecialtyOperation.getHy();
		}
		
		//根据参数得到省市区升级版
		@ResponseBody
		@RequestMapping(value="/service/Provinces/{id}/{code}",produces="text/html;charset=UTF-8")
		public String getArea(@PathVariable("id") String id,@PathVariable("code") String code){
			return RegioncodeOperation.getSelectedRegion(id, code);
		}
		
		//获得文化水平下拉列表
		@ResponseBody
		@RequestMapping(value="/service/Educationallevels/{value}",produces="text/html;charset=UTF-8")
		public String getEducationallevel(@PathVariable("value") String value){
			return EducationallevelOperation.getOption(value);
		}
		
		//获得岗位类别下拉列表
		@ResponseBody
		@RequestMapping(value="/service/Zjdgwlbs/{value}",produces="text/html;charset=UTF-8")
		public String getZjdgwlbs(@PathVariable("value") String value){
			return ZjdgwlbOperation.getOption(value);
		}
		//获得户籍性质下拉列表
		@ResponseBody
		@RequestMapping(value="/service/Rprtypes/{value}",produces="text/html;charset=UTF-8")
		public String getRprtype(@PathVariable("value") String value){
			return RprtypeOperation.getOption(value);
		}
		//获得户籍性质下拉列表
		@ResponseBody
		@RequestMapping(value="/service/Employtypes/{value}",produces="text/html;charset=UTF-8")
		public String getEmploytype(@PathVariable("value") String value){
			return EmploytypeOperation.getOption(value);
		}
		
		//获得婚姻状况下拉列表
		@ResponseBody
		@RequestMapping(value="/service/Marriages/{value}",produces="text/html;charset=UTF-8")
		public String getMarriage(@PathVariable("value") String value){
			return MarriageOperation.getOption(value);
		}
		
		//获得健康婚姻状况下拉列表
		@ResponseBody
		@RequestMapping(value="/service/Healthstates/{value}",produces="text/html;charset=UTF-8")
		public String getHealthstates(@PathVariable("value") String value){
			return HealthstateOperation.getOption(value);
		}
		//获得人员类别 下拉列表
		@ResponseBody
		@RequestMapping(value="/service/Personneltypes/{value}",produces="text/html;charset=UTF-8")
		public String getPersonneltypes(@PathVariable("value") String value){
			return PersonneltypeOperation.getOption(value);
		}
		//获得计算机等级 下拉列表
		@ResponseBody
		@RequestMapping(value="/service/Computergrades/{value}",produces="text/html;charset=UTF-8")
		public String getComputergrades(@PathVariable("value") String value){
			return ComputergradeOperation.getOption(value);
		}
		//获得熟练程度 下拉列表
		@ResponseBody
		@RequestMapping(value="/service/Proficiencys/{value}",produces="text/html;charset=UTF-8")
		public String getProficiencys(@PathVariable("value") String value){
			return ProficiencyOperation.getOption(value);
		}
		//获得语种 下拉列表
		@ResponseBody
		@RequestMapping(value="/service/Languages/{value}",produces="text/html;charset=UTF-8")
		public String getLanguages(@PathVariable("value") String value){
			return LanguageOperation.getOption(value);
		}
	
		
}