package com.tamjid.course.controller;

import com.tamjid.course.model.Course;
import com.tamjid.course.service.CourseService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/courses")
@CrossOrigin("*")
public class CourseController {

    private final CourseService courseService;

    public CourseController(CourseService courseService) {
        this.courseService = courseService;
    }

    @GetMapping
    public List<Course> getAllCourses() {

        return courseService.getAllCourses();
    }

    @GetMapping("/{id}")
    public Course getCourseById(@PathVariable Long id) {

        return courseService.getCourseById(id);
    }

    @PostMapping
    public Course createCourse(@RequestBody Course course) {

        return courseService.createCourse(course);
    }

    @PutMapping("/{id}")
    public Course updateCourse(
            @PathVariable Long id,
            @RequestBody Course course
    ) {

        return courseService.updateCourse(id, course);
    }

    @DeleteMapping("/{id}")
    public void deleteCourse(@PathVariable Long id) {

        courseService.deleteCourse(id);
    }
}