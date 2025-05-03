-- على أغلب الجداول الكبيرة 
CREATE INDEX IX_Student_UserID ON [Person].[Student](UserID);
CREATE INDEX IX_Exam_CourseID ON [dbo].[Exam](CourseID);
CREATE INDEX IX_StudentAnswer_Exam_Std ON [dbo].[StudentAnswer](ExamID, StdID);