package com.oracle.labor.dao;

import com.oracle.labor.po.ZjTjxxhzb;
import com.oracle.labor.po.ZjTjxxhzbExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ZjTjxxhzbMapper {
    long countByExample(ZjTjxxhzbExample example);

    int deleteByExample(ZjTjxxhzbExample example);

    int deleteByPrimaryKey(String tjxid);

    int insert(ZjTjxxhzb record);

    int insertSelective(ZjTjxxhzb record);

    List<ZjTjxxhzb> selectByExample(ZjTjxxhzbExample example);

    ZjTjxxhzb selectByPrimaryKey(String tjxid);

    int updateByExampleSelective(@Param("record") ZjTjxxhzb record, @Param("example") ZjTjxxhzbExample example);

    int updateByExample(@Param("record") ZjTjxxhzb record, @Param("example") ZjTjxxhzbExample example);

    int updateByPrimaryKeySelective(ZjTjxxhzb record);

    int updateByPrimaryKey(ZjTjxxhzb record);
}