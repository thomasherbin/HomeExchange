package com.isep.HomeExchange.model.table;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.util.Date;


@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Integer id;

    @Size(min=2, max=30)
    @Column(name = "First_Name")
    private String firstName;

    @Size(min=2, max=30)
    @Column(name = "Last_Name")
    private String lastName;

    @NotEmpty @Email
    @Column(name = "Email")
    private String email;

    @NotNull @Min(18) @Max(100)
    @Column(name = "Age")
    private Integer age;


    @DateTimeFormat(pattern="MM/dd/yyyy")
    @Temporal(TemporalType.DATE)
    @NotNull @Past
    @Column(name = "Date_Of_Birth")
    private Date birthday;


    public User() {

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", age=" + age +
                ", birthday=" + birthday +
                '}';
    }
}
