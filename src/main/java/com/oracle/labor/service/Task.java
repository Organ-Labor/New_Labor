package com.oracle.labor.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.scheduling.annotation.Scheduled;


public class Task{
		@Scheduled(cron="0 0/3 * * * ?")
		public void show(){
			System.out.println("这是三分钟一次的定时任务测试:"+new Date());
		}
		
		
		@Scheduled(cron="0 0 1 * * ?")//每天凌晨1点执行一次
		public void Task_gd() throws ParseException{
			System.out.println("这是每天凌晨1点进行的操作的:"+new Date());
			SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
		    ClassPathXmlApplicationContext factory=new ClassPathXmlApplicationContext("applicationContext.xml");
	        
    	    DwService dwService;
    	    dwService=factory.getBean(DwService.class);
    	    List<Map<String, Object>> list= dwService.get_list();
    	    List<String> list_zpid=new ArrayList<>();
    	    List<String> list_hzid=new ArrayList<>();
    	    
    	    for(Map<String,Object> a:list){
    	    	int ts;
    	    	ts= (int) a.get("djyxq");
    	    	String sj=(String) a.get("djsj");
    	    	Date date_dj=dateFormat.parse(sj);
    	    	 Calendar cad = Calendar.getInstance();
    	    	 cad.setTime(date_dj);
    	    	 cad.add(Calendar.DATE, ts);
    	    	 date_dj=cad.getTime();
    	    	 
    	    	 if(compareDate(new Date(),date_dj)){
    	    		 list_hzid.add((String) a.get("tjxid"));
    	    		 list_zpid.add((String) a.get("djdwbh")); 
    	    	 }
    	    		
    	    }
    	    if(!list_hzid.isEmpty()&&!list_zpid.isEmpty()){
    	    	
    	    	String str=dateFormat.format(new Date());
    	    	String id="";
    	    	for(String dd:list_zpid)
    	    		id+="'"+dd+"',";
    	    	
    	    	dwService.update_gd(id.substring(0,id.length()-1), str);
    	    	dwService.update_hz(list_hzid);
    	    }
			factory.close();
		}
		
		public boolean compareDate(Date d1, Date d2) {    
		    Calendar c1 = Calendar.getInstance();    
		    Calendar c2 = Calendar.getInstance();    
		    c1.setTime(d1);    
		    c2.setTime(d2);    
		    
		    int result = c1.compareTo(c2);    
		    if (result >= 0)    
		        return true;    
		    else    
		        return false;    
		}  
		
}

