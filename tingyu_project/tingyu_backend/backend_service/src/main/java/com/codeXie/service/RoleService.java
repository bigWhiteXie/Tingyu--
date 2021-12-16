package com.codeXie.service;

import com.codeXie.pojo.*;

import java.util.List;

public interface RoleService {

    PageBean<Role> selRoleService(Condition condition);


    int addRoleService(Role role, String mids);

    List<String> selRoleMenuService(Integer rid);

    Boolean updRoleService(Role role, String midsEdit);

    Boolean delRoleService(String rids);
}
