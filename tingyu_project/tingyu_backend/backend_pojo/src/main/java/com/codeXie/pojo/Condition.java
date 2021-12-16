package com.codeXie.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Condition {
    private Integer size;
    private Integer index;
    private Integer start;
    private String hname;
    private String cname;
    private String strong;
    private String status;
    private String hpstart;
    private String hpdiscount;
}
