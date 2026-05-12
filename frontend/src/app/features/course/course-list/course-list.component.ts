import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Course } from '../../../core/models/course.model';
import { CourseService } from '../../../core/services/course.service';

@Component({
  selector: 'app-course-list',
  standalone: false,
  templateUrl: './course-list.component.html',
  styleUrls: ['./course-list.component.css']
})
export class CourseListComponent implements OnInit {
  courses: Course[] = [];
  loading = false;
  errorMessage = '';

  constructor(
    private courseService: CourseService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.loadCourses();
  }

  loadCourses(): void {
    this.loading = true;
    this.errorMessage = '';
    this.courseService.getAllCourses().subscribe({
      next: (response) => {
        this.courses = response;
        this.loading = false;
      },
      error: () => {
        this.errorMessage = 'Failed to load courses. Make sure the backend server is running.';
        this.loading = false;
      }
    });
  }

  editCourse(id: number): void {
    this.router.navigate(['/courses', id, 'edit']);
  }

  deleteCourse(id: number): void {
    if (confirm('Are you sure you want to delete this course?')) {
      this.courseService.deleteCourse(id).subscribe({
        next: () => this.loadCourses(),
        error: () => {
          this.errorMessage = 'Failed to delete course.';
        }
      });
    }
  }
}
