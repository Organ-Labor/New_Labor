package com.oracle.labor.dao;

import com.oracle.labor.po.ZjTjxxb;
import com.oracle.labor.po.ZjTjxxbExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ZjTjxxbMapper {
    long countByExample(ZjTjxxbExample example);

    int deleteByExample(ZjTjxxbExample example);

    int deleteByPrimaryKey(String tjxid);

    int insert(ZjTjxxb record);

    int insertSelective(ZjTjxxb record);

    List<ZjTjxxb> selectByExample(ZjTjxxbExample example);

    ZjTjxxb selectByPrimaryKey(String tjxid);

    int updateByExampleSelective(@Param("record") ZjTjxxb record, @Param("example") ZjTjxxbExample example);

    int updateByExample(@Param("record") ZjTjxxb record, @Param("example") ZjTjxxbExample example);

    int updateByPrimaryKeySelective(ZjTjxxb record);

    int updateByPrimaryKey(ZjTjxxb record);
    
    List<Map<String,Object>> selectTohz(@Param("bipSfz") String bipSfz,@Param("bipName") String bipName,@Param("bioNo") String bioNo,@Param("bioName") String bioName,@Param("tjsj1") String tjsj1,@Param("tjsj2") String tjsj2,@Param("tjxlx") String tjxlx);
}