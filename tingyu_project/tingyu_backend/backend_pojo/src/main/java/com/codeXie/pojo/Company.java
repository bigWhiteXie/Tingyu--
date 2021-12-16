package com.codeXie.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Company {
    private Integer cid;
    private String cpwd;
    private String cname;
    private String ceo;
    private String cphone;
    private String cmail;
    private Date starttime;
    private String status;
    private Integer ordernumber;
}
