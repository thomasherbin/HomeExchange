//package com.isep.HomeExchange.model.table;
//
//import org.springframework.format.annotation.DateTimeFormat;
//
//import javax.persistence.*;
//import javax.validation.constraints.*;
//import java.util.Date;
//import java.util.Set;
//
//
//
//@Entity
//public class User1 {
//    @Id @GeneratedValue private int id;
//    @Size(min=2, max=30) private String firstName;
//    @Size(min=2, max=30) private String lastName;
//    @NotEmpty @Email private String email;
//    @NotNull @Min(18) @Max(100) private Integer age;
//    @NotNull private Gender gender;
//    @DateTimeFormat(pattern="MM/dd/yyyy") @NotNull @Past private Date birthday;
//    @Size(min = 8, max = 30) String password;
//    private Set roles;
//
//
//    private int status;
//
//    public User1() {
//
//    }
//
//    public User1(@Size(min = 2, max = 30) String firstName, @Size(min = 2, max = 30) String lastName, @NotEmpty @Email String email, @NotNull @Min(18) @Max(100) Integer age, @NotNull Gender gender, @NotNull @Past Date birthday,  @Size(min = 8, max = 30) String password) {
//        this.firstName = firstName;
//        this.lastName = lastName;
//        this.email = email;
//        this.age = age;
//        this.gender = gender;
//        this.birthday = birthday;
//        this.password = password;
//    }
//
//    public enum Gender {
//        MALE, FEMALE
//    }
//
//    public String getFirstName() {
//        return firstName;
//    }
//
//    public void setFirstName(String firstName) {
//        this.firstName = firstName;
//    }
//
//    public String getLastName() {
//        return lastName;
//    }
//
//    public void setLastName(String lastName) {
//        this.lastName = lastName;
//    }
//
//    public String getEmail() {
//        return email;
//    }
//
//    public void setEmail(String email) {
//        this.email = email;
//    }
//
//    public Integer getAge() {
//        return age;
//    }
//
//    public void setAge(Integer age) {
//        this.age = age;
//    }
//
//    public Gender getGender() {
//        return gender;
//    }
//
//    public void setGender(Gender gender) {
//        this.gender = gender;
//    }
//
//    public Date getBirthday() {
//        return birthday;
//    }
//
//    public void setBirthday(Date birthday) {
//        this.birthday = birthday;
//    }
//
//    @ManyToMany
//    @JoinTable(name = "user_role",
//            joinColumns = @JoinColumn(name = "user_id"),
//            inverseJoinColumns = @JoinColumn(name = "role_id"))
//    public Set getRoles() {
//        return roles;
//    }
//
//    public void setRoles(Set roles) {
//        this.roles = roles;
//    }
//}
