create procedure dbo.gettop10studentsbycoursename
    @coursename nvarchar(100)
as
begin
    if not exists (select 1 from dbo.course where name = @coursename)
    begin
        raiserror('course name "%s" does not exist.', 16, 1, @coursename);
        return;
    end

    ;with studentcoursetotals as (
        select 
            s.id as studentid,
            s.fname + ' ' + s.lname as studentname,
            c.id as courseid,
            c.name as coursename,
            sum(dbo.calculate_student_degree(s.id, e.id)) as totaldegree
        from 
            [person].student s
        
        join 
            dbo.studentexam se on s.id = se.stdid
        join 
            dbo.exam e on se.examid = e.id
        join 
            dbo.course c on e.courseid = c.id
        group by 
            s.id, s.fname, s.lname, c.id, c.name
    ),
    rankedstudents as (
        select *,
            row_number() over (partition by courseid order by totaldegree desc) as rankincourse
        from 
            studentcoursetotals
    )
    select 
        studentid,
        studentname,
        courseid,
        coursename,
        totaldegree,
        rankincourse
    from 
        rankedstudents
    where 
        rankincourse <= 10
        and coursename = @coursename;
end

exec dbo.gettop10studentsbycoursename @coursename = 'database systems';

exec dbo.gettop10studentsbycoursename @coursename = 'introduction to programming';

