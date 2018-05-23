package labor;

import java.util.List;

import com.oracle.labor.po.ZjDwzpdjb;
import com.oracle.labor.service.DwService;

public class Test2 {

	public static void main(String[] args) {
		DwService dwService=new DwService();
		List<ZjDwzpdjb> list=dwService.get_list();
        for(ZjDwzpdjb s:list)
        	System.out.println(s.toString());
	}

}
