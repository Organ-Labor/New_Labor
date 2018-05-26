package labor;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.oracle.labor.po.ZjDwzpdjb;
import com.oracle.labor.service.DwService;
import com.oracle.labor.service.Task;

public class Test {
	
          public static void main(String []args) throws IOException, ParseException{
        	 //   SqlSessionFactory factory=new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("applicationContext.xml"));
        	    ClassPathXmlApplicationContext factory=new ClassPathXmlApplicationContext("applicationContext.xml");
        	    SimpleDateFormat date=new SimpleDateFormat("yyyy-MM-dd");
    			
        	    DwService dwService;
        	    Task aa=new Task();
        	    dwService=factory.getBean(DwService.class);
        	   List<Map<String,Object>> list= dwService.get_list();
        	   Date now=new Date();
        	   for(Map a:list){
       	    	String sj=(String) a.get("djsj");
       	    	Date date_dj=date.parse(sj);
       	    	int ts;
    	    	ts= (int) a.get("djyxq");
       	    	
       	    	Calendar cad = Calendar.getInstance();
       	    	cad.setTime(date_dj);
       	    	cad.add(Calendar.DATE, ts);
       	    	date_dj=cad.getTime();
       	    	System.out.println("sss======"+sj);
       	    	System.out.println(date.format(date_dj));
       	    	
       	    	if(aa.compareDate(now,date_dj))
       	    	System.out.println("当前时间大于读取时间");
       	    }
          }
}
