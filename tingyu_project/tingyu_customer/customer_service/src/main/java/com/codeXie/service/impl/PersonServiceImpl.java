package com.codeXie.service.impl;

import com.codeXie.mapper.PersonMapper;
import com.codeXie.pojo.MarriedPerson;
import com.codeXie.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PersonServiceImpl implements PersonService {
    @Autowired
    PersonMapper mapper;

    @Override
    public int registerService(MarriedPerson person) {
        return mapper.addPersonMapper(person);
    }
}
