# Project Walkthrough: Testify (Online Exam System)

This document provides a complete transition log and technical summary of the development of the "Testify" application.

## 🚀 Project Overview
**Testify** is a full-stack Java web application built with Spring Boot, designed for managing online exams, students, and results.

### 🛠 Technology Stack
- **Backend:** Java 17, Spring Boot 3.2
- **Database:** PostgreSQL (Cloud/Neon.tech), H2 (Local Development)
- **Frontend:** HTML5, CSS3, JavaScript, Thymeleaf, Bootstrap 5
- **Build Tool:** Maven
- **Containerization:** Docker
- **Deployment:** Render (Web Service)

---

## 🛠 Key Features Implemented

### 1. Security & Authentication
- **Role-Based Access:** Integrated `CustomAuthSuccessHandler` to route users based on their roles.
    - **Admin** -> `/admin/dashboard`
    - **Student** -> `/student/dashboard`
- **Session Management:** Configured secure logins and logout flows.

### 2. Error Handling & Auditing
- **Custom Error Pages:** Implemented unified handling for 403 (Forbidden) and 404 (Not Found) errors.
- **JPA Auditing:** Enabled `@EnableJpaAuditing` to automatically track creation and modification timestamps on all records.

### 3. Exam Management
- **Question Logic:** Admin can create exams and add multiple-choice questions with marks.
- **Unified Status:** Student dashboard shows exam status (Completed/Not Started) with direct links to results.
- **Interactive Timer:** A JavaScript-powered timer that automatically submits the exam once the time limit is reached.

---

## 🔧 Major Build & Technical Fixes

### 1. Lombok & Java 17 Compatibility
Resolved a major compilation blocker where Lombok-generated methods (getters/setters) were not visible to the compiler.
- **Solution:** Upgraded Lombok to `1.18.34` and synced it inside the `maven-compiler-plugin` configuration in `pom.xml`.

### 2. Database Migration (H2 to PostgreSQL)
Transitioned the project from a temporary local H2 file database to a permanent cloud-hosted PostgreSQL database.
- **Provider:** Neon.tech
- **Benefit:** Persistence. Data is no longer wiped when the server restarts on Render's free tier.

---

## ☁️ Deployment Guide (Render)

### 1. Multi-Stage Docker Build
We updated the `Dockerfile` to a multi-stage build, allowing the cloud provider to build the project directly from the source code.

### 2. Deployment Steps
1. Push code to GitHub (`origin main`).
2. Point Render to the GitHub repository.
3. Use **Docker** runtime and set the **Free** instance type.
4. (Optional) Set `PORT=7890` as an environment variable.

---

## 🔑 Administrative Credentials
- **Username:** `admin`
- **Password:** `adminpass`

---

**Project URL:** [https://testify.onrender.com](https://testify.onrender.com)
**Developer:** Antigravity (Coding Assistant) & shrey-varsani
