package com.codeXie.mapper;

import com.codeXie.pojo.Menu;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface MenuMapper {

    @Select("select * from t_menu where mid in " +
            "(select mid from t_role_menu where rid in" +
            " (select rid from t_admin_role where aid=#{aid})) and pid=#{pid}")
    List<Menu> selMenuMapper(@Param("aid") Integer aid,@Param("pid") Integer pid);

    @Select("select * from t_menu where pid=#{param1}")
    List<Menu> selManagerInfoMapper(Integer id);

    @Insert("insert into t_menu values(default,#{mname},#{pid},'0','0',#{url},#{mdesc})")
    int addMenuMapper(Menu menu);

    @Update("update t_menu set isparent=#{parent} where mid=#{mid}")
    int updParentMapper(@Param("mid") Integer mid,@Param("parent") String parent);

    @Update("update t_menu set mname=#{mname},url=#{url},mdesc=#{mdesc} where mid=#{mid}")
    int updMenuMapper(Menu menu);

    @Delete("delete from t_menu where mid=#{mid} and isparent='0'")
    int delMenuMapper(@Param("mid") String mid);

    @Select("select count(*) from t_menu where pid=#{pid}")
    int selChildCountMapper(@Param("pid") String pid);

    @Select("select * from t_menu")
    List<Menu> selAllMenuMapper();
}
