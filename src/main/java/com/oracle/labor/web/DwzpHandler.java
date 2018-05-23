package com.oracle.labor.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
import com.oracle.labor.common.util.GenerateID;
import com.oracle.labor.po.Bio;
import com.oracle.labor.po.ZjDwdjjdb;
import com.oracle.labor.po.ZjDwzpdjb;
import com.oracle.labor.po.ZjDwzpgzb;
import com.oracle.labor.service.BioService;
import com.oracle.labor.service.DwService;

@Controller
@SessionAttributes({"info","company","dwgd"})
public class DwzpHandler {
	
	@Autowired
	BioService bioservice;
	
	@Autowired
	DwService dwservice;
	
	
	//单位归档
	@RequestMapping(value="/service/update_gd/{id}",produces="text/html;charset=utf-8")
	@ResponseBody
	public String updatedw_gd(@PathVariable("id") String id){
		//获取时间
		SimpleDateFormat date=new SimpleDateFormat("yyyy-MM-dd");
	    String now=date.format(new Date());
	    dwservice.update_gd(id, now);
	    return "归档成功";
	}
	
	//根据条件获取单位信息
	@RequestMapping(value="/service/getdw_gd/{page}",produces="text/html;charset=utf-8")
	public ModelAndView getDw_gd(@PathVariable("page") Integer page,@Param("bio_no") String bio_no,@Param("bio_name") String bio_name,@Param("DJSJ") String DJSJ,@Param("DJSJZ") String DJSJZ,@Param("SFDJ") String SFDJ){
		PageInfo<Map<String,Object>> info=null;
		PageHelper.startPage(page,5);
		info=new PageInfo<Map<String,Object>>(dwservice.getDw_gd(bio_no, bio_name, DJSJ, DJSJZ, SFDJ));
		
		return new ModelAndView("redirect:/service/zj/dwzp/dwgd_2.jsp","dwgd",info);
	}
	
	
	
	
	//进行冻结|解冻
	@RequestMapping(value="/service/dwzp_jxdj/{value}/{reason}",produces="text/html;charset=utf-8")
	@ResponseBody
	public String dwzp_djbyid(@PathVariable("value") String value,@PathVariable("reason") String reason){
		
		ZjDwzpdjb dj;
		String type="y";
		dj=dwservice.getByid(value);
		
		ZjDwdjjdb djjd=new ZjDwdjjdb();
		djjd.setDwdjjdbh(GenerateID.getGenerateId());
		djjd.setZpbh(dj.getZpbh());
		//获取时间
	    SimpleDateFormat date=new SimpleDateFormat("yyyy-MM-dd");
	    String now=date.format(new Date());
		if(dj.getSfdj().equals("y")){
		     djjd.setJdyy(reason);
		     djjd.setJdsj(now);
		     type="n";
		}else{
			djjd.setDjyy(reason);
			djjd.setDjsj(now);
			type="y";
		}
		dwservice.dwzp_jxdj(djjd,type,value);
		return "解冻/冻结成功！";
	}
	
	//根据公司id 获取招聘登记
//	@RequestMapping("/service/dwzp_djs2/{page}/{value}")
//	public String getdwzp_djbyBioid(@PathVariable("page") Integer page,@PathVariable("value") String value,Map<String,Object> map){
//		
//		PageHelper.startPage(page, 5);
//		PageInfo<Map<String,Object>> info=new PageInfo<Map<String,Object>>(dwservice.getDw_djbyBioid(value));
//		map.put("info",info);
//		System.out.println(info);
//		System.out.println("===============================================================");
//		System.out.println(dwservice.getDw_djbyBioid(value));
//		return "forward:/service/zj/dwzp/dwdj_dj_3.jsp";
//	}
	
	
	//根据参数获得公司招聘信息
	@RequestMapping("/service/dwzp_djs/{page}/{value}/{type}")
	
