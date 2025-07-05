package com.model;

import jakarta.persistence.*;

@Entity
@Table(name = "quiz")
public class Quiz {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer quizId;

    @Column(name = "quiz_name", nullable = false)
    private String quizName;

    public Integer getQuizId() { return quizId; }
    public void setQuizId(Integer quizId) { this.quizId = quizId; }
    public String getQuizName() { return quizName; }
    public void setQuizName(String quizName) { this.quizName = quizName; }
}