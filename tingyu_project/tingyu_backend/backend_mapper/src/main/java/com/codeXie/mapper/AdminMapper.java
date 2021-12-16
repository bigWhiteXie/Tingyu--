package com.codeXie.mapper;

import com.codeXie.pojo.Admin;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface AdminMapper {
    @Select("select * from t_admin where aname=#{aname} and apwd=#{apwd}")
    Admin selAdminMapper(@Param("aname") String aname,@Param("apwd") String apwd);


}
