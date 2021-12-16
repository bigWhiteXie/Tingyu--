package com.codeXie.service.Impl;

import com.codeXie.mapper.HostMapper;
import com.codeXie.pojo.Host;
import com.codeXie.pojo.Condition;
import com.codeXie.pojo.HostPower;
import com.codeXie.pojo.PageBean;
import com.codeXie.service.HostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HostServiceImpl implements HostService {
    @Autowired
    HostMapper mapper;
    @Override
    public PageBean<Host> selHostService(Condition condition) {
        //1.创建pagebean并初始化index和size
        PageBean<Host> pageBean = new PageBean<>();
        pageBean.setIndex(condition.getIndex());
        pageBean.setSize(condition.getSize());

        //2.查询记录数量
        int count = mapper.selCountMapper(condition);
        pageBean.setTotal(count);
        //3.获取记录起始索引
        condition.setStart(pageBean.getStartRow());
        //4.查询记录列表
        List<Host> rows = mapper.selHostMapper(condition);
        pageBean.setRows(rows);
        return  pageBean;
    }

    @Override
    public int addHostService(Host host) {
        return mapper.addHostMapper(host);
    }

    @Override
    public int updStatusService(String[] hidArray, String status) {
        return mapper.updStatusMapper(hidArray,status);
    }

    @Override
    public int updPowerService(String[] hidArr, HostPower power) {
        return mapper.updPowerMapper(hidArr,power);
    }
}
