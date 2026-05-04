Write-Host "🚀 Setting up Course Enrollment Project..." -ForegroundColor Cyan

# =========================
# Helper Functions
# =========================

function Ensure-Directory($path) {
    if (!(Test-Path $path)) {
        New-Item -ItemType Directory -Path $path -Force | Out-Null
    }
}

function Create-File($path, $content) {
    $dir = Split-Path -Parent $path

    if ($dir -and !(Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }

    Set-Content -Path $path -Value $content -Encoding UTF8
}

# =========================
# Root Structure
# =========================

Ensure-Directory "backend"
Ensure-Directory "frontend"

# =========================
# Backend Structure
# =========================

$base = "backend/course-enrollment/src/main/java/com/tamjid/course"

$backendDirs = @(
    "$base/controller",
    "$base/service",
    "$base/service/impl",
    "$base/model",
    "$base/dto",
    "$base/repository",
    "$base/exception",
    "$base/config",
    "backend/course-enrollment/src/main/resources"
)

foreach ($dir in $backendDirs) {
    Ensure-Directory $dir
}

# =========================
# Backend Files
# =========================

Create-File "$base/CourseEnrollmentApplication.java" @"
package com.tamjid.course;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class CourseEnrollmentApplication {
    public static void main(String[] args) {
        SpringApplication.run(CourseEnrollmentApplication.class, args);
    }
}
"@

Create-File "$base/model/Course.java" @"
package com.tamjid.course.model;

public class Course {
    private Long id;
    private String title;
    private String description;
}
"@

Create-File "$base/model/Enrollment.java" @"
package com.tamjid.course.model;

public class Enrollment {
    private Long id;
    private Long courseId;
    private Long studentId;
}
"@

Create-File "$base/controller/CourseController.java" @"
package com.tamjid.course.controller;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/courses")
public class CourseController {
}
"@

Create-File "$base/controller/EnrollmentController.java" @"
package com.tamjid.course.controller;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/enrollments")
public class EnrollmentController {
}
"@

Create-File "$base/service/CourseService.java" @"
package com.tamjid.course.service;

public interface CourseService {
}
"@

Create-File "$base/service/EnrollmentService.java" @"
package com.tamjid.course.service;

public interface EnrollmentService {
}
"@

Create-File "$base/service/impl/CourseServiceImpl.java" @"
package com.tamjid.course.service.impl;

import org.springframework.stereotype.Service;

@Service
public class CourseServiceImpl {
}
"@

Create-File "$base/service/impl/EnrollmentServiceImpl.java" @"
package com.tamjid.course.service.impl;

import org.springframework.stereotype.Service;

@Service
public class EnrollmentServiceImpl {
}
"@

Create-File "$base/dto/CourseDTO.java" @"
package com.tamjid.course.dto;

public class CourseDTO {
}
"@

Create-File "$base/dto/EnrollmentDTO.java" @"
package com.tamjid.course.dto;

public class EnrollmentDTO {
}
"@

Create-File "$base/exception/GlobalExceptionHandler.java" @"
package com.tamjid.course.exception;

public class GlobalExceptionHandler {
}
"@

Create-File "$base/exception/ResourceNotFoundException.java" @"
package com.tamjid.course.exception;

public class ResourceNotFoundException extends RuntimeException {
}
"@

Create-File "$base/config/CorsConfig.java" @"
package com.tamjid.course.config;

public class CorsConfig {
}
"@

# =========================
# Frontend Structure
# =========================

$fe = "frontend/src/app"

$frontendDirs = @(
    "$fe/core/services",
    "$fe/core/guards",
    "$fe/core/models",
    "$fe/shared/components",
    "$fe/features/course",
    "$fe/features/enrollment",
    "$fe/features/auth"
)

foreach ($dir in $frontendDirs) {
    Ensure-Directory $dir
}

# =========================
# Frontend Files
# =========================

Create-File "$fe/app.component.ts" @"
import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  template: '<h1>Course Enrollment System</h1>'
})
export class AppComponent {}
"@

Create-File "$fe/app.module.ts" @"
import { NgModule } from '@angular/core';

@NgModule({})
export class AppModule {}
"@

Create-File "$fe/app-routing.module.ts" @"
import { NgModule } from '@angular/core';

@NgModule({})
export class AppRoutingModule {}
"@

Create-File "$fe/core/services/course.service.ts" @"
import { Injectable } from '@angular/core';

@Injectable({ providedIn: 'root' })
export class CourseService {}
"@

Create-File "$fe/core/services/auth.service.ts" @"
import { Injectable } from '@angular/core';

@Injectable({ providedIn: 'root' })
export class AuthService {}
"@

Create-File "$fe/core/guards/auth.guard.ts" @"
import { Injectable } from '@angular/core';

@Injectable({ providedIn: 'root' })
export class AuthGuard {}
"@

Create-File "$fe/core/models/course.model.ts" @"
export interface Course {
  id: number;
  title: string;
}
"@

Create-File "$fe/core/models/enrollment.model.ts" @"
export interface Enrollment {
  id: number;
  courseId: number;
}
"@

# =========================
# Root .gitignore
# =========================

Create-File ".gitignore" @"
# =========================
# Node / Angular
# =========================
node_modules/
dist/
.angular/
coverage/

# =========================
# Java / Spring Boot
# =========================
target/
*.class
*.jar
*.war

# =========================
# IntelliJ IDEA
# =========================
.idea/
*.iml

# =========================
# VS Code
# =========================
.vscode/

# =========================
# Logs
# =========================
*.log

# =========================
# OS Files
# =========================
.DS_Store
Thumbs.db

# =========================
# Environment / Secrets
# =========================
.env
.env.*
application.properties
application.yml

# =========================
# Build
# =========================
out/
build/
"@

Write-Host "✅ Project setup completed successfully!" -ForegroundColor Green