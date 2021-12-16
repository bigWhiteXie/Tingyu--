package com.codeXie.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Admin {
    private Integer aid;
    private String apwd;
    private String aname;
    private String aphone;
    private Date starttime;
}
