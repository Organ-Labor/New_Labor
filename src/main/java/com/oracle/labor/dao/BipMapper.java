package com.oracle.labor.dao;

import com.oracle.labor.po.Bip;
import com.oracle.labor.po.BipExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
@Repository
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
    
    List<Map<String,Object>> searchByName(@Param("name")String name);
    
    List<Map<String,Object>> searchById(@Param("id")String id);
    
    List<Map<String,Object>> getGz(@Param("id")String id);
    
    Map<String,Object> recommend(@Param("id")String id);
    
    Map<String,Object> showPersonDetails(@Param("id")String id);
    
    String getName(@Param("id")String id);
    
    String getDwName(@Param("id")String id);
    
    public List<Map<String,Object>> dwList(
    		@Param("dwxz")String dwxz,
    		@Param("dwhy")String dwhy,
    		@Param("dwjjlx")String dwjjlx,
    		@Param("xb")String xb,
    		@Param("ppfw")String ppfw,
    		@Param("whcd")String whcd,
    		@Param("gzppfw")String gzppfw);
    
    List<Map<String,Object>> dwDetails(@Param("id")String id);
    
    List<Map<String,Object>> hzcx(
    		@Param("id")String id,
			@Param("name")String name,
			@Param("bio_no")String pio_no,
			@Param("bio_name")String pio_name,
			@Param("date_f")String date_f,
			@Param("date_l")String date_l,
			@Param("lx")String lx);
    
    void updateHz(@Param("hzno")String hzno,@Param("sfcg")String sfcg,@Param("cgyx")String cgyx,@Param("bcg")String bcg);
    
    Map<String,Object> selectDw(@Param("id")String id);
    
    public void insertTjx(String id,String zpgzbh,String qzgzbh);
    
    public void insertHz(String id,String zpgzbh,String qzgzbh);
    
    //List<Map<String,Object>> get
}