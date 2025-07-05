package com.service;

import com.model.Result;
import com.model.Student;
import com.repository.ResultRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResultService {
    @Autowired
    private ResultRepository resultRepository;

    public Result save(Result result) {
        return resultRepository.save(result);
    }

    public List<Result> getResultsForStudent(Student student) {
        return resultRepository.findByStudentOrderBySubmittedAtDescEager(student);
    }
} 