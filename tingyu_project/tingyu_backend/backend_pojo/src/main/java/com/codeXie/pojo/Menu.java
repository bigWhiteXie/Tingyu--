package com.codeXie.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Menu {
    private Integer mid; //菜单编号
    private String mname; //菜单名
    private Integer pid; //父菜单id
    private String isparent; //是否为父菜单(1.是;0.否)
    private String status; //打开状态(1.展开;0.关闭)
    private String url; //url地址
    private String mdesc; //菜单描述
}
