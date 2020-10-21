package com.zyc.api.mapper;

import com.zyc.api.model.Teacher;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TeacherMapper {
    void saveTeacher(List<Teacher> list);
}
