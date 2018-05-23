package com.oracle.labor.dao;

import com.oracle.labor.po.ZjDwzpdjb;
import com.oracle.labor.po.ZjDwzpdjbExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ZjDwzpdjbMapper {
    long countByExample(ZjDwzpdjbExample example);

    int deleteByExample(ZjDwzpdjbExample example);

    int deleteByPrimaryKey(String zpbh);

    int insert(ZjDwzpdjb record);

    int insertSelective(ZjDwzpdjb record);

    List<ZjDwzpdjb> selectByExample(ZjDwzpdjbExample example);

    ZjDwzpdjb selectByPrimaryKey(String zpbh);

    int updateByExampleSelective(@Param("record") ZjDwzpdjb record, @Param("example") ZjDwzpdjbExample example);

    int updateByExample(@Param("record") ZjDwzpdjb record, @Param("example") ZjDwzpdjbExample example);

    int updateByPrimaryKeySelective(ZjDwzpdjb record);

    int updateByPrimaryKey(ZjDwzpdjb record);
    
    List<Map<String,Object>> getDw(@Param("bioNo") String bioNo,@Param("bioName") String bioName);
    
    List<Map<String,Object>> getZpgz(@Param("bioId") String bioId);
    
    List<Map<String,Object>> getBB(@Param("bioId") String bioId,@Param("bipId") String bipId,@Param("gzbh") String gzbh);
    
    List<Map<String,Object>> getSearch(@Param("bipSex") String bipSex,@Param("hjxz") String hjxz,@Param("minAge") String minAge,@Param("maxAge") String maxAge,@Param("rylb") String rylb,@Param("gz") String gz,@Param("whcd1") String whcd1,@Param("whcd2") String whcd2,@Param("orgtype") String orgtype,@Param("gwlb") String gwlb,@Param("djsj1") String djsj1,@Param("djsj2") String djsj2,@Param("tjsj1") String tjsj1,@Param("tjsj2") String tjsj2,@Param("hzzt") String hzzt);
   
}