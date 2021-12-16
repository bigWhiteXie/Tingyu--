package com.codeXie.mapper;

import com.codeXie.pojo.Host;
import com.codeXie.pojo.Condition;
import com.codeXie.pojo.HostPower;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HostMapper {
    List<Host> selHostMapper(Condition condition);

    int selCountMapper(Condition condition);

    @Insert("insert into t_host values(default,#{hname},#{hpwd},#{hphone},now(),'1','10',#{ordernumber})")
    int addHostMapper(Host host);

    int updStatusMapper(String[] hids,String status);

    int updPowerMapper(@Param("hids") String[] hids, @Param("power") HostPower power);
}
