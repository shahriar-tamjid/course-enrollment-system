# Course Enrollment System — Frontend

This is the **Angular frontend** for the Course Enrollment System, designed following the **MVVM (Model-View-ViewModel)** architecture. It connects to a Spring Boot backend via REST APIs and uses **Bootstrap 5** for a clean, professional UI.

---

## MVVM Architecture Overview

```
┌──────────────────────────────────────────────────────┐
│                     VIEW (Template)                   │
│           course-list.component.html                  │
│           course-form.component.html                  │
│           navbar.component.html                       │
│                                                       │
│  - Pure declarative HTML templates                    │
│  - Uses Angular binding: {{ }}, [property], (event)   │
│  - No business logic — only Data Binding directives   │
└──────────────┬───────────────────────────────────────┘
               │ Property Binding & Event Binding
               ▼
┌──────────────────────────────────────────────────────┐
│               VIEWMODEL (Component Class)              │
│         course-list.component.ts                      │
│         course-form.component.ts                      │
│                                                       │
│  - Holds UI state (loading, errorMessage, courses[])  │
│  - Exposes methods to the View (loadCourses,          │
│    editCourse, deleteCourse, onSubmit, goBack)        │
│  - Calls Model layer (services) to fetch/mutate data  │
│  - Contains presentation logic, NOT business logic    │
└──────────────┬───────────────────────────────────────┘
               │ Method Calls / Observable Subscriptions
               ▼
┌──────────────────────────────────────────────────────┐
│            MODEL (Data + Business Logic)               │
│                                                       │
│  ┌─────────────────────┐ ┌─────────────────────────┐  │
│  │  course.model.ts     │ │  course.service.ts      │  │
│  │  (Data Contract)     │ │  (API Communication)    │  │
│  │                      │ │                         │  │
│  │  Course interface    │ │  getAllCourses()         │  │
│  │  with:               │ │  getCourseById()         │  │
│  │  - id                │ │  createCourse()          │  │
│  │  - title             │ │  updateCourse()          │  │
│  │  - description       │ │  deleteCourse()          │  │
│  │  - price             │ │                         │  │
│  └─────────────────────┘ └──────────┬──────────────┘  │
│                                      │                 │
└──────────────────────────────────────┼─────────────────┘
                                       │ HTTP (HttpClient)
                                       ▼
                        ┌─────────────────────────┐
                        │   Spring Boot Backend    │
                        │   /api/courses/*         │
                        └─────────────────────────┘
```

### Layer Details

#### 1. Model Layer (`src/app/core/`)

| File | Responsibility |
|------|---------------|
| `models/course.model.ts` | Defines the **Course interface** — the data contract matching the backend response shape. |
| `services/course.service.ts` | **Data access layer**. Uses Angular `HttpClient` to communicate with the Spring Boot backend. Each method maps to one REST endpoint. Returns `Observable<T>`. |

**Key principle**: The Model layer knows nothing about the UI. It only deals with data fetching, transformation, and business logic.

#### 2. ViewModel Layer (`src/app/features/*/*.component.ts`)

| Component | Responsibility |
|-----------|---------------|
| `course-list.component.ts` | Manages course list state: `courses[]`, `loading`, `errorMessage`. Exposes methods: `loadCourses()`, `editCourse()`, `deleteCourse()`. |
| `course-form.component.ts` | Manages add/edit form state: `course`, `isEditMode`, `submitting`. Exposes methods: `onSubmit()`, `goBack()`, `loadCourse()`. |
| `navbar.component.ts` | Navigation state (minimal ViewModel since navbar is static). |

**Key principle**: ViewModels bind to the View via Angular template syntax. They consume the Model layer (services) and expose streams/methods to the View. They can hold UI-only state (like `loading`, `errorMessage`).

#### 3. View Layer (`src/app/*/*.component.html`)

