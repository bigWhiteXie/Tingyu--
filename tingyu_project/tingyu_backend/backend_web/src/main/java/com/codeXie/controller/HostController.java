package com.codeXie.controller;

import com.codeXie.pojo.Host;
import com.codeXie.pojo.Condition;
import com.codeXie.pojo.HostPower;
import com.codeXie.pojo.PageBean;
import com.codeXie.service.HostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("host")
public class HostController {
    @Autowired
    private HostService hostServiceImpl;

    /**
     * 根据筛选条件对主持人信息进行分页查询
     * @param condition
     * @param rows
     * @param page
     * @return
     */
    @RequestMapping("hostInfo")
    @ResponseBody
    public PageBean<Host> hostInfo(Condition condition, Integer rows, Integer page){
        condition.setSize(rows);
        condition.setIndex(page);
        PageBean<Host> pageBean = hostServiceImpl.selHostService(condition);
        return pageBean;
    }

    @ResponseBody
    @RequestMapping("hostAdd")
    public Boolean hostAdd(Host host){
        int i = hostServiceImpl.addHostService(host);
        return i>0;
    }

    @ResponseBody
    @RequestMapping("hostStatus")
    public Boolean hostStatus(String hids,String status){
        String[] hidArray = hids.split(",");

        int i = hostServiceImpl.updStatusService(hidArray, status);
        return i>0;
    }

    @ResponseBody
    @RequestMapping("hostPowerOper")
    public Boolean hostPowerOper(HostPower power,String hostids){
        String[] hidArr = hostids.split(",");
        int i = hostServiceImpl.updPowerService(hidArr, power);
        return i>0;
    }
}
