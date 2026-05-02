package jaspion.http.student.dto;

import java.time.LocalDate;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;

public record StudentRequest(
    @NotBlank String name,
    @NotNull LocalDate birthDate,
    @NotBlank @Pattern(regexp = "[MF]") String gender,
    @NotBlank String phoneNumber,
    @NotBlank @Email String email,
    String observations,
    @NotBlank String address,
    @NotBlank String number,
    @NotBlank String neighborhood,
    @NotBlank String city,
    @NotBlank String state,
    @NotBlank String zipCode
) {}