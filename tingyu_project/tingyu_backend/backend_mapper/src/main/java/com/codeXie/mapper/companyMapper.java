package com.codeXie.mapper;

import com.codeXie.pojo.Company;
import com.codeXie.pojo.Condition;
import com.codeXie.pojo.Host;
import com.codeXie.pojo.Planner;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface companyMapper {

    List<Company> selCompanyMapper(Condition condition);

    int selCountMapper(Condition condition);

    @Insert("insert into t_company values(default,#{cpwd},#{cname},#{cphone},#{ceo},#{cmail},now(),'1',#{ordernumber})")
    int addCompanyMapper(Company company);

    int updStatusMapper(String[] cids,String status );

    int updCompanyMapper(@Param("cid") String cid,@Param("company") Company company);

    @Select("select * from t_planner where cid=#{cid}")
    List<Planner> selPlannerMapper(@Param("cid") Integer cid);
}
