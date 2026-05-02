package jaspion.http.student;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import jaspion.application.student.StudentService;
import jaspion.domain.student.Student;
import jaspion.http.student.dto.StudentRequest;
import jaspion.http.student.dto.StudentResponse;

@RestController
@RequestMapping("/students")
public class StudentController {

    private final StudentService service;

    public StudentController(StudentService service) {
        this.service = service;
    }

    @PostMapping
    public ResponseEntity<StudentResponse> create(@RequestBody @Valid StudentRequest request) {
        Student student = new Student();

        student.setName(request.name());
        student.setBirthDate(request.birthDate());
        student.setGender(request.gender());
        student.setPhoneNumber(request.phoneNumber());
        student.setEmail(request.email());
        student.setObservations(request.observations());
        student.setAddress(request.address());
        student.setNumber(request.number());
        student.setNeighborhood(request.neighborhood());
        student.setCity(request.city());
        student.setState(request.state());
        student.setZipCode(request.zipCode());

        Student saved = service.save(student);

        return ResponseEntity
            .status(HttpStatus.CREATED)
            .body(StudentResponse.from(saved))
        ;
    }

    @GetMapping
    public ResponseEntity<List<StudentResponse>> findAll() {
        List<StudentResponse> students = service.findAll()
            .stream()
            .map(StudentResponse::from)
            .toList()
        ;

        return ResponseEntity.ok(students);
    }

    @GetMapping("/{id}")
    public ResponseEntity<StudentResponse> findById(@PathVariable Long id) {
        return service.findById(id)
            .map(StudentResponse::from)
            .map(ResponseEntity::ok)
            .orElse(ResponseEntity.notFound().build())
        ;
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteById(@PathVariable Long id) {
        service.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}