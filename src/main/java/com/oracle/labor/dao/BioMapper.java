package com.oracle.labor.dao;

import com.oracle.labor.po.Bio;
import com.oracle.labor.po.BioExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface BioMapper {
    long countByExample(BioExample example);

    int deleteByExample(BioExample example);

    int deleteByPrimaryKey(String bioId);

    int insert(Bio record);

    int insertSelective(Bio record);

    List<Bio> selectByExample(BioExample example);

    Bio selectByPrimaryKey(String bioId);
    
    //根据条件查询单位详情 四表联查
    List<Map<String,Object>> selectByBioId(@Param("bioId") String bioId);
    
    //查询单位部分信息 两表联查
    List<Map<String,Object>> selectByBioId2(@Param("bioId") String bioId);
    
    //单位查询
    List<Map<String,Object>> selectToDw(@Param("bioNo") String bioNo,@Param("bioName") String bioName,@Param("djsj1") String djsj1,@Param("djsj2") String djsj2,@Param("regType") String regType,@Param("orgType") String orgType,@Param("gwlb") String gwlb,@Param("zpgw") String zpgw,@Param("rylb") String rylb,@Param("hjxz") String hjxz,@Param("cxfw") String cxfw,@Param("industry") String industry);

    int updateByExampleSelective(@Param("record") Bio record, @Param("example") BioExample example);

    int updateByExample(@Param("record") Bio record, @Param("example") BioExample example);

    int updateByPrimaryKeySelective(Bio record);

    int updateByPrimaryKey(Bio record);
}