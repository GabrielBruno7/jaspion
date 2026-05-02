package jaspion.application.student;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import jaspion.domain.student.Student;
import jaspion.domain.student.StudentRepositoryInterface;

@Service
public class StudentService {

    private final StudentRepositoryInterface repository;

    public StudentService(StudentRepositoryInterface repository) {
        this.repository = repository;
    }

    public Student save(Student student) {
        if (repository.existsByEmail(student.getEmail())) {
            throw new IllegalArgumentException("Email já cadastrado!");
        }
        return repository.save(student);
    }

    public List<Student> findAll() {
        return repository.findAll();
    }

    public Optional<Student> findById(Long id) {
        return repository.findById(id);
    }

    public void deleteById(Long id) {
        repository.deleteById(id);
    }
}