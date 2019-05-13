package com.isep.HomeExchange.model.table;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.*;
import java.util.Date;


@Entity
public class User {
    @Id @GeneratedValue private int id;
    @Size(min=2, max=30) private String firstName;
    @Size(min=2, max=30) private String lastName;
    @NotEmpty @Email private String email;
    @NotNull @Min(18) @Max(100) private Integer age;
    @NotNull private Gender gender;
    @DateTimeFormat(pattern="MM/dd/yyyy") @NotNull @Past private Date birthday;
    private int status;

    public User() {

    }

    public User(@Size(min = 2, max = 30) String firstName, @Size(min = 2, max = 30) String lastName, @NotEmpty @Email String email, @NotNull @Min(18) @Max(100) Integer age, @NotNull Gender gender, @NotNull @Past Date birthday) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.age = age;
        this.gender = gender;
        this.birthday = birthday;
    }

    public enum Gender {
        MALE, FEMALE
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }


}
