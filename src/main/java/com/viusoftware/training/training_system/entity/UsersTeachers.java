package com.viusoftware.training.training_system.entity;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "users_teachers")
public class UsersTeachers {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String fullName;
    private String username;
    private String email;
    private String password;
    private String role;

    // Bổ sung trường phone
    private String phone;

    // Bổ sung các trường còn thiếu
    private String avatar;
    private String position;
    private String degree;
    private String department;
    private String status;
    private LocalDate createdAt;

    // Getters and setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getAvatar() { return avatar; }
    public void setAvatar(String avatar) { this.avatar = avatar; }

    public String getPosition() { return position; }
    public void setPosition(String position) { this.position = position; }

    public String getDegree() { return degree; }
    public void setDegree(String degree) { this.degree = degree; }

    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public LocalDate getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDate createdAt) { this.createdAt = createdAt; }
}

// Make sure you do NOT have @Data or @ToString/@EqualsAndHashCode if you have relationships
// If you have relationships, add @ToString.Exclude or @JsonIgnore to avoid recursion
// For example:
// @ManyToOne
// @JoinColumn(name = "department_id")
// @ToString.Exclude
// private Department department;