Pure Angular templates with:
- **Interpolation**: `{{ course.title }}`
- **Property Binding**: `[disabled]="submitting"`
- **Event Binding**: `(click)="deleteCourse(course.id)"`
- **Two-way Binding**: `[(ngModel)]="course.title"`
- **Structural Directives**: `*ngFor`, `*ngIf`

**Key principle**: Views contain zero logic. Everything is delegated to the ViewModel.

---

## Project Structure

```
src/
├── app/
│   ├── core/                              # MODEL LAYER
│   │   ├── models/
│   │   │   └── course.model.ts            # Course data interface
│   │   └── services/
│   │       └── course.service.ts          # Course REST API service
│   │
│   ├── features/                          # VIEWMODEL + VIEW LAYERS
│   │   └── course/
│   │       ├── course-list/               # List courses
│   │       │   ├── course-list.component.ts      # ViewModel
│   │       │   ├── course-list.component.html    # View
│   │       │   └── course-list.component.css     # View styles
│   │       └── course-form/               # Add / Edit course
│   │           ├── course-form.component.ts      # ViewModel
│   │           ├── course-form.component.html    # View
│   │           └── course-form.component.css     # View styles
│   │
│   ├── shared/                            # SHARED VIEWMODEL + VIEW
│   │   └── components/
│   │       └── navbar/
│   │           ├── navbar.component.ts          # ViewModel
│   │           ├── navbar.component.html        # View
│   │           └── navbar.component.css         # View styles
│   │
│   ├── app.component.ts                   # Root ViewModel
│   ├── app.component.html                 # Root View
│   ├── app.module.ts                      # Module configuration
│   └── app-routing.module.ts              # Route definitions
│
├── environments/
│   └── environment.ts                     # API base URL config
│
├── index.html                             # Entry point
├── main.ts                                # App bootstrap
└── styles.css                             # Global styles
```

---

## Data Flow

### Read (List all courses)

```
User visits /courses
        │
        ▼
course-list.component.html (View)
  - *ngFor="let course of courses"
  - Displays cards with course data
        ▲
        │ binds to
        │
course-list.component.ts (ViewModel)
  - ngOnInit() → calls loadCourses()
  - courses: Course[] = []
  - loading: boolean
        │
        │ calls
        ▼
course.service.ts (Model)
  - getAllCourses() → HTTP GET /api/courses
        │
        │ HttpClient
        ▼
  Spring Boot Backend → returns Course[]
        │
        │ Observable<Course[]>
        ▼
course-list.component.ts (ViewModel)
  - subscribe({ next: response => this.courses = response })
  - Angular change detection updates the View
```

### Create (Add a new course)

```
User clicks "Add Course" button
        │
        ▼
course-list.component.html
  - routerLink="/courses/new"
        │
        ▼
course-form.component.html (View)
  - Form with [(ngModel)] bindings
  - User fills title, description, price
  - Clicks "Create Course"
        │
        │ (ngSubmit)="onSubmit()"
        ▼
course-form.component.ts (ViewModel)
  - Validates fields (title, description, price > 0)
  - Calls courseService.createCourse(course)
        │
        ▼
course.service.ts (Model)
  - createCourse() → HTTP POST /api/courses
        │
        ▼
  Spring Boot → saves to DB → returns created Course
        │
        │ Observable<Course>
        ▼
course-form.component.ts (ViewModel)
  - On success: navigates to /courses
  - On error: sets errorMessage → View shows alert
```

### Update (Edit a course)

```
User clicks "Edit" on a course card
        │
        ▼
course-list.component.ts (ViewModel)
  - editCourse(id) → router.navigate(['/courses', id, 'edit'])
        │
        ▼
course-form.component.ts (ViewModel)
  - ngOnInit() reads :id from route params
  - Calls courseService.getCourseById(id)
  - Populates form with existing data
  - User modifies fields → clicks "Update Course"
  - Calls courseService.updateCourse(id, course)
        │
        ▼
course.service.ts (Model)
  - updateCourse() → HTTP PUT /api/courses/{id}
```

