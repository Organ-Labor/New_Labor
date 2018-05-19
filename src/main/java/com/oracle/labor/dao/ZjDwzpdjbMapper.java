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
    
    public List<Map<String,Object>> getDw_djbyId(@Param("value") String value);
    
    public List<Map<String,Object>> getDw_djbyName(@Param("name") String name);
    
    public List<Map<String,Object>> getDw_djbyBioId(@Param("bio_id") String bio_id);
    
    public void dwzp_jxdj(@Param("id") String id, @Param("reason") String reason);
}