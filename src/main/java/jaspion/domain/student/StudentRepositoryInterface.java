package jaspion.domain.student;

import java.util.List;
import java.util.Optional;

public interface StudentRepositoryInterface {
    Student save(Student student);
    Optional<Student> findById(Long id);
    List<Student> findAll();
    void deleteById(Long id);
    boolean existsByEmail(String email);
}