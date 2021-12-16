package com.codeXie.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HostPower {
    private Integer hpid;
    private String hpstar;
    @JsonFormat(pattern = "yyyy-MM-dd")//后台实体类数据转换为json数据的时候使用
    @DateTimeFormat(pattern = "yyyy-MM-dd")//请求数据中的日期数据存储存储到实体类对象中使用
    private Date hpstart_begindate;
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date hpstart_enddate;
    private String hp_order_power;
    @JsonFormat(pattern = "HH:mm:ss")
    @DateTimeFormat(pattern = "HH:mm:ss")
    private Date hpstart_begintime;
    @JsonFormat(pattern = "HH:mm:ss")
    @DateTimeFormat(pattern = "HH:mm:ss")
    private Date hpstart_endtime;
    private Integer hpdiscount;
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date hp_dis_starttime;
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date hp_dis_endtime;
    private Double hpprice;
    private Double hcosts;
    private Integer hostid;
}
