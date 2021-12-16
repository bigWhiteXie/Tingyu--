package com.codeXie.mapper;

import com.codeXie.pojo.MarriedCondition;
import com.codeXie.pojo.MarriedPerson;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface MarriedMapper {
    List<MarriedPerson> selMarriedMapper(MarriedCondition condition);

    Integer selCountMapper(MarriedCondition condition);

    @Select("select * from t_married_person  where pname=#{pname} and ppwd=#{ppwd}")
    MarriedPerson selPersonMapper(@Param("pname") String pname, @Param("ppwd") String ppwd);
}
