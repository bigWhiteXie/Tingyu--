package com.codeXie.mapper;

import org.apache.ibatis.annotations.Insert;

public interface PersonMapper {
    @Insert("insert into t_married_person values(default,#{ppwd},#{pname},#{phone},#{pmail},#{marrydate},now(),'1')")
    int addPersonMapper(com.codeXie.pojo.MarriedPerson person);

}