### Delete

```
User clicks "Delete" on a course card
        │
        ▼
course-list.component.ts (ViewModel)
  - Confirms with user (confirm dialog)
  - Calls courseService.deleteCourse(id)
        │
        ▼
course.service.ts (Model)
  - deleteCourse() → HTTP DELETE /api/courses/{id}
        │
        ▼
  On success: reloads the course list
```

---

## API Endpoints (Backend)

| Method | Endpoint | ViewModel Method |
|--------|----------|-----------------|
| GET | `/api/courses` | `courseService.getAllCourses()` |
| GET | `/api/courses/{id}` | `courseService.getCourseById(id)` |
| POST | `/api/courses` | `courseService.createCourse(course)` |
| PUT | `/api/courses/{id}` | `courseService.updateCourse(id, course)` |
| DELETE | `/api/courses/{id}` | `courseService.deleteCourse(id)` |

Backend base URL is configured in `src/environments/environment.ts`:
```typescript
export const environment = {
  production: false,
  apiBaseUrl: 'http://localhost:8080/api'
};
```

---

## How to Add a New Feature (MVVM Style)

Follow these steps to add a new entity (e.g., `Student`) following the MVVM pattern:

### Step 1: Define the Model

Create `src/app/core/models/student.model.ts`:
```typescript
export interface Student {
  id: number;
  name: string;
  email: string;
}
```

### Step 2: Create the Service

Create `src/app/core/services/student.service.ts`:
```typescript
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Student } from '../models/student.model';
import { environment } from '../../../environments/environment';

@Injectable({ providedIn: 'root' })
export class StudentService {
  private apiUrl = `${environment.apiBaseUrl}/students`;

  constructor(private http: HttpClient) {}

  getAllStudents(): Observable<Student[]> { ... }
  getStudentById(id: number): Observable<Student> { ... }
  createStudent(student: Student): Observable<Student> { ... }
  updateStudent(id: number, student: Student): Observable<Student> { ... }
  deleteStudent(id: number): Observable<void> { ... }
}
```

### Step 3: Create the ViewModel + View

Generate the component:
```bash
ng generate component features/student/student-list --standalone=false
ng generate component features/student/student-form --standalone=false
```

**ViewModel** (`student-list.component.ts`):
- Inject `StudentService`
- Hold state: `students[]`, `loading`, `errorMessage`
- Expose methods: `loadStudents()`, `editStudent()`, `deleteStudent()`

**View** (`student-list.component.html`):
- Bind to ViewModel properties via `*ngFor`, `{{ }}`, `(click)`, etc.

### Step 4: Register Routes

In `app-routing.module.ts`:
```typescript
{ path: 'students', component: StudentListComponent },
{ path: 'students/new', component: StudentFormComponent },
{ path: 'students/:id/edit', component: StudentFormComponent },
```

### Step 5: Add Navigation Link

In `navbar.component.html`, add the route link:
```html
<li class="nav-item">
  <a class="nav-link" routerLink="/students" routerLinkActive="active">Students</a>
</li>
```

### Recap — MVVM Contract for New Features

| Layer | Location | What to Create |
|-------|----------|---------------|
| **Model** | `src/app/core/models/` | Interface matching backend JSON |
| **Model** | `src/app/core/services/` | Service class with HTTP methods |
| **ViewModel** | `src/app/features/<entity>/` | Component class (.ts) — holds state + exposes methods |
| **View** | `src/app/features/<entity>/` | Component template (.html) — pure bindings only |
| **Config** | `src/app/app-routing.module.ts` | Route entries |
| **Config** | `src/app/shared/components/navbar/` | Navigation link |

---

## Development

```bash
# Install dependencies
npm install

# Start dev server (default: http://localhost:4200)
ng serve

# Build for production
ng build

# Run tests
ng test
```

Make sure the Spring Boot backend is running on `http://localhost:8080` before using the frontend.
