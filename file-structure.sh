#!/bin/bash

echo "🚀 Setting up Course Enrollment Project..."

BASE="backend/course-enrollment/src/main/java/com/tamjid/course"
FE="frontend/src/app"

# =========================
# Backend Files
# =========================

mkdir -p $BASE

cat <<EOF > $BASE/CourseEnrollmentApplication.java
package com.tamjid.course;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class CourseEnrollmentApplication {
    public static void main(String[] args) {
        SpringApplication.run(CourseEnrollmentApplication.class, args);
    }
}
EOF

cat <<EOF > $BASE/model/Course.java
package com.tamjid.course.model;

public class Course {
    private Long id;
    private String title;
    private String description;
}
EOF

cat <<EOF > $BASE/model/Enrollment.java
package com.tamjid.course.model;

public class Enrollment {
    private Long id;
    private Long courseId;
    private Long studentId;
}
EOF

cat <<EOF > $BASE/controller/CourseController.java
package com.tamjid.course.controller;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/courses")
public class CourseController {
}
EOF

cat <<EOF > $BASE/controller/EnrollmentController.java
package com.tamjid.course.controller;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/enrollments")
public class EnrollmentController {
}
EOF

cat <<EOF > $BASE/service/CourseService.java
package com.tamjid.course.service;

public interface CourseService {
}
EOF

cat <<EOF > $BASE/service/EnrollmentService.java
package com.tamjid.course.service;

public interface EnrollmentService {
}
EOF

cat <<EOF > $BASE/service/impl/CourseServiceImpl.java
package com.tamjid.course.service.impl;

import org.springframework.stereotype.Service;

@Service
public class CourseServiceImpl {
}
EOF

cat <<EOF > $BASE/service/impl/EnrollmentServiceImpl.java
package com.tamjid.course.service.impl;

import org.springframework.stereotype.Service;

@Service
public class EnrollmentServiceImpl {
}
EOF

cat <<EOF > $BASE/dto/CourseDTO.java
package com.tamjid.course.dto;

public class CourseDTO {
}
EOF

cat <<EOF > $BASE/dto/EnrollmentDTO.java
package com.tamjid.course.dto;

public class EnrollmentDTO {
}
EOF

cat <<EOF > $BASE/exception/GlobalExceptionHandler.java
package com.tamjid.course.exception;

public class GlobalExceptionHandler {
}
EOF

cat <<EOF > $BASE/exception/ResourceNotFoundException.java
package com.tamjid.course.exception;

public class ResourceNotFoundException extends RuntimeException {
}
EOF

cat <<EOF > $BASE/config/CorsConfig.java
package com.tamjid.course.config;

public class CorsConfig {
}
EOF

# =========================
# Frontend Files
# =========================

mkdir -p $FE

cat <<EOF > $FE/app.component.ts
import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  template: '<h1>Course Enrollment System</h1>'
})
export class AppComponent {}
EOF

cat <<EOF > $FE/app.module.ts
import { NgModule } from '@angular/core';

@NgModule({})
export class AppModule {}
EOF

cat <<EOF > $FE/app-routing.module.ts
import { NgModule } from '@angular/core';

@NgModule({})
export class AppRoutingModule {}
EOF

cat <<EOF > $FE/core/services/course.service.ts
import { Injectable } from '@angular/core';

@Injectable({ providedIn: 'root' })
export class CourseService {}
EOF

cat <<EOF > $FE/core/services/auth.service.ts
import { Injectable } from '@angular/core';

@Injectable({ providedIn: 'root' })
export class AuthService {}
EOF

cat <<EOF > $FE/core/guards/auth.guard.ts
import { Injectable } from '@angular/core';

@Injectable({ providedIn: 'root' })
export class AuthGuard {}
EOF

cat <<EOF > $FE/core/models/course.model.ts
export interface Course {
  id: number;
  title: string;
}
EOF

cat <<EOF > $FE/core/models/enrollment.model.ts
export interface Enrollment {
  id: number;
  courseId: number;
}
EOF

# =========================
# .gitignore
# =========================

cat <<EOF > .gitignore
node_modules/
dist/
.angular/
coverage/

target/
*.class
*.jar
*.war

.idea/
*.iml

.vscode/

*.log

.DS_Store
Thumbs.db

.env
.env.*
application.properties
application.yml

out/
build/
EOF

echo "✅ Project setup completed successfully!"