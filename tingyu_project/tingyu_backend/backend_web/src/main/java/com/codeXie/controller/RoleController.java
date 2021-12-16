package com.codeXie.controller;

import com.codeXie.pojo.*;
import com.codeXie.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("role")
public class RoleController {
    @Autowired
    RoleService service;

    @RequestMapping("roleInfo")
    @ResponseBody
    public PageBean<Role> roleInfo(Condition condition, Integer rows, Integer page){
        condition.setSize(rows);
        condition.setIndex(page);
        PageBean<Role> pageBean = service.selRoleService(condition);
        return pageBean;
    }

    @RequestMapping("roleAdd")
    @ResponseBody
    public Boolean roleAdd(Role role,String mids){
        int i = service.addRoleService(role, mids);
        return i>0;
    }

    @RequestMapping("roleChildMenuInfo")
    @ResponseBody
    public List<String> roleChildMenuInfo(Integer rid){
        return service.selRoleMenuService(rid);
    }

    @RequestMapping("roleEdit")
    @ResponseBody
    public Boolean roleEdit(Role role,String midsEdit){
        return  service.updRoleService(role,midsEdit);
    }

    @RequestMapping("roleDel")
    @ResponseBody
    public Boolean roleDel(String rids){
        return service.delRoleService(rids);
    }
}
