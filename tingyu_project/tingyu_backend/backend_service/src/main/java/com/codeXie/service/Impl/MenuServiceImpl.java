package com.codeXie.service.Impl;

import com.codeXie.mapper.MenuMapper;
import com.codeXie.pojo.Menu;
import com.codeXie.pojo.TreeResult;
import com.codeXie.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    MenuMapper menuMapper;
    @Override
    public List<TreeResult> menuInfoService(Integer aid, Integer pid) {
        List<Menu> menus = menuMapper.selMenuMapper(aid, pid);
        ArrayList<TreeResult> list = new ArrayList<>();
        for(Menu menu:menus){
            TreeResult result = new TreeResult();
            Map<String,Object> map = new HashMap<>();
            result.setId(menu.getMid());
            result.setText(menu.getMname());
            result.setState("1".equals(menu.getIsparent())?"closed":"open");
            map.put("url",menu.getUrl());
            result.setAttributes(map);
            list.add(result);
        }
        return list;
    }

    @Override
    public List<TreeResult> menuManagerInfoService(Integer id) {
        List<Menu> menus = menuMapper.selManagerInfoMapper(id);
        List<TreeResult> list = new ArrayList<>();
        for(Menu item:menus){
            TreeResult result = new TreeResult();
            result.setText(item.getMname());
            result.setId(item.getMid());
            result.setState("1".equals(item.getIsparent())?"closed":"open");
            Map<String,Object> map = new HashMap<>();
            map.put("mdesc",item.getMdesc());
            map.put("pid",item.getPid());
            map.put("url",item.getUrl());
            result.setAttributes(map);
            list.add(result);
        }
        return list;
    }

    @Override
    public Boolean addMenuService(Menu menu) {
        int i=1;
        if(menu.getPid()>0){
             i = menuMapper.updParentMapper(menu.getPid(),"1");
        }
        return menuMapper.addMenuMapper(menu)>0 && i>0;
    }

    @Override
    public int updMenuService(Menu menu) {
        return menuMapper.updMenuMapper(menu);
    }

    @Override
    public Boolean delMenuService(String mid, String pid) {
        //删除该菜单
        int i = menuMapper.delMenuMapper(mid);
        //查询该菜单的父级菜单子元素个数
        int childCount = menuMapper.selChildCountMapper(pid);
        //若父菜单子元素个数为1则将其isParent修改为0
        if(childCount == 0){
            menuMapper.updParentMapper(Integer.valueOf(pid),"0");
        }
        return i>0;
    }

    public List<TreeResult> selMenuService(){
        List<Menu> menus = menuMapper.selAllMenuMapper();
        List<TreeResult> childs = findChild(menus, 0);
        return childs;
    }

    /**
     * 同步查询关系列表
     * @param menus
     * @param pid
     * @return
     */
    private List<TreeResult> findChild(List<Menu> menus, int pid) {
        List<TreeResult> list = new ArrayList<>();
        for(Menu item:menus){
            if(item.getPid()==pid) {
                TreeResult result = new TreeResult();
                result.setText(item.getMname());
                result.setId(item.getMid());
                result.setState("1".equals(item.getIsparent()) ? "closed" : "open");
                Map<String, Object> map = new HashMap<>();
                map.put("mdesc", item.getMdesc());
                map.put("pid", item.getPid());
                map.put("url", item.getUrl());
                map.put("isparent",item.getIsparent());
                result.setAttributes(map);
                List<TreeResult> childNodes = findChild(menus, item.getMid());
                result.setChildren(childNodes);
                list.add(result);
            }
        }
        return list;
    }

}
