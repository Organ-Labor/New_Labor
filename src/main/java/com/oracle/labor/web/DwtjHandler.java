package com.oracle.labor.web;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oracle.labor.common.codetable.RegioncodeOperation;
import com.oracle.labor.common.codetable.SexOperation;
import com.oracle.labor.common.codetable.SpecialtyOperation;
import com.oracle.labor.common.codetable.ZjdgwlbOperation;
import com.oracle.labor.common.util.GenerateID;
import com.oracle.labor.po.ZjTjxxb;
import com.oracle.labor.po.ZjTjxxhzb;
import com.oracle.labor.service.BioService;
import com.oracle.labor.service.BipService;
import com.oracle.labor.service.DwService;
import com.oracle.labor.service.TjxService;
import com.oracle.labor.service.TjxhzService;

@Controller
@SessionAttributes({"bioInfomation","xinxi","bipBasicinfo"})
public class DwtjHandler {

	@Autowired
	DwService dwService;
	
	@Autowired
	BioService bioService;
	
	@Autowired
	BipService bipService;
	
	@Autowired
	TjxService tjxService;
	
	@Autowired
	TjxhzService tjxhzService;
	
//	@RequestMapping("/{path}")
//	public String path(@PathVariable("path") String path){
//		return "/service/zj/tjhz/"+path;
//	}
	
	//单位推荐--根据单位法人号和单位名称查询出单位信息(Dwxx)列表

