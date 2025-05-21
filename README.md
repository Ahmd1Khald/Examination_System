# Examination System Database

## Overview

The **Examination System Database** is a SQL Server-based project designed to manage examination processes efficiently. It allows instructors to create exams, students to take exams, and training managers to oversee the process. The system ensures data integrity, access control, and automation of key functionalities like exam evaluation and backup management.

## Features

- **Question Pool**: Supports multiple-choice, true/false, and text-based questions.
- **Exam Creation**: Instructors can create exams manually or select random questions.
- **Student Exam Handling**: Stores students' answers, evaluates responses, and calculates scores.
- **Course & Instructor Management**: Tracks course details, instructors, and student enrollments.
- **User Authentication**: Role-based access for admin, training managers, instructors, and students.
- **Performance Optimization**: Uses indexes, constraints, and triggers for best performance.
- **Automated Backup**: Ensures daily data backups for security.

## System Requirements

- **Database Management**: SQL Server
- **Roles & Permissions**:
  - **Admin**: Manages system-level configurations.
  - **Training Manager**: Manages branches, tracks, intakes, and student records.
  - **Instructor**: Creates exams and evaluates student performance.
  - **Student**: Takes exams at scheduled times.

## Database Structure

**Entities:**  

**Person Schema**  
- **Instructor**: Manages instructor assignments.  
- **Student**: Tracks student enrollments and personal details.  

**Organization Schema**  
- **Branch**: Stores branch information.  
- **Department**: Stores department information.  
- **Track**: Stores track information.  
- **Intake**: Stores intake information.  
- **Branch Department**: Represents a branch and its departments.  
- **Branch Department Track**: Represents a department and its tracks within a branch.  
- **Branch Department Track Intake**: Represents a track and its intakes within a branch department.  
- **Branch Department Track Intake Instructor Course**: Stores intake details, associated courses, and assigned instructors.  
- **Branch Department Track Intake Student**: Stores intake details and enrolled students.  
- **Course**: Stores course information.  
- **Instructor Course**: Stores course details and assigned instructors.  

**Exam Schema**  
- **Exam**: Stores exam details.  
- **Question**: Maintains a pool of various question types.  
- **Exam Question**: Links exams with their respective questions.  
- **Student Exam**: Stores student exam records, including type (corrective or regular) and results.  
- **Choice**: Stores multiple-choice options for MCQ-type questions.  
- **True/False**: Stores the correct answer for True/False-type questions.  
- **Text Answer**: Stores the correct answer for text-based questions.  

**Answer Schema**  
- **Student Answer**: Stores student responses to exam questions.  
- **Text Answer**: Stores student responses for text-based questions.  
- **True/False Answer**: Stores student responses for True/False questions.  
- **MCQ Answer**: Stores student responses for multiple-choice questions.  

## Usage

- **Admins**: Manage users and system-wide configurations.
- **Training Managers**: Add branch, department, track, intake, students, manage courses, and assign tracks.
- **Instructors**: Create exams, assign questions, and evaluate responses.
- **Students**: Take scheduled exams and view results.

## Project Deliverables

- **Entity-Relationship Diagram (ERD)**: [https://drive.google.com/file/d/1R76v6raqPbK2OT9OGyn2cQL83R5Md_ja/view]
- **SQL Database Files**: Tables, indexes, and constraints.
- **SQL Scripts**:
  - Individual team member contributions.
  - Full database structure and object creation.
- **Test Queries & Results**: Verification of database integrity and functionality.
- **User Accounts & Credentials**: Predefined accounts and their roles.
## Trello Board

https://trello.com/b/YwcHRBH2/iti-minya-net-q3-24-25-team-4

## Contributors

- [Ahmed Khaled Sayed]
- [Khaled Maher]
- [Ahmed Taher]
- [Ahmed Khaled Noor]
- [Alaa Ayesh]
- [Hajer Ahmed]

## Contact

For any inquiries or contributions, please reach out to [ahkhno0120@gmail.com].
