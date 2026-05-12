import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Course } from '../../../core/models/course.model';
import { CourseService } from '../../../core/services/course.service';

@Component({
  selector: 'app-course-form',
  standalone: false,
  templateUrl: './course-form.component.html',
  styleUrls: ['./course-form.component.css']
})
export class CourseFormComponent implements OnInit {
  course: Course = { id: 0, title: '', description: '', price: 0 };
  isEditMode = false;
  loading = false;
  submitting = false;
  errorMessage = '';

  constructor(
    private courseService: CourseService,
    private route: ActivatedRoute,
    private router: Router
  ) {}

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id');
    if (id) {
      this.isEditMode = true;
      this.loadCourse(+id);
    }
  }

  loadCourse(id: number): void {
    this.loading = true;
    this.courseService.getCourseById(id).subscribe({
      next: (response) => {
        this.course = response;
        this.loading = false;
      },
      error: () => {
        this.errorMessage = 'Failed to load course details.';
        this.loading = false;
      }
    });
  }

  onSubmit(): void {
    if (!this.course.title || !this.course.description || this.course.price <= 0) {
      this.errorMessage = 'All fields are required and price must be greater than 0.';
      return;
    }

    this.submitting = true;
    this.errorMessage = '';

    if (this.isEditMode) {
      this.courseService.updateCourse(this.course.id, this.course).subscribe({
        next: () => this.router.navigate(['/courses']),
        error: () => {
          this.errorMessage = 'Failed to update course.';
          this.submitting = false;
        }
      });
    } else {
      this.courseService.createCourse(this.course).subscribe({
        next: () => this.router.navigate(['/courses']),
        error: () => {
          this.errorMessage = 'Failed to create course.';
          this.submitting = false;
        }
      });
    }
  }

  goBack(): void {
    this.router.navigate(['/courses']);
  }
}
