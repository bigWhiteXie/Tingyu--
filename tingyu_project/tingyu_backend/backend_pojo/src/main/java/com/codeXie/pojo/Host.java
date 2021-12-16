package com.codeXie.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Host {
    private Integer hid;
    private String hname;
    private String hpwd;
    private String hphone;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date starttime;
    private String status;
    private Integer strong;
    private Integer ordernumber;

    private HostPower hostPower;//记录当前主持人的权限信息
}
