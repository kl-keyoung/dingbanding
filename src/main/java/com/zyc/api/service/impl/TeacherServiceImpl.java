package com.zyc.api.service.impl;

import com.zyc.api.mapper.TeacherMapper;
import com.zyc.api.model.Teacher;
import com.zyc.api.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    TeacherMapper teacherMapper;


    @Override
    public void saveTeacher(List<Teacher> list) {
        teacherMapper.saveTeacher(list);
    }
}
