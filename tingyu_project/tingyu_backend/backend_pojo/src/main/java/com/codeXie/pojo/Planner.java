package com.codeXie.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Planner {
    private Integer nid;
    private String nname;
    private String nphone;
    private Date addtime;
    private String status;
    private Integer cid;
    private Integer ordernumber;
}
