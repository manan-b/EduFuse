package com.repository;

import com.model.Result;
import com.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.List;

public interface ResultRepository extends JpaRepository<Result, Integer> {
    List<Result> findByStudentOrderBySubmittedAtDesc(Student student);

    @Query("SELECT r FROM Result r JOIN FETCH r.quiz WHERE r.student = :student ORDER BY r.submittedAt DESC")
    List<Result> findByStudentOrderBySubmittedAtDescEager(@Param("student") Student student);
}