	public ModelAndView  getdwzp_dj(@PathVariable("page") Integer page,@PathVariable("value") String value,@PathVariable("type") String type){
		PageInfo<Map<String,Object>> info=null;
		if(type.equals("0")){
			PageHelper.startPage(page, 5);
			 info=new PageInfo<Map<String,Object>>(dwservice.getDw_djbyName(value));
			System.out.println(info);
		}
		if(type.equals("1")){
			PageHelper.startPage(page, 5);
			 info=new PageInfo<Map<String,Object>>(dwservice.getDw_djbyId(value));
			System.out.println(info);
		}
		//System.out.println(info);
		return new ModelAndView("redirect:/service/zj/dwzp/dwdj_dj_2.jsp","info",info);
	}
		
	//保存单位的登记信息
	 @RequestMapping("/service/dwzp_save")
	    public String dwzp_save(ZjDwzpdjb b1,ZjDwzpgzb b2) {
		 
		    //设置基本信息
		    String id=GenerateID.getGenerateId();
		    //计算总人数
		    int a=0,b=0,c=0;
		    if(b2.getZprsn()!=null&&b2.getZprsn()!="")
		         a=Integer.parseInt(b2.getZprsn());
		    if(b2.getZprsnv()!=null&&b2.getZprsnv()!="")
		         b=Integer.parseInt(b2.getZprsnv());
		    if(b2.getXbbx()!=null&&b2.getXbbx()!="")
		         c=Integer.parseInt(b2.getXbbx());
            int num=a+b+c;
		    b2.setZrs(num+"");
		    
		    //获取登记时间
		    SimpleDateFormat date=new SimpleDateFormat("yyyy-MM-dd");
		    String now=date.format(new Date());
		    b2.setDjsj(now);
		    //设置成功人数
		    b2.setCgrsn("0");
		    b2.setCgrsnv("0");
		    //有效期默认为12天
		    b2.setDjyxq("12");
		    //未冻结
		    b1.setSfdj("n");
		    b1.setDjsj(now);
		    b1.setDjyxq(12);
		    b2.setZpgzbh(GenerateID.getGenerateId());
		    
		    b1.setZpbh(id);
		    b2.setZpbh(id);
		    System.out.println();System.out.println();System.out.println();
		    System.out.println("====================================================================================");
		    System.out.println("b1:"+b1);
		    System.out.println("b2:"+b2);
		    
		   
		    dwservice.DwZp_save(b1, b2);
		 	return "redirect:/service/zj/dwzp/dwdj_3.jsp";
	    }
	
	
	
	
	
	
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
		    String dwbm=GenerateID.getGenerateId();
		    bio.setBioId(dwbm);
	        bioservice.save(bio);
	        return "redirect:/service/getBioById/"+dwbm;
	    }
	 //根据id获取单位基本信息
	 @RequestMapping("/service/getBioById/{value}")
	    public ModelAndView getBioByid(@PathVariable("value") String value) {
		   Bio bio;
		   bio=bioservice.getBio(value);
	       return new ModelAndView("redirect:/service/zj/dwzp/dwdj_3.jsp","company",bio);
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
	   
		//获得岗位类别下拉列表
		@ResponseBody
		@RequestMapping(value="/service/Zjdgwlbs/{value}",produces="text/html;charset=UTF-8")
		public String getZjdgwlbs(@PathVariable("value") String value){
			return ZjdgwlbOperation.getOption(value);
		}
		
		//工种大类
		@ResponseBody
		@RequestMapping(value="/service/Specialtys",produces="text/html;charset=UTF-8")
		public String getSpecialty(){
			return SpecialtyOperation.getHy();
		}
		
		//工种类
		@ResponseBody
		@RequestMapping(value="/service/Specialty/{ID}/{value}",produces="text/html;charset=UTF-8")
		public String getSpecialty(@PathVariable("ID") String ID,@PathVariable("value") String value){
			return SpecialtyOperation.getSelectedGz(ID, value);
		}
		
}