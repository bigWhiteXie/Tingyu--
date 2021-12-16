package com.codeXie.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MarriedPerson {
    private Integer pid;
    private String ppwd;
    private String pname;
    private String phone;
    private String pmail;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date marrydate;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date regdate;
    private String status;
}
