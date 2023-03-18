
	                                         /******************Student_answer******************/ 
	/******************select******************/
	create procedure SelectStudentAnswer @Stid int
as
	select *
	from  Stu_Answer
	where  St_Id =@Stid


	execute SelectStudentAnswer 1

	/******************update******************/
		create procedure UpdateStudentAnswer @Stid int,@Qid int, @Exid int, @Answer nchar(100)
		as
			update Stu_Answer set St_Answer=@Answer, date = GETDATE()
			where St_Id=@Stid and Q_Id=@Qid and Ex_Id=@Exid 
	

			execute UpdateStudentAnswer  1,4,1,"a)amira"
	/******************insert******************/     
	create procedure AddAnswer @Stid int,@Qid int, @Exid int, @Answer nchar(100)
as
	insert into Stu_Answer
	values(@Exid,@Stid,@Qid ,GETDATE(),@Answer)

	execute AddAnswer 1,3,1,vafsref
	/******************delete******************/
			create procedure DeleteAnswer @Stid int,@Qid int, @Exid int
as
	delete from Stu_Answer where St_Id=@Stid and Q_Id=@Qid and Ex_Id=@Exid 


	execute DeleteAnswer 1,3,1

	/******************Report that takes exam number and the student ID then returns the Questions in this exam with the student answers******************/
		create procedure ViewQuest_and_Ans_for_Student @EXid int,@Stid int 
as
	select Q_Title , St_Answer from Question as q ,Stu_Answer
	where q.Q_Id=(select Q_Id 
	from  Stu_Answer
	where  St_Id =@Stid and Ex_Id = @EXid)
	


	execute ViewQuest_and_Ans_for_Student 1,1

	/******************instructor_course******************/
	
	/******************select******************/
	/******************Report that takes the instructor ID and returns the name of the courses that he teaches and the number of student per course.******************/
create procedure NameOfCourseAndNumOfStudByInsId @InsId int  
as
		select count(St_Id) as st_num, Crs_Name from stud_Course as sc , Course where sc.Crs_Id = 
	(select Crs_Id from Ins_Course where Ins_Id = @InsId ) and Course.Crs_Id = 
	(select Crs_Id from Ins_Course where Ins_Id = @InsId )
	group by sc.Crs_Id,Course.Crs_Name


	execute NameOfCourseAndNumOfStudByInsId 4
	/******************update******************/
	create procedure Update_ins_course @InsId int,@crsid int
		as
			update Ins_Course set Crs_Id=@crsid,
			where Ins_Id=@InsId  
	

			execute Update_ins_course  1,5
	/******************insert******************/
	create procedure Add_Ins_Course  @InsId int,@crsid int
as
	insert into Ins_Course 
	values(@InsId,@crsid)

	execute Add_Ins_Course 1,3
	/******************delete******************/
		create procedure Deleteinscourse @InsId int
as
	delete from Ins_Course where Ins_Id=@InsId 


	execute Deleteinscourse 1
	