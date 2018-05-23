package com.oracle.labor.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.oracle.labor.dao.ZjDwzpdjbMapper;
import com.oracle.labor.po.ZjDwzpdjb;

@Component
public class Task{
		@Scheduled(cron="0/20 * *  * * ? ")
		public void show(){
			System.out.println("这是20秒钟一次的定时任务测试:"+new Date());
		}
		
		//@Scheduled(cron="0 0 1 * * ?")//每天凌晨1点执行一次
		public void print(){
			System.out.println("这是每天凌晨1点进行的操作的:"+new Date());
			//获取时间
			SimpleDateFormat date=new SimpleDateFormat("yyyy-MM-dd");
			ZjDwzpdjbMapper dwDao = null;
			
			List<ZjDwzpdjb> list=dwDao.getAll_wgd();
		    String now=date.format(new Date());
			
		}
		
}
