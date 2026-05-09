package com.tamjid.course.service.impl;

import com.tamjid.course.model.Course;
import com.tamjid.course.service.CourseService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {

    private final List<Course> courses = new ArrayList<>();

    public CourseServiceImpl() {

        courses.add(new Course(
                1L,
                "Spring Boot Masterclass",
                "Learn backend development",
                5000.0
        ));

        courses.add(new Course(
                2L,
                "Angular Fundamentals",
                "Learn frontend development",
                4500.0
        ));
    }

    @Override
    public List<Course> getAllCourses() {
        return courses;
    }

    @Override
    public Course getCourseById(Long id) {

        return courses.stream()
                .filter(course -> course.getId().equals(id))
                .findFirst()
                .orElse(null);
    }

    @Override
    public Course createCourse(Course course) {

        courses.add(course);

        return course;
    }

    @Override
    public Course updateCourse(Long id, Course updatedCourse) {

        Course existingCourse = getCourseById(id);

        if (existingCourse != null) {

            existingCourse.setTitle(updatedCourse.getTitle());
            existingCourse.setDescription(updatedCourse.getDescription());
            existingCourse.setPrice(updatedCourse.getPrice());
        }

        return existingCourse;
    }

    @Override
    public void deleteCourse(Long id) {

        courses.removeIf(course -> course.getId().equals(id));
    }
}