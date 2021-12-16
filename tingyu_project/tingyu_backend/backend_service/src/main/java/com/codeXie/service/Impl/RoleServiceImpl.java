package com.codeXie.service.Impl;

import com.codeXie.mapper.RoleMapper;
import com.codeXie.pojo.*;
import com.codeXie.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.jvm.hotspot.oops.NamedFieldIdentifier;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    RoleMapper mapper;
    @Override
    public PageBean<Role> selRoleService(Condition condition) {
        //1.创建pagebean并初始化index和size
        PageBean<Role> pageBean = new PageBean<>();
        pageBean.setIndex(condition.getIndex());
        pageBean.setSize(condition.getSize());

        //2.查询记录数量
        int count = mapper.selCountMapper();
        pageBean.setTotal(count);
        //3.获取记录起始索引
        condition.setStart(pageBean.getStartRow());
        //4.查询记录列表
        List<Role> rows = mapper.selRoleMapper(condition);
        pageBean.setRows(rows);
        return  pageBean;
    }

    @Override
   public int addRoleService(Role role, String mids){
        String[] midArr;
        int i = mapper.addRoleMapper(role);
        if(mids!=null && !"".equals(mids)){
            midArr = mids.split(",");
            for(String mid:midArr) {
                i = mapper.addroleMenuMapper(mid,role.getRid());
            }
        }
        return i;
    }

    @Override
    public List<String> selRoleMenuService(Integer rid) {
        return mapper.selRoleMenuMapper(rid);
    }
    @Override
    public Boolean updRoleService(Role role, String midsEdit){
        //1.修改用户信息
        int i = mapper.updRoleMapper(role);

        //2.删除role原有菜单权限
        int i1 = mapper.delRoleMenuMapper(role.getRid());

        //3.增加role菜单权限
        int i2=0;
        if(midsEdit!=null && !"".equals(midsEdit)){
            String[] arr = midsEdit.split(",");
            for(String mid:arr){
                 i2 = mapper.addRoleMenuMapper(role.getRid(),mid);
            }
        }

        return i>0 && i1>0 && i2>0;

    }
    @Override
    public Boolean delRoleService(String rids) {
        String[] ridArr = rids.split(",");
        int i=0,i1=0;
        for(String rid:ridArr){
            //1.删除role与menu的映射关系
            i = mapper.delRoleMenuMapper(Integer.valueOf(rid));
            //2.删除role
            i1 = mapper.delRoleMapper(rid);
        }
        return i>0 && i1>0;
    }


}
