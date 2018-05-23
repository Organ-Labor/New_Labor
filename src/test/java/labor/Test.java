package labor;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.labor.dao.ZjDwzpdjbMapper;
import com.oracle.labor.po.ZjDwzpdjb;
@Service
public class Test {
	@Autowired
	ZjDwzpdjbMapper dwDao;


	public List<ZjDwzpdjb> get_list(){
		return dwDao.getAll_wgd();
	}
}
