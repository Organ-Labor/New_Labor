package com.oracle.labor.web;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.labor.common.util.GenerateID;
import com.oracle.labor.po.Bip;
import com.oracle.labor.po.BipExample;
import com.oracle.labor.po.BipForeignlanguage;
import com.oracle.labor.po.BipSkill;
import com.oracle.labor.po.ZjGrqzdjb;
import com.oracle.labor.po.ZjGrqzdjjdb;
import com.oracle.labor.po.ZjGrqzgzb;
import com.oracle.labor.service.QZService;

@Controller
public class QZHandler {
	@Autowired
	QZService qzService;
	
	String zth,qzbhh;
	Bip b;
	@RequestMapping("/service/saveqzb.do")
	public String save(HttpServletRequest request) {
		System.out.println("haha");
		Bip bip=new Bip();
		BipSkill skill=new BipSkill();
		ZjGrqzdjb djb=new ZjGrqzdjb();
		ZjGrqzgzb gzb=new ZjGrqzgzb();
		//1.提交个人基本信息表 Bip
		String bipID=GenerateID.getGenerateId();
		bip.setBipId(bipID);
		bip.setBipCitizenid(request.getParameter("sfzhm"));
		bip.setBipBirthday(request.getParameter("sfzhm").substring(6,12));
		bip.setBipSex(request.getParameter("xb"));
		bip.setBipAge(request.getParameter("nl"));
		bip.setBipName(request.getParameter("xm"));
		bip.setBipMinzu(request.getParameter("mz"));
		bip.setBipZzmm(request.getParameter("zzmm"));
		bip.setBipHyzk(request.getParameter("hyzk"));
		bip.setBipHjxz(request.getParameter("hjxz"));
		bip.setBipRylb(request.getParameter("rylb"));
		bip.setBipJkzk(request.getParameter("jkzk"));
		bip.setBipCjqk(request.getParameter("cjqk"));
		bip.setBipEyesightleft(request.getParameter("zysl"));
		bip.setBipEyesightright(request.getParameter("yysl"));
		bip.setBipLong(request.getParameter("sg"));
		bip.setBipWeight(request.getParameter("tz"));
		bip.setBipHkszd(request.getParameter("cjqk"));
		bip.setBipWhcd(request.getParameter("cjqk"));
		bip.setBipSubject(request.getParameter("sxzy"));
		bip.setBipGraduateschool(request.getParameter("byxx"));
		bip.setBipBysj(request.getParameter("bysj"));
		bip.setBipEducationallevel2(request.getParameter("qtxl"));
		bip.setBipConTelephone(request.getParameter("sj"));
		bip.setBipConMobile(request.getParameter("lxdh"));
		bip.setBipConEmail(request.getParameter("email"));
		bip.setBipConPostcode(request.getParameter("yzbm"));
		bip.setBipConContact(request.getParameter("lxr"));
		bip.setBipConContacttel(request.getParameter("lxrdh"));
		bip.setBipResAddress(request.getParameter("jzdz"));
		bip.setBipTLowersecurity(request.getParameter("sfdb"));
		bip.setBipTDestitute(request.getParameter("sftk"));
		bip.setBipTPeasant(request.getParameter("sfnzf"));
		bip.setBipTVeteran(request.getParameter("sffytw"));
		bip.setBipTOthercities(request.getParameter("sfrhfl"));
		bip.setBipTCzjyyhz(request.getParameter("sfczjyyhz"));
		bip.setBipTRhfl(request.getParameter("sfrhfl"));
		bip.setBipTNewgraduate(request.getParameter("sfyjgxbys"));
		bip.setBipPcDj(request.getParameter("jsjdj"));
		bip.setBipPcSlcd(request.getParameter("jsjslcd"));
		bip.setBipResume(request.getParameter("gzjl")); 
		bip.setBipQtsm(request.getParameter("qtsm"));
		//2.提交外语表BipForeignlanguage
		BipForeignlanguage fl=new BipForeignlanguage();
		fl.setBipFlId(GenerateID.getGenerateId());
		fl.setBipId(bipID);
		fl.setBipFlJywy(request.getParameter("init_jywy"));
		fl.setBipFlWysm(request.getParameter("init_wysm"));
		//无年限fl.setBipFlYears(request.getParameter("qtsm"));
		//3.提交技能表	
		skill.setBipSId(GenerateID.getGenerateId());
		skill.setBipId(bipID);
		skill.setBipSJsdj(request.getParameter("init_jsdj"));
		skill.setBipSYears(request.getParameter("init_zyjn"));
		skill.setBipSZyjn(request.getParameter("init_zyjn"));
		//4.提交求职登记表
		qzbhh=GenerateID.getGenerateId();
		djb.setQzbh(qzbhh);
		djb.setBipId(bipID);
			//获得当前时间
		String djsj=new SimpleDateFormat("yyyyMMdd").format(new Date());
		djb.setDjsj(djsj);//登记时间
			//djb.setDjyxq(request.getParameter("qtsm"));//有效期
		djb.setDwhy(request.getParameter("dwhy"));
		djb.setDwjjlx(request.getParameter("dwjjlx"));
		djb.setDwxx(request.getParameter("dwxz"));
			//归档时间djb.setGdsj(request.getParameter("qtsm"));
		djb.setGzdq(request.getParameter("gzdq"));
		djb.setSfcjpx(request.getParameter("sfcjpx"));
		djb.setSfdj("n");//是否冻结（默认n）
		djb.setSfjsdx(request.getParameter("sfjsdx"));
		djb.setSfjszyzd(request.getParameter("sfjszyzd"));
		//5.提交工种表
		//获得当前最大qzbh并加一
		gzb.setQzgzbh(GenerateID.getGenerateId());
		gzb.setQzbh(qzbhh);
		gzb.setDjsj(djsj);
			//归档时间 gzb.setGdsj(request.getParameter("qtsm"));
		gzb.setGz(request.getParameter("qzgz1"));
			//序号 gzb.setXh(request.getParameter("qtsm"));
		gzb.setYgxs(request.getParameter("ygxs1"));
		gzb.setZdyx(request.getParameter("zdyx1"));
		gzb.setZgyx(request.getParameter("zdyx1"));
		//保存解冻表信息
		
		qzService.saveBip(bip,fl,skill,djb,gzb);
		return "redirect:getUsers/1";
	}
	
