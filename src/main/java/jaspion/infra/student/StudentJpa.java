package jaspion.infra.student;

import org.springframework.data.jpa.repository.JpaRepository;

import jaspion.domain.student.Student;

public interface StudentJpa extends JpaRepository<Student, Long> {
    boolean existsByEmail(String email);
}
