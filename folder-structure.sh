#!/bin/bash

echo "🚀 Creating Project Structure..."

# =========================
# Backend Structure
# =========================
mkdir -p backend/course-enrollment/src/main/java/com/tamjid/course/{controller,service,service/impl,model,dto,repository,exception,config}
mkdir -p backend/course-enrollment/src/main/resources

# =========================
# Frontend Structure
# =========================
mkdir -p frontend/src/app/core/{services,guards,models}
mkdir -p frontend/src/app/shared/components
mkdir -p frontend/src/app/features/{course,enrollment,auth}

echo "✅ Project structure created successfully!"