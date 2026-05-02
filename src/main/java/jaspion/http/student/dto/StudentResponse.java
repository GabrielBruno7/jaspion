package jaspion.http.student.dto;

import java.time.LocalDate;

import jaspion.domain.student.Student;

public record StudentResponse(
    Long id,
    String name,
    LocalDate birthDate,
    String gender,
    String phoneNumber,
    String email,
    String observations,
    String address,
    String number,
    String neighborhood,
    String city,
    String state,
    String zipCode
) {
    public static StudentResponse from(Student student) {
        return new StudentResponse(
            student.getId(),
            student.getName(),
            student.getBirthDate(),
            student.getGender(),
            student.getPhoneNumber(),
            student.getEmail(),
            student.getObservations(),
            student.getAddress(),
            student.getNumber(),
            student.getNeighborhood(),
            student.getCity(),
            student.getState(),
            student.getZipCode()
        );
    }
}
