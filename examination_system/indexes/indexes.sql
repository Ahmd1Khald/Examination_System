create index IX_StudentExam_ExamID_StdID on [dbo].[StudentExam](ExamID, StdID);

select * 
from StudentExam 
where ExamID = 1;

select * 
from StudentExam 
where ExamID = 1 and StdID = 48;

create index IX_QuestionPick_Exam_Inst on dbo.QuestionPick (ExamID, InstID);

select * 
from QuestionPick 
where ExamID = 3;

select * 
from QuestionPick 
where ExamID = 3 and InstID = 5;

create index IX_InstructorCourse_InstructorID on dbo.InstructorCourse (InstructorID);

select * 
from InstructorCourse 
where InstructorID = 5;

create index IX_StudentCourse_CourseID on dbo.StudentCourse (CourseID);

select * 
from StudentCourse 
where CourseID = 11;

create nonclustered index IX_QuestionPool_ID_Answer on dbo.QuestionPool (ID) include (correctAnswer);

select ID, correctAnswer 
from QuestionPool 
where ID = 12;