-- StudentExam (for grade lookups)
CREATE INDEX IX_StudentExam_StdID ON [dbo].[StudentExam](StdID);
CREATE INDEX IX_StudentExam_ExamID ON [dbo].[StudentExam](ExamID);
