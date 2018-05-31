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
    
    public List<Map<String,Object>> getDw_gd(@Param("bio_no") String bio_no,@Param("bio_name") String bio_name,@Param("DJSJ") String DJSJ,@Param("DJSJZ") String DJSJZ,@Param("SFDJ") String SFDJ);
    //归档单位招聘信息
    public void updatedw_gd(@Param("id") String id,@Param("gdsj") String gdsj);
    //归档冻结信息
    public void updatedwdj_gd(@Param("id") String id,@Param("gdsj") String gdsj);
    //归档工种信息
    public void updatedwgz_gd(@Param("id") String id,@Param("gdsj") String gdsj);
    //获取所有未归档的单位招聘信息与回执情况
    public List<Map<String,Object>> getAll_wgd();
    //根据id获取回执信息
    List<Map<String,Object>> select_dwgdbyid(@Param("id") String id);

    List<Map<String,Object>> getZpgz(@Param("bioId") String bioId);
    
    List<Map<String,Object>> getBB(@Param("bioId") String bioId,@Param("bipId") String bipId,@Param("gzbh") String gzbh);
    
    List<Map<String,Object>> getSearch(@Param("bipSex") String bipSex,@Param("hjxz") String hjxz,@Param("minAge") String minAge,@Param("maxAge") String maxAge,@Param("rylb") String rylb,@Param("gz") String gz,@Param("whcd1") String whcd1,@Param("whcd2") String whcd2,@Param("orgtype") String orgtype,@Param("gwlb") String gwlb,@Param("djsj1") String djsj1,@Param("djsj2") String djsj2,@Param("tjsj1") String tjsj1,@Param("tjsj2") String tjsj2,@Param("hzzt") String hzzt);
   
    
}