package com.oracle.labor.dao;

import com.oracle.labor.po.Bip;
import com.oracle.labor.po.BipExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface BipMapper {
    long countByExample(BipExample example);

    int deleteByExample(BipExample example);

    int deleteByPrimaryKey(String bipId);

    int insert(Bip record);

    int insertSelective(Bip record);

    List<Bip> selectByExample(BipExample example);

    Bip selectByPrimaryKey(String bipId);

    int updateByExampleSelective(@Param("record") Bip record, @Param("example") BipExample example);

    int updateByExample(@Param("record") Bip record, @Param("example") BipExample example);

    int updateByPrimaryKeySelective(Bip record);

    int updateByPrimaryKey(Bip record);
    
    //获得求职者
    List<Map<String,Object>> getQzz(@Param("gz") String gz,@Param("bipSex") String bipSex,@Param("bipHyzk") String bipHyzk,@Param("bipWhcd") String bipWhcd,@Param("bipHjxz") String bipHjxz,@Param("bipRylb") String bipRylb,@Param("bipJkzk") String bipJkzk,@Param("bipTNewgraduate") String bipTNewgraduate,@Param("gzdq") String gzdq,@Param("minAge") String minAge,@Param("maxAge") String maxAge,@Param("minLong") String bioLong,@Param("maxLong") String maxLong);
    
    //获得求职者详情
    List<Map<String,Object>> getQzzxq(@Param("bipId") String bipId);
    
    //个人查询
    List<Map<String,Object>> selectToGr(@Param("bipSfz") String bipSfz,@Param("bipName") String bipName,@Param("bipSex") String bipSex,@Param("minAge") String minAge,@Param("maxAge") String maxAge,@Param("whcd1") String whcd1,@Param("whcd2") String whcd2,@Param("hyzk") String hyzk,@Param("jkzk") String jkzk,@Param("djsj1") String djsj1,@Param("djsj2") String djsj2,@Param("zzmm") String zzmm,@Param("qzgw") String qzgw,@Param("rylb") String rylb,@Param("hjxz") String hjxz,@Param("cxfw") String cxfw);
    
}