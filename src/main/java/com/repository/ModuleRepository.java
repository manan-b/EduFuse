package com.repository;

import com.model.LearningModule;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ModuleRepository extends JpaRepository<LearningModule, Long> {
}
