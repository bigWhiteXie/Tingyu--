package com.codeXie.mapper;

import com.codeXie.pojo.Condition;
import com.codeXie.pojo.Host;
import com.codeXie.pojo.Menu;
import com.codeXie.pojo.Role;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface RoleMapper {

    @Select("select count(*) from t_role")
    int selCountMapper();


    @Select("select * from t_role limit #{start},#{size}")
    List<Role> selRoleMapper(Condition condition);

    @Options(useGeneratedKeys=true, keyProperty="rid", keyColumn="rid")//新增时将主键返回
    @Insert("insert into t_role values(default,#{rname},#{rdesc})")
    int addRoleMapper(Role role);

    @Insert("insert into t_role_menu values(#{rid},#{mid})")
    int addroleMenuMapper(@Param("mid") String mid, @Param("rid") Integer rid);

    @Select("select m.mid from t_role_menu rm join t_menu m on rm.mid=m.mid where rm.rid=#{rid} and m.isparent='0' ")
    List<String> selRoleMenuMapper(@Param("rid") Integer rid);

    @Update("update t_role set rname=#{rname},rdesc=#{rdesc} where rid=#{rid}")
    int updRoleMapper(Role role);

    @Delete("delete from t_role_menu where rid=#{param1}")
    int delRoleMenuMapper(Integer rid);


    @Insert("insert into t_role_menu values(#{rid},#{mid})")
    int addRoleMenuMapper(@Param("rid") Integer rid, @Param("mid") String mid);

    @Delete("delete from t_role where rid=#{param1}")
    int delRoleMapper(String rid);
}
