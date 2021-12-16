package com.codeXie.service;

import com.codeXie.pojo.Menu;
import com.codeXie.pojo.TreeResult;

import java.util.List;

public interface MenuService {

    List<TreeResult> menuInfoService(Integer aid,Integer pid);

    List<TreeResult> menuManagerInfoService(Integer id);



    Boolean addMenuService(Menu menu);

    int updMenuService(Menu menu);

    Boolean delMenuService(String mid,String pid);

    List<TreeResult> selMenuService();

}
