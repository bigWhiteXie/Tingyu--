package com.codeXie.controller;

import com.codeXie.pojo.Admin;
import com.codeXie.pojo.Menu;
import com.codeXie.pojo.TreeResult;
import com.codeXie.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("menu")
public class MenuController {
    @Autowired
    private MenuService menuService;

    @ResponseBody
    @RequestMapping("menuInfo")
    public List<TreeResult> meauInfo(@RequestParam(defaultValue = "0") Integer id, HttpSession session){
        Admin admin = (Admin) session.getAttribute("admin");
        List<TreeResult> treeResults = menuService.menuInfoService(admin.getAid(), id);
        return treeResults;
    }

    @ResponseBody
    @RequestMapping("menuManagerInfo")
    public List<TreeResult> menuManagerInfo(@RequestParam(defaultValue = "0") Integer id){
        List<TreeResult> treeResults = menuService.menuManagerInfoService(id);
        return treeResults;
    }

    @ResponseBody
    @RequestMapping("menuAdd")
    public Boolean menuAdd(Menu menu,@RequestParam(defaultValue = "0") Integer pid){
        menu.setPid(pid);
        return menuService.addMenuService(menu);
    }
    @ResponseBody
    @RequestMapping("menuEdit")
    public Boolean menuEdit(Menu menu,@RequestParam(defaultValue = "0") Integer pid){

        return menuService.updMenuService(menu) > 0;
    }
    @ResponseBody
    @RequestMapping("menuDel")
    public Boolean menuDel(String mid,String pid) {
        return menuService.delMenuService( mid,pid);
    }

    @RequestMapping("menuRoleInfo")
    @ResponseBody
    public List<TreeResult> menuRoleInfo(){
        return menuService.selMenuService();
    }
}
