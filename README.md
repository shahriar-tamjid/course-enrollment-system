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

## 💡 Author

Sharif MD Shahriar Tamjid
