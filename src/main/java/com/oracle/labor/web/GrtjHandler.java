package com.oracle.labor.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.oracle.labor.service.GrtjService;

@SessionAttributes(names={"p","dw"})
@Controller
@RequestMapping("/grtj")
public class GrtjHandler {
	@Autowired
	GrtjService grtjService;
	
	@RequestMapping("/showPerson")
	public String searchPerson(@RequestParam("Idcard")String id,@RequestParam("name")String name,Model model) {
		//查询出的简要个人信息及登记时间
		List<Map<String,Object>> person = grtjService.searchPerson(id,name);
		model.addAttribute("person",person);
		return "service/zj/tjhz/grtj_tjpp_1";
	}
	
	/**
	 * 回显,身份证号到姓名
	 * @param id
	 * @return
	 */
	@RequestMapping(value="commons/name/{id}",produces="text/html;charset=UTF-8")
	@ResponseBody() 
	public String commonsName(@PathVariable("id")String id,HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		String name = grtjService.getName(id);
		return name;
	}
	/**
	 * 回显,法人码到单位名
	 * @param id 法人码
	 * @return
	 */
	@RequestMapping(value="commons/dw_name/{id}",produces="text/html;charset=UTF-8")
	@ResponseBody() 
	public String commonsDwName(@PathVariable("id")String id,HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		String name = grtjService.getDwName(id);
		return name;
	}
	/**
	 * 展示个人基本信息及推荐条件及所选工种
	 * @param id 个人求职登记表的登记编号
	 * @param model
	 * @return
	 */
	@RequestMapping("/recommend")
	public String recommend(String id,Model model) {
		Map<String,Object> m = grtjService.recommend(id);
		List<Map<String,Object>> gz = grtjService.getGz(id);
		model.addAttribute("m",m);
		model.addAttribute("gz",gz);
		return "service/zj/tjhz/grtj_tjpp_2";
	}
	
	/**
	 * 展示个人详细信息
	 * @param id 个人的bip_id
	 * @param model
	 * @return
	 */
	@RequestMapping("/details/{id}")
	public String details(@PathVariable("id")String id,Model model) {
		Map<String,Object> p = grtjService.showPersonDetails(id);
		model.addAttribute("p",p);
		return "service/zj/tjhz/grxinxi";
	}
	
	@RequestMapping("/dwList")
	public String dwList(
			String dwxz,
			String dwhy,
			String dwjjlx,
			String xb,
			String ppfw,
			String whcd,
			String gzppfw,
			Model model) {
		List<Map<String,Object>> list = grtjService.dwList(dwxz, dwhy, dwjjlx, xb, ppfw, whcd, gzppfw);
		model.addAttribute("dw1",list);
		return "service/zj/tjhz/grtj_tjpp_3";
	}
	
	@RequestMapping("/dwDetails")
	public String dwDetails(@RequestParam("dwgzid")String id,Model model) {
		List<Map<String,Object>> dw1 = grtjService.dwDetails(id);
		Map<String,Object> dw = dw1.get(0);
		model.addAttribute("dw",dw);
		return "service/zj/tjhz/grtj_tjpp_4";
	}
	
	/**
	 * 展示推荐信
	 * @param id
	 * @return
	 */
	@RequestMapping("/tjx")
	public String tjx() {
		return "service/zj/tjhz/grtj_tjx"; 
	}
	
	/**
	 * 回执表的查询
	 * @return
	 */
	@RequestMapping("/hzcx")
	public String hzcx(
			@RequestParam("citizenid")String id,
			@RequestParam("bip_name")String name,
			@RequestParam("bio_no")String pio_no,
			@RequestParam("bio_name")String pio_name,
			@RequestParam("tjFirstDate")String date_f,
			@RequestParam("tjLastDate")String date_l,
			@RequestParam("tjxType")String lx,
			Model model
			) {
		List<Map<String,Object>> map = grtjService.hzcx(id, name, pio_no, pio_name, date_f, date_l, lx);
		model.addAttribute("hz",map);
		return "service/zj/tjhz/tjxhz_2";
	}
	
	/**
	 * 增加回执信息,成功或失败
	 * @param hzno
	 * @param sfcg
	 * @param cgyx
	 * @param bcg
	 * @return
	 */
	@RequestMapping("/hz")
	public String hz(@RequestParam("id")String hzno,String sfcg,@RequestParam("cgyx")String cgyx,String bcg) {
		grtjService.updateHz(hzno, sfcg, cgyx, bcg);
		//更新招聘工种信息
		
		return "service/zj/tjhz/tjxhz_1";
	}
	
	/**
	 * 单位详细信息
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/dw")
	public String dw(String id,Model model) {
		Map<String,Object> map=grtjService.selectDw(id);
		System.out.println(map);
		model.addAttribute("d",map);
		return "service/zj/tjhz/dwxinxi";
	}
	
	@RequestMapping(value="/gxtj",produces= "text/html")
	@ResponseBody()
	public String gxtj(String zpgzbh,String qzgzbh) {
		System.out.println(zpgzbh+qzgzbh);
		return null;
	}
	
}
