package com.oracle.labor.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.labor.common.codetable.ComputergradeOperation;
import com.oracle.labor.common.codetable.Deformity;
import com.oracle.labor.common.codetable.EducationallevelOperation;
import com.oracle.labor.common.codetable.HealthstateOperation;
import com.oracle.labor.common.codetable.IndustryOperation;
import com.oracle.labor.common.codetable.LanguageOperation;
import com.oracle.labor.common.codetable.MarriageOperation;
import com.oracle.labor.common.codetable.NationOperation;
import com.oracle.labor.common.codetable.OrgtypeOperation;
import com.oracle.labor.common.codetable.PersonneltypeOperation;
import com.oracle.labor.common.codetable.PoliticsaspectOperation;
import com.oracle.labor.common.codetable.ProficiencyOperation;
import com.oracle.labor.common.codetable.QualificationOperation;
import com.oracle.labor.common.codetable.RegioncodeOperation;
import com.oracle.labor.common.codetable.RegtypeOperation;
import com.oracle.labor.common.codetable.RprtypeOperation;
import com.oracle.labor.common.codetable.SexOperation;
import com.oracle.labor.common.codetable.SpecialtyOperation;

@Controller
public class CommonHandler {

	//返回文本;
	@ResponseBody
	@RequestMapping(value="/service/language/{value}",produces="text/html;charset=UTF-8")
	public String getLanguage(@PathVariable("value") String value) {
		String result=LanguageOperation.getOption(value);
		System.out.println(result);
		return result;
	}
	
	//ResponseBody返回方法体不经过视图解析器
	//返回性别的下拉列表
	@ResponseBody
	@RequestMapping(value="/service/sex/{value}",produces="text/html;charset=UTF-8")
	public String getSex(@PathVariable("value") String value){
		return SexOperation.getOption(value);
	}
	//返回民族的下拉列表
	@ResponseBody
	@RequestMapping(value="/service/nations/{value}",produces="text/html;charset=UTF-8")
	public String getNations(@PathVariable("value") String value){
		return NationOperation.getOption(value);
	}
	//返回政治面貌的下拉列表
	@ResponseBody
	@RequestMapping(value="/service/zzmm/{value}",produces="text/html;charset=UTF-8")
	public String getZzmm(@PathVariable("value") String value){
		return PoliticsaspectOperation.getOption(value);
	}
	//返回婚姻状况的下拉列表
	@ResponseBody
	@RequestMapping(value="/service/hyzk/{value}",produces="text/html;charset=UTF-8")
	public String getHyzk(@PathVariable("value") String value){
		return MarriageOperation.getOption(value);
	}
   
	//返回人员类别的下拉列表
	@ResponseBody
	@RequestMapping(value="/service/rylb/{value}",produces="text/html;charset=UTF-8")
	public String getRylb(@PathVariable("value") String value){
		return PersonneltypeOperation.getOption(value);
	}
	
	//返回健康状况下拉列表
	@ResponseBody
	@RequestMapping(value="/service/jkzk/{value}",produces="text/html;charset=UTF-8")
	public String getJkzk(@PathVariable("value") String value){
		return HealthstateOperation.getOption(value);
	}
	
	//残疾状况
	@ResponseBody
	@RequestMapping(value="/service/cjzk/{value}",produces="text/html;charset=UTF-8")
	public String getCjzk(@PathVariable("value") String value){
		return Deformity.getOption(value);
	}
	
	//户籍性质
	@ResponseBody
	@RequestMapping(value="/service/hjxz/{value}",produces="text/html;charset=UTF-8")
	public String getHjxz(@PathVariable("value") String value){
		return RprtypeOperation.getOption(value);
	}
	
	//返回省份的下拉列表
	@ResponseBody
	@RequestMapping(value="/province/{value1}/{value2}",produces="text/html;charset=UTF-8")
	public String getProvince(@PathVariable("value1") String value1 ,@PathVariable("value2") String value2){
		return  RegioncodeOperation.getSelectedRegion(value1,value2);
	}
	//返回市区
		@ResponseBody
		@RequestMapping(value="/city/{value1}/{value2}",produces="text/html;charset=UTF-8")
		public String getCity(@PathVariable("value1") String value1 ,@PathVariable("value2") String value2){
			return  RegioncodeOperation.getSelectedRegion(value1,value2);
		}
	//返回街道
		@ResponseBody
		@RequestMapping(value="/village/{value1}/{value2}",produces="text/html;charset=UTF-8")
		public String getVillage(@PathVariable("value1") String value1 ,@PathVariable("value2") String value2){
			return  RegioncodeOperation.getSelectedRegion(value1,value2);
		}
		
	//文化程度
	@ResponseBody
	@RequestMapping(value="/service/whcd/{value}",produces="text/html;charset=UTF-8")
	public String getWhcd(@PathVariable("value") String value){
		return EducationallevelOperation.getOption(value);
	}
	
	
	
	//计算机等级
	@ResponseBody
	@RequestMapping(value="/service/jsjdj/{value}",produces="text/html;charset=UTF-8")
	public String getJsjdj(@PathVariable("value") String value){
		return ComputergradeOperation.getOption(value);
	}
	
	//职业技能
		//大类
		@ResponseBody
		@RequestMapping(value="/common/gw/{value1}/{value2}",produces="text/html;charset=UTF-8")
		public String getgw(@PathVariable("value1") String value1 ,@PathVariable("value2") String value2){
			return  SpecialtyOperation.getSelectedGz(value1,value2);
		}
		//中类
		@ResponseBody
		@RequestMapping(value="/common/gz1/{value1}/{value2}",produces="text/html;charset=UTF-8")
		public String getgz1(@PathVariable("value1") String value1 ,@PathVariable("value2") String value2){
			return  SpecialtyOperation.getSelectedGz(value1,value2);
		}
		//小类
		@ResponseBody
		@RequestMapping(value="/common/gz2/{value1}/{value2}",produces="text/html;charset=UTF-8")
		public String getgz2(@PathVariable("value1") String value1 ,@PathVariable("value2") String value2){
			return  SpecialtyOperation.getSelectedGz(value1,value2);
		}
		//中类
		@ResponseBody
		@RequestMapping(value="/common/gz3/{value1}/{value2}",produces="text/html;charset=UTF-8")
		public String getgz3(@PathVariable("value1") String value1 ,@PathVariable("value2") String value2){
			return  SpecialtyOperation.getSelectedGz(value1,value2);
		}
	//技术等级
	
	//熟练程度
	@ResponseBody
	@RequestMapping(value="/service/slcd/{value}",produces="text/html;charset=UTF-8")
	public String getSlcd(@PathVariable("value") String value){
		return ProficiencyOperation.getOption(value);
	}
	
	//单位行业
	@ResponseBody
	@RequestMapping(value="/service/dwhy/{value}",produces="text/html;charset=UTF-8")
	public String getDwhy(@PathVariable("value") String value){
		return IndustryOperation.getOption(value);
	}
	//单位性质
	@ResponseBody
	@RequestMapping(value="/service/dwxz/{value}",produces="text/html;charset=UTF-8")
	public String getDwxz(@PathVariable("value") String value){
		return OrgtypeOperation.getOption(value);
	}
	//经济类型
	@ResponseBody
	@RequestMapping(value="/service/dwjjlx/{value}",produces="text/html;charset=UTF-8")
	public String getDwjjlx(@PathVariable("value") String value){
		return RegtypeOperation.getOption(value);
	}
	
}
