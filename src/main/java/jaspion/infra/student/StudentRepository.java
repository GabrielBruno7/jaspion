package jaspion.infra.student;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

import org.springframework.stereotype.Repository;

import jaspion.domain.student.Student;
import jaspion.domain.student.StudentRepositoryInterface;

@Repository
public class StudentRepository implements StudentRepositoryInterface {

    private final StudentJpa jpa;

    public StudentRepository(StudentJpa jpa) {
        this.jpa = jpa;
    }

    @Override
    public Student save(Student student) {
        return jpa.save(Objects.requireNonNull(student, "student must not be null"));
    }

    @Override
    public Optional<Student> findById(Long id) {
        return jpa.findById(Objects.requireNonNull(id, "id must not be null"));
    }

    @Override
    public List<Student> findAll() {
        return jpa.findAll();
    }

    @Override
    public void deleteById(Long id) {
        jpa.deleteById(Objects.requireNonNull(id, "id must not be null"));
    }

    @Override
    public boolean existsByEmail(String email) {
        return jpa.existsByEmail(email);
    }
}
