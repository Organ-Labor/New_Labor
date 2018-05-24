package com.oracle.labor.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.oracle.labor.po.ZjDwzpgzb;
import com.oracle.labor.po.ZjDwzpgzbExample;

public interface ZjDwzpgzbMapper {
    long countByExample(ZjDwzpgzbExample example);

    int deleteByExample(ZjDwzpgzbExample example);

    int deleteByPrimaryKey(String zpgzbh);

    int insert(ZjDwzpgzb record);

    int insertSelective(ZjDwzpgzb record);

    List<ZjDwzpgzb> selectByExample(ZjDwzpgzbExample example);

    ZjDwzpgzb selectByPrimaryKey(String zpgzbh);

    int updateByExampleSelective(@Param("record") ZjDwzpgzb record, @Param("example") ZjDwzpgzbExample example);

    int updateByExample(@Param("record") ZjDwzpgzb record, @Param("example") ZjDwzpgzbExample example);

    int updateByPrimaryKeySelective(ZjDwzpgzb record);

    int updateByPrimaryKey(ZjDwzpgzb record);
    
    //单位推荐--根据单位id和招聘工种查找相应工种的招聘条件
    List<Map<String,Object>> selectTozptj(@Param("bioId") String bioId,@Param("qzgz") String qzgz);

    
}