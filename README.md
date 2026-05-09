# Course Enrollment System

## 📌 Overview

This is a full-stack application built using:

* Backend: Spring Boot (Java)
* Frontend: Angular (TypeScript)
* UI: Bootstrap

The system allows managing courses and student enrollments.

---

## 🧱 Architecture

### Backend (Spring Boot - MVC)

* Controller → Handles HTTP requests
* Service → Business logic
* Model → Data structure
* DTO → Data transfer
* Repository → Database (future)

---

### Frontend (Angular - MVVM)

* Component → UI + logic
* Service → API communication
* Model → Data structure

---

## 🔁 Data Flow

1. User interacts with UI
2. Component calls Service
3. Service calls Backend API
4. Backend processes request
5. Response returns to UI

---

## 📁 Folder Structure

### Backend

* controller → API endpoints
* service → business logic
* model → entities
* dto → API-safe objects
* exception → error handling

---

### Frontend

* core → services, guards, models
* features → modules (course, enrollment)
* shared → reusable components

---

## ⚙️ Project Setup (Automated Scripts)

This project includes cross-platform scripts to **automatically generate the complete project skeleton (folders + files)**.

### 📄 Scripts Included

#### 1. Folder Structure Script

* `folder-structure.ps1` (Windows PowerShell)
* `folder-structure.sh` (macOS/Linux)

👉 Creates all required directories for backend and frontend.

---

#### 2. File Structure Script

* `file-structure.ps1` (Windows PowerShell)
* `file-structure.sh` (macOS/Linux)

👉 Creates:

* Java backend boilerplate files
* Angular frontend starter files
* Root `.gitignore`

---

### 🧠 Why These Scripts Exist

These scripts:

* Automatically generate a **clean, scalable project structure**
* Save time from manual setup
* Ensure **consistent architecture across environments**
* Help you understand how a real-world project is organised

---

## ▶️ How to Run Setup Scripts

### 🪟 Windows (PowerShell)

```bash
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\folder-structure.ps1
.\file-structure.ps1
```

---

### 🍎 macOS / 🐧 Linux

Give execution permission:

```bash
chmod +x folder-structure.sh
chmod +x file-structure.sh
```

Run scripts:

```bash
./folder-structure.sh
./file-structure.sh
```

---

## 📦 Install Dependencies

After generating the project structure, install required dependencies:

### Backend

```
mvn clean install
```

### Frontend

```
npm install
npm install bootstrap chart.js
```

---

## ▶️ Run Project

### Backend

```
mvn spring-boot:run
```

### Frontend

```
ng serve
```

---

## ➕ Adding New Feature

### Backend:

1. Create Model
2. Add Service logic
3. Expose Controller API

### Frontend:

1. Create Component
2. Add Service method
3. Connect UI

---

## 🧠 Learning Goals

* Understand MVC (Spring Boot)
* Understand Angular architecture
* Build scalable applications
* Master REST API design

---

## 🚀 Future Improvements

* Replace in-memory data with Oracle DB
* Add JWT Authentication
* Role-based access
* Pagination & filtering

---

## 🚀 Backend Implementation Progress

The backend currently includes an initial implementation of Course CRUD APIs using Spring Boot and in-memory data storage.

The purpose of this phase is to understand:

* Spring Boot MVC architecture
* REST API development
* Dependency Injection
* Request/Response lifecycle
* Service layer separation
* JSON serialization/deserialization

---

## 📚 Implemented Course APIs

| Method | Endpoint            | Purpose                |
| ------ | ------------------- | ---------------------- |
| GET    | `/api/courses`      | Get all courses        |
| GET    | `/api/courses/{id}` | Get course by ID       |
| POST   | `/api/courses`      | Create new course      |
| PUT    | `/api/courses/{id}` | Update existing course |
| DELETE | `/api/courses/{id}` | Delete course          |

---

## 🧠 Backend Request Flow (Spring MVC)

Understanding this flow is extremely important:

```text
HTTP Request
    ↓
Controller
    ↓
Service
    ↓
Data Source / Repository
    ↓
Response returned as JSON
```

Example:

```text
GET /api/courses
    ↓
CourseController
    ↓
CourseServiceImpl
    ↓
Returns List<Course>
    ↓
Spring Boot converts Java Object → JSON
```

---

## 🧩 Implemented Backend Components

### 📄 Course Model

Represents the course entity and data structure.

Fields:

* id
* title
* description
* price

Purpose:

* Stores application data
* Used for request/response mapping
* Converted automatically to JSON by Spring Boot

---

### 📄 CourseService Interface

Defines the business operations:

* getAllCourses()
* getCourseById()
* createCourse()
* updateCourse()
* deleteCourse()

Purpose:

* Separates business contract from implementation
* Improves scalability and maintainability

---

### 📄 CourseServiceImpl

Implements business logic using in-memory data storage.

Current storage:

```java
List<Course> courses = new ArrayList<>();
```

Purpose:

* Simulates database behavior
* Helps understand architecture before integrating Oracle DB

---

### 📄 CourseController

Handles HTTP requests using REST endpoints.

Important annotations used:

| Annotation        | Purpose                            |
| ----------------- | ---------------------------------- |
| `@RestController` | Marks class as REST API controller |
| `@RequestMapping` | Defines base API route             |
| `@GetMapping`     | Handles GET requests               |
| `@PostMapping`    | Handles POST requests              |
| `@PutMapping`     | Handles PUT requests               |
| `@DeleteMapping`  | Handles DELETE requests            |
| `@RequestBody`    | Converts JSON → Java Object        |
| `@PathVariable`   | Extracts URL parameter             |

---

## 🧠 Dependency Injection Concept

Spring Boot automatically creates and manages objects called Beans.

Example:

```java
private final CourseService courseService;
```

Spring injects the implementation automatically into the controller.

This concept is called:

### Dependency Injection (DI)

Benefits:

* Loose coupling
* Better scalability
* Easier testing
* Cleaner architecture

---

## 🔄 JSON Mapping

Spring Boot automatically converts:

### Java Object → JSON

Example:

```java
Course
```

becomes:

```json
{
  "id": 1,
  "title": "Spring Boot Masterclass",
  "description": "Learn backend development",
  "price": 5000
}
```

This conversion is handled internally by the Jackson library.

---

## 🧪 API Testing

Current APIs are tested using:

* Postman
* Browser
* REST client tools

Example test URL:

```text
http://localhost:8080/api/courses
```

---

## 🧠 Key Concepts Learned So Far

### Spring Boot

* MVC Architecture
* REST APIs
* Dependency Injection
* Layered Architecture
* Service Layer Pattern
* JSON Serialization
* Request Mapping

### Java

* Classes & Objects
* Constructors
* Getters & Setters
* Interfaces
* Method Overriding
* Collections (`List`, `ArrayList`)

---

## 📌 Current Limitation

Currently data is stored in-memory:

```java
List<Course>
```

This means:

* Data resets after application restart
* No persistent database yet

Future improvement:

* Integrate Oracle Database using Spring Data JPA

---

---

## 💡 Author

Sharif MD Shahriar Tamjid
