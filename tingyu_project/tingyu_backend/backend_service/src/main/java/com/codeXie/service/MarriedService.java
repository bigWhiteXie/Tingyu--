package com.codeXie.service;

import com.codeXie.pojo.MarriedCondition;
import com.codeXie.pojo.MarriedPerson;
import com.codeXie.pojo.PageBean;

import java.util.List;

public interface MarriedService {
    PageBean<MarriedPerson> selPersonService(MarriedCondition condition);

    MarriedPerson personLoginService(String pname, String ppwd);
}