	@RequestMapping("/service/jd1.do")
	public String jd1(HttpServletRequest request) {
		b=qzService.cha1(request.getParameter("bip_citizenid"));
		
		request.setAttribute("xm", b.getBipName());
		request.setAttribute("sex",b.getBipSex());
		request.setAttribute("birth", b.getBipBirthday());
		request.setAttribute("zzdz", b.getBipResAddress());
		request.setAttribute("lxdh", b.getBipConTelephone());
		System.out.println("bipid:"+b.getBipId());
		ZjGrqzdjb z=qzService.cha2(b.getBipId());
					qzbhh=z.getQzbh();
		request.setAttribute("sj", z.getDjsj());
					zth=z.getSfdj();
		return "forward:/service/zj/grqz/qzdjjd_2.jsp";
	}
	
	@RequestMapping("/service/jd2.do")
	public String jd2(HttpServletRequest request) {
	
		String s1=request.getParameter("djreason");
		String s2=new SimpleDateFormat("yyyyMMdd").format(new Date());
		ZjGrqzdjjdb jdb=new ZjGrqzdjjdb();
		if(zth.equals("n")){
			
			jdb.setGrdjjdbh(GenerateID.getGenerateId());
			jdb.setQzbh(qzbhh);
			jdb.setJidyy(s1);
			jdb.setJidsj(s2);
			//创建冻结表
			qzService.savejdb(jdb);
			//更改求职的状态
			qzService.updata(qzbhh,"y");
			
		}else{
			jdb.setGrdjjdbh(GenerateID.getGenerateId());
			jdb.setQzbh(qzbhh);
			jdb.setDojyy(s1);
			jdb.setDojsj(s2);
			//创建冻结表
			qzService.savejdb(jdb);
			//更改求职的状态
			qzService.updata(qzbhh,"n");
		}
		request.setAttribute("b", b);
		request.setAttribute("jdb", jdb);
		return "forward:/service/zj/grqz/qzdjjd_3.jsp";
	}
	
	
}