	@RequestMapping("/service/getDwxx/{page}")
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
		map.put("bio",bioService.getBio(bioId));
		System.out.println("map中的内容："+map.toString());
		return "/service/zj/tjhz/dwxinxi";
	}
	
	/*//单位信息--显示在页面的局部    不好使！？
	@RequestMapping("/service/getDwxx1/{bioId}")
	public String getDwxx1(@PathVariable("bioId") String bioId,HttpServletRequest request){
		request.getSession().setAttribute("b", bioService.getBio(bioId));
		return "/service/zj/tjhz/dwtjfw_3";
	}
	*/
	//单位推荐表--获得单位名称和单位地址转到单位推荐条件选择页面
	@RequestMapping("/service/getDwmc/{bioId}")
	public String getDwmc(@PathVariable("bioId") String bioId,Map<String,Object> map){
		map.put("bioInfo", bioService.getBioxx(bioId));
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
		System.out.println("DwService里测试的性别下拉框内容："+SexOperation.getOption(value));
		return SexOperation.getOption(value);
	}
	
	//工作地区
	@ResponseBody
	@RequestMapping(value="/service/getGzdq",produces="text/html;charset=UTF-8")
	public String getGzdq(){
		return RegioncodeOperation.getProvince();
	}
	
	//获得地区的下拉列表
	@ResponseBody
	@RequestMapping(value="/service/getRegions",produces="text/html;charset=UTF-8")
	public String getRegion(String code,String region){
		if(code==null||"".equals(code)){
			//没有默认值返回所有省
			return RegioncodeOperation.getProvince();
		}else{
			//有值传入找到被选中的省、市、区
			return RegioncodeOperation.getSelectedRegion(code,region);
		}
	}
	
	//获得求职岗位（岗位类别）下拉列表
	@ResponseBody
	@RequestMapping(value="/service/getQzgw/{value}",produces="text/html;charset=UTF-8")
	public String getQzgw(@PathVariable("value") String value){
		return ZjdgwlbOperation.getOption(value);
	}
	
	//单位推荐--根据条件查询推荐的求职者
	@RequestMapping("/service/getQzz/{value}")
	public String getQzz(@PathVariable("value") int value,String gz,String bipSex,String bipHyzk,String bipWhcd,String bipHjxz,String bipRylb,String bipJkzk,String bipTNewgraduate,String gzdq,String minAge,String maxAge,Map<String,Object> map){
		//添加分页
		PageHelper.startPage(value, 10);
		PageInfo<Map<String,Object>> info=new PageInfo<Map<String,Object>>(bipService.getQzz(gz, bipSex, bipHyzk, bipWhcd, bipHjxz, bipRylb, bipJkzk, bipTNewgraduate, gzdq, minAge, maxAge));
		map.put("info", info);
		return "/service/zj/tjhz/dwtjfw_4";
	}
	
	//单位推荐--查询出求职者信息(Qzzxx)
	@RequestMapping("/service/getQzzxx/{bipId}")
	public String getQzzxx(@PathVariable("bipId") String bipId,Map<String,Object> map){
		map.put("bip", bipService.getQzzxq(bipId));
		System.out.println("测试输出："+bipService.getQzzxq(bipId).toString());
		return "/service/zj/tjhz/grjbxx";
	}
	
	
	//得到求职者信息填写推荐信
	@RequestMapping("/service/getXxByID/{bipId}")
	public String getXxById(@PathVariable("bipId") String bipId,Map<String,Object> map){
		/*List<Object> list=new LinkedList<Object>();
		String[] bip_ids=bipId.split(",");
		for(int i=0;i<bip_ids.length;i++){
			System.out.println(bip_ids[i]);
			//根据每个bipId查出个人信息
			list.add(bipService.getQzzxq(bip_ids[i]));
		}*/
		System.out.println(bipId);
		System.out.println("查询出来的结果："+bipService.getQzzxq(bipId));
		map.put("xinxi",bipService.getQzzxq(bipId));
		return "/service/zj/tjhz/dwtjfw_5";
	}
	
	//查询单位招聘岗位**对于返回String 类型的方法来说如果要返回字符串的值而不是jsp页面一定要加@ResponseBody注解！
	@ResponseBody
	@RequestMapping(value="/service/getZpgz/{bioId}",produces="text/html;charset=UTF-8")
	public String getZpgz(@PathVariable("bioId") String bioId){
		//map.put("gz", dwService.getZpgz(bioId));
		//System.out.println(dwService.getZpgz(bioId));
		System.out.println("handler里招聘工种的内容："+dwService.getZpgz(bioId));
		return dwService.getZpgz(bioId);
	}
	
	//返回modelandview ModelAndView()方法/*其中第一个参数为url,第二个参数为要传递的数据的key,第三个参数为数据对象。在这里要注意的是:数据是默认被存放在request中的。*/
	@RequestMapping(value="/service/getBio2/{bioId}")
	public ModelAndView getBio2(@PathVariable("bioId") String bioId){
		List<Map<String,Object>> list=bioService.getBio2(bioId);
		System.out.println("测试ModelAndView内容："+list.toString());
		System.out.println("list中的bioName:"+list.get(0).get("bioName"));
		System.out.println("list中的bioId:"+list.get(0).get("bioId"));
		System.out.println("list中的contactTel:"+list.get(0).get("contactTel"));
		return new ModelAndView("service/zj/tjhz/dwtjfw_3","bioInfomation",list);
	}
	
	//查询出求职工种编号和招聘工种编号以便向推荐信息表中插入记录
	@RequestMapping("/service/getBB")
	public String getBB(String bioId,String bipId,String gzbh){
		//1.查出求职工种编号和招聘工种编号
		List<Map<String,Object>> list=dwService.getBB(bioId, bipId, gzbh);
		String zpgzbh=(String) list.get(0).get("zpgzbh");
		System.out.println("list中的招聘工种编号："+zpgzbh);
		String qzgzbh=(String) list.get(0).get("qzgzbh");
		System.out.println("list中的求职工种编号："+qzgzbh);
		//2.向数据库的推荐信息表中插入记录
		//2.1自动生成主键
		String tjxid=GenerateID.getGenerateId();
		//2.2设置推荐信类型
		String tjxlx="d";
		//2.3推荐时间为当前时间
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String tjsj = dateFormat.format(new Date());
		//3.创建record记录
		ZjTjxxb record=new ZjTjxxb();
		record.setTjxid(tjxid);
		record.setTjxlx(tjxlx);
		record.setZpgzbh(zpgzbh);
		record.setQzgzbh(qzgzbh);
		record.setTjsj(tjsj);
		
		//同时向推荐信息回执表插入记录
		ZjTjxxhzb r=new ZjTjxxhzb();
		r.setTjxid(tjxid);
		r.setTjxlx(tjxlx);
		r.setZpgzbh(zpgzbh);
		r.setQzgzbh(qzgzbh);
		r.setTjsj(tjsj);
		
		//4.向数据库中插入记录
		tjxService.insert(record);
		tjxhzService.insert(r);
		System.out.println("record内容："+record.toString());
		return "/service/zj/tjhz/dwtjfw_6";
	}
	
	//推荐查询
	@RequestMapping("/service/getSearch/{value}")
	public String getSearch(@PathVariable("value") int value,String bipSex,String hjxz,String minAge,String maxAge,String rylb,String gz,String whcd1,String whcd2,String orgtype,String gwlb,String djsj1,String djsj2,String tjsj1,String tjsj2,String hzzt,Map<String,Object> map){
		PageHelper.startPage(value, 10);
		List<Map<String,Object>> list=dwService.getSearch(bipSex, hjxz, minAge, maxAge, rylb, gz, whcd1, whcd2, orgtype, gwlb, djsj1, djsj2, tjsj1, tjsj2, hzzt);
		PageInfo<Map<String,Object>> info=new PageInfo<Map<String,Object>>(dwService.getSearch(bipSex, hjxz, minAge, maxAge, rylb, gz, whcd1, whcd2, orgtype, gwlb, djsj1, djsj2, tjsj1, tjsj2, hzzt));
		System.out.println("list中的内容："+list.toString());
		System.out.println("info中的内容："+info.toString());
		map.put("info",info);
		return "/service/zj/tjhz/tjxcx_2";
	}
	
	//推荐回执--得到要回执的项目清单
	@RequestMapping("/service/getHzlist/{value}")
	public String getHzlist(@PathVariable("value") int value,String bipSfz,String bipName,String bioNo,String bioName,String tjsj1,String tjsj2,String tjxlx,Map<String,Object> map){
		PageHelper.startPage(value,10);
		PageInfo<Map<String,Object>> info=new PageInfo<Map<String,Object>>(tjxService.selectTohz(bipSfz, bipName, bioNo, bioName, tjsj1, tjsj2, tjxlx));
		System.out.println("getHzlist中list的内容："+tjxService.selectTohz(bipSfz, bipName, bioNo, bioName, tjsj1, tjsj2, tjxlx));
		map.put("info", info);
		return "/service/zj/tjhz/tjxhz_2";
	}
	
	//单位查询
	@RequestMapping("/service/selectToDw/{value}")
	public String selectToDw(@PathVariable("value") int value,String bioNo,String bioName,String djsj1,String djsj2,String regType,String orgType,String gwlb,String zpgw, String rylb,String hjxz, String cxfw,String industry,Map<String,Object> map){
		PageHelper.startPage(value, 10);
		PageInfo<Map<String,Object>> info=new PageInfo<Map<String,Object>>(bioService.selectToDw(bioNo, bioName, djsj1, djsj2, regType, orgType, gwlb, zpgw, rylb, hjxz, cxfw, industry));
		System.out.println("selectToDw中list的内容："+bioService.selectToDw(bioNo, bioName, djsj1, djsj2, regType, orgType, gwlb, zpgw, rylb, hjxz, cxfw, industry));
		map.put("info", info);
		return "/service/zj/dwzp/xxcx_2";
	}
	
	//个人查询
	@RequestMapping("/service/selectToGr/{value}")
	public String selectToGr(@PathVariable("value") int value,String bipSfz,String bipName,String bipSex,String minAge,String maxAge,String whcd1,String whcd2,String hyzk,String jkzk,String djsj1,String djsj2,String zzmm,String qzgw,String rylb,String hjxz,String cxfw,Map<String,Object> map){
		PageHelper.startPage(value, 10);
		PageInfo<Map<String,Object>> info=new PageInfo<Map<String,Object>>(bipService.selectToGr(bipSfz, bipName, bipSex, minAge, maxAge, whcd1, whcd2, hyzk, jkzk, djsj1, djsj2, zzmm, qzgw, rylb, hjxz, cxfw));
		System.out.println("selectToGr中list的内容："+bipService.selectToGr(bipSfz, bipName, bipSex, minAge, maxAge, whcd1, whcd2, hyzk, jkzk, djsj1, djsj2, zzmm, qzgw, rylb, hjxz, cxfw));
		map.put("info", info);
		return "/service/zj/grqz/xxcx_2";
	}
	
	//根据身份证查询个人姓名和性别
	@RequestMapping("/service/getGrbasicinfo/{bipSfz}")
	public String getGrbasicinfo(@PathVariable("bipSfz") String bipSfz,Map<String,Object> map){
		map.put("bipBasicinfo", bipService.getGrbasicinfo(bipSfz));
		System.out.println(bipService.getGrbasicinfo(bipSfz).getBipName()+" "+bipService.getGrbasicinfo(bipSfz).getBipSex());
		return "/service/zj/grqz/xxcx_1";
	}
	
	//单位推荐--回显招聘条件
	@ResponseBody
	@RequestMapping(value="/service/selectTozptj/{bioId}/{qzgz}")
	public String selectTozptj(@PathVariable("bioId") String bioId,@PathVariable("qzgz") String qzgz){
		List<Map<String,Object>> list=dwService.selectTozptj(bioId, qzgz);
		System.out.println("list内容："+dwService.selectTozptj(bioId, qzgz).get(0));
		//list转化json格式字符串
		ObjectMapper mapper=new ObjectMapper();
		String json = null;
		try {
			json = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("json串："+json);
		return json;
	}
}
