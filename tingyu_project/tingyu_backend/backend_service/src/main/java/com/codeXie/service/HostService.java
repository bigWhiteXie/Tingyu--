package com.codeXie.service;

import com.codeXie.pojo.Host;
import com.codeXie.pojo.Condition;
import com.codeXie.pojo.HostPower;
import com.codeXie.pojo.PageBean;

public interface HostService {
    PageBean<Host> selHostService(Condition condition);

    int addHostService(Host host);

    int updStatusService(String[] hidArray,String status);

    int updPowerService(String[] hidArr, HostPower power);
}
