package com.codeXie.service.Impl;

import com.codeXie.mapper.AdminMapper;
import com.codeXie.pojo.Admin;
import com.codeXie.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminMapper adminMapper;
    @Override
    public Admin loginService(String aname, String apwd) {
        return adminMapper.selAdminMapper(aname,apwd);
    }


}
