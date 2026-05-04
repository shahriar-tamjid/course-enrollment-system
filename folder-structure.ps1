Write-Host "Creating Project Structure..." -ForegroundColor Cyan

# =========================
# Helper Function
# =========================
function Ensure-Directory($path) {
    if (!(Test-Path $path)) {
        New-Item -ItemType Directory -Path $path -Force | Out-Null
    }
}

# =========================
# Root Folders
# =========================
Ensure-Directory "backend"
Ensure-Directory "frontend"

# =========================
# Backend Structure
# =========================
Ensure-Directory "backend/course-enrollment/src/main/java/com/tamjid/course/controller"
Ensure-Directory "backend/course-enrollment/src/main/java/com/tamjid/course/service"
Ensure-Directory "backend/course-enrollment/src/main/java/com/tamjid/course/service/impl"
Ensure-Directory "backend/course-enrollment/src/main/java/com/tamjid/course/model"
Ensure-Directory "backend/course-enrollment/src/main/java/com/tamjid/course/dto"
Ensure-Directory "backend/course-enrollment/src/main/java/com/tamjid/course/repository"
Ensure-Directory "backend/course-enrollment/src/main/java/com/tamjid/course/exception"
Ensure-Directory "backend/course-enrollment/src/main/java/com/tamjid/course/config"
Ensure-Directory "backend/course-enrollment/src/main/resources"

# =========================
# Frontend Structure
# =========================
Ensure-Directory "frontend/src/app/core/services"
Ensure-Directory "frontend/src/app/core/guards"
Ensure-Directory "frontend/src/app/core/models"
Ensure-Directory "frontend/src/app/shared/components"
Ensure-Directory "frontend/src/app/features/course"
Ensure-Directory "frontend/src/app/features/enrollment"
Ensure-Directory "frontend/src/app/features/auth"

Write-Host "Project structure created successfully!" -ForegroundColor Green
