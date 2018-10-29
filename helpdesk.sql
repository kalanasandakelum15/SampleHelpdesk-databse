create database Helpdesk;

use Helpdesk;

/*creating tables*/


create table Empjob
(
jobtitle varchar(100) not null,
department varchar(40),
constraint pkempjop primary key (jobtitle)
)

create table Employee
(
Employee_ID varchar(4) not null,
jobtitle varchar(100) not null,
Emp_f_name varchar(30) not null,
Emp_m_name varchar(20),
Emp_l_name varchar(30),
addline1 varchar(30),
addline2 varchar(30),
city varchar(20),
constraint pkemp primary key (Employee_ID),
constraint fkemp foreign key (jobtitle) references Empjob(jobtitle)
)

create table Specialist
(
Specialist_ID varchar(4) not null,
Employee_ID varchar(4),
constraint pkspec primary key (Specialist_ID),
constraint fkspec foreign key (Employee_ID) references Employee(Employee_ID)
)


create table ProblemType 
(
Problem_type_ID varchar(4) not null,
problem_type_name varchar(30),
constraint pkprbtype primary key (Problem_type_ID)
)

create table Equipment
(
Equipment_ID varchar(4) not null,
Equipment_name varchar(20),
Equipment_description text,
date_acquired datetime,
date_disposal datetime,
Employee_ID varchar(4),
constraint pkeqip primary key (Equipment_ID),
constraint fkeqip foreign key (Employee_ID) references Employee(Employee_ID)
)

create table Problem 
(
Problem_ID varchar(4) not null,
Problem_description varchar(300),
Problem_type_ID varchar(4),
Equipment_ID varchar(4),
constraint pkprb primary key (Problem_ID),
constraint fkprb1 foreign key (Problem_type_ID) references ProblemType(Problem_type_ID),
constraint fkprb2 foreign key (Equipment_ID) references Equipment(Equipment_ID)
)


create table Caller
(
Caller_ID varchar(4) not null,
Employee_ID varchar(4),
constraint pkcall primary key (Caller_ID),
constraint fkcallr1 foreign key (Employee_ID) references Employee(Employee_ID) ,
)

create table Operator
(
Operator_ID varchar(4) not null,
Employee_ID varchar(4),
constraint pkoptr primary key (Operator_ID),
constraint fkoptr foreign key (Employee_ID) references Employee(Employee_ID)
)

create table skill
(
skill varchar(20) not null,
skill_description varchar(200),
constraint pkskill primary key (skill)
)


create table Specialistskill
(
skill varchar(20) not null,
Specialist_ID varchar(4) not null,
constraint pkspcskill primary key (skill,Specialist_ID),
constraint fkspcskill1 foreign key (Specialist_ID) references Specialist(Specialist_ID),
constraint fkspcskill2 foreign key (skill) references skill(skill)
)


create table Priority
(
Priority_no varchar(4),
Priority_description varchar(200),
Problem_ID varchar(4),
constraint pkprio primary key (Priority_no),
constraint fkprio foreign key (Problem_ID) references Problem(Problem_ID)
)



create table ProblemHistory
(
Problem_history_ID varchar(4) not null,
fix_datetime datetime,
Descriptions text,
Problem_ID varchar(4),
constraint pkprbhistory primary key (Problem_history_ID),
constraint fkprbhistory foreign key (Problem_ID) references Problem(Problem_ID)
)



create table usesoftware
(
Software_type varchar(30) not null,
Software_need varchar(30),
constraint pkusesoft primary key (Software_type)
)

create table software
(
Software_ID varchar(4) not null,
Software_name varchar(30),
Software_type varchar(30),
Software_serial varchar(20),
versions varchar(10),
licence varchar(5),
Equipment_ID varchar(4),
constraint pksoft primary key (Software_ID),
constraint fksoft1 foreign key (Equipment_ID) references Equipment(Equipment_ID),
constraint fksoft2 foreign key (Software_type) references UseSoftware(Software_type)
)

create table typehardware
(
Hardware_name varchar(20) not null,
Hardware_type varchar(20),
constraint pktypehard primary key (Hardware_name)
)


create table hardware
(
Hardware_ID varchar(4) not null,
Hardware_name varchar(20),
Manufacture_name varchar(20),
Hardware_serial varchar(20),
Equipment_ID varchar(4),
constraint pkhard primary key (Hardware_ID),
constraint fkhard1 foreign key (Equipment_ID) references Equipment(Equipment_ID),
constraint fkhard2 foreign key (Hardware_name) references TypeHardware(Hardware_name)
)


create table calls
(
Operator_ID varchar(4)not null,
Caller_ID varchar(4) not null,
call_datetime datetime,
constraint pkcalls primary key (Operator_ID,Caller_ID),
constraint fkcalls1 foreign key (Operator_ID) references Operator(Operator_ID),
constraint fkcalls2 foreign key (Caller_ID) references Caller(Caller_ID)
)


create table report
(
Operator_ID varchar(4) not null,
Problem_ID varchar(4) not null,
report_datetime datetime,
constraint pkreport primary key (Operator_ID,Problem_ID),
constraint fkreport1 foreign key (Operator_ID) references Operator(Operator_ID),
constraint fkreport2 foreign key (Problem_ID) references Problem(Problem_ID)
)

create table referspecialist
(
Problem_type_ID varchar(4) not null,
Specialist_ID varchar(4) not null,
constraint pkreferspc primary key (Problem_type_ID,Specialist_ID),
constraint fkreferspc1 foreign key (Problem_type_ID) references ProblemType(Problem_type_ID),
constraint fkreferspc2 foreign key (Specialist_ID) references Specialist(Specialist_ID)
)


create table callproblem 
(
Caller_ID varchar(4) not null,
Problem_ID varchar(4) not null,
constraint pkcallprb primary key (Caller_ID,Problem_ID),
constraint fkcallprb1 foreign key (Caller_ID) references Caller(Caller_ID),
constraint fkcallprb2 foreign key (Problem_ID) references Problem(Problem_ID)
)

create table empcontact
(
phone_number varchar(10) not null,
Employee_ID varchar(4),
constraint pkempcontact primary key (phone_number,Employee_ID),
constraint fkempcontact foreign key (Employee_ID) references Employee(Employee_ID)
)

/* inserting data into tables */

/*empJob table*/ 
insert into empjob(jobtitle,department) values('job1','department1');
insert into empjob(jobtitle,department) values('job2','department2');
insert into empjob(jobtitle,department) values('job3','department3');
insert into empjob(jobtitle,department) values('job4','department4');
insert into empjob(jobtitle,department) values('job5','department5');
insert into empjob(jobtitle,department) values('job6','department6');
insert into empjob(jobtitle,department) values('job7','department7');
insert into empjob(jobtitle,department) values('job8','department8');
insert into empjob(jobtitle,department) values('job9','department9');
insert into empjob(jobtitle,department) values('job10','department10');



/*employee table*/

insert into employee(Employee_ID,jobtitle,Emp_f_name,Emp_m_name,Emp_l_name,Addline1,Addline2,city) values('E001','job1','fname1','mname1','lname1','addline1A1','addline2B1','city1');
insert into employee(Employee_ID,jobtitle,Emp_f_name,Emp_m_name,Emp_l_name,Addline1,Addline2,city) values('E002','job2','fname2','mname2','lname2','addline1A2','addline2B2','city2');
insert into employee(Employee_ID,jobtitle,Emp_f_name,Emp_m_name,Emp_l_name,Addline1,Addline2,city) values('E003','job3','fname3','mname3','lname3','addline1A3','addline2B3','city3');
insert into employee(Employee_ID,jobtitle,Emp_f_name,Emp_m_name,Emp_l_name,Addline1,Addline2,city) values('E004','job4','fname4','mname4','lname4','addline1A4','addline2B4','city4');
insert into employee(Employee_ID,jobtitle,Emp_f_name,Emp_m_name,Emp_l_name,Addline1,Addline2,city) values('E005','job5','fname5','mname5','lname5','addline1A5','addline2B5','city5');
insert into employee(Employee_ID,jobtitle,Emp_f_name,Emp_m_name,Emp_l_name,Addline1,Addline2,city) values('E006','job6','fname6','mname6','lname6','addline1A6','addline2B6','city6');
insert into employee(Employee_ID,jobtitle,Emp_f_name,Emp_m_name,Emp_l_name,Addline1,Addline2,city) values('E007','job7','fname7','mname7','lname7','addline1A7','addline2B7','city7');
insert into employee(Employee_ID,jobtitle,Emp_f_name,Emp_m_name,Emp_l_name,Addline1,Addline2,city) values('E008','job8','fname8','mname8','lname8','addline1A8','addline2B8','city8');
insert into employee(Employee_ID,jobtitle,Emp_f_name,Emp_m_name,Emp_l_name,Addline1,Addline2,city) values('E009','job9','fname9','mname9','lname9','addline1A9','addline2B9','city9');
insert into employee(Employee_ID,jobtitle,Emp_f_name,Emp_m_name,Emp_l_name,Addline1,Addline2,city) values('E010','job10','fname10','mname10','lname10','addline1A10','addline2B10','city10');

/*specialist table*/
insert into specialist(Specialist_ID,Employee_ID) values('S001','E001');
insert into specialist(Specialist_ID,Employee_ID) values('S002','E002');
insert into specialist(Specialist_ID,Employee_ID) values('S003','E003');
insert into specialist(Specialist_ID,Employee_ID) values('S004','E004');
insert into specialist(Specialist_ID,Employee_ID) values('S005','E005');
insert into specialist(Specialist_ID,Employee_ID) values('S006','E006');
insert into specialist(Specialist_ID,Employee_ID) values('S007','E007');
insert into specialist(Specialist_ID,Employee_ID) values('S008','E008');
insert into specialist(Specialist_ID,Employee_ID) values('S009','E009');
insert into specialist(Specialist_ID,Employee_ID) values('S010','E010');


/*ProblemType table*/
insert into ProblemType(Problem_type_ID,Problem_type_name) values('PT01','name1');
insert into ProblemType(Problem_type_ID,Problem_type_name) values('PT02','name2');
insert into ProblemType(Problem_type_ID,Problem_type_name) values('PT03','name3');
insert into ProblemType(Problem_type_ID,Problem_type_name) values('PT04','name4');
insert into ProblemType(Problem_type_ID,Problem_type_name) values('PT05','name5');
insert into ProblemType(Problem_type_ID,Problem_type_name) values('PT06','name6');
insert into ProblemType(Problem_type_ID,Problem_type_name) values('PT07','name7');
insert into ProblemType(Problem_type_ID,Problem_type_name) values('PT08','name8');
insert into ProblemType(Problem_type_ID,Problem_type_name) values('PT09','name9');
insert into ProblemType(Problem_type_ID,Problem_type_name) values('PT10','name10');


/*Equipment table*/
insert into Equipment(Equipment_ID,Equipment_name,equipment_description,date_acquired,date_disposal,Employee_ID) values('EQ01','Equipment1','description1',0000-00-00,9999-12-30,'E001');
insert into Equipment(Equipment_ID,Equipment_name,equipment_description,date_acquired,date_disposal,Employee_ID) values('EQ02','Equipment2','description2',0000-00-00,9999-12-30,'E002');
insert into Equipment(Equipment_ID,Equipment_name,equipment_description,date_acquired,date_disposal,Employee_ID) values('EQ03','Equipment3','description3',0000-00-00,9999-12-30,'E003');
insert into Equipment(Equipment_ID,Equipment_name,equipment_description,date_acquired,date_disposal,Employee_ID) values('EQ04','Equipment4','description4',0000-00-00,9999-12-30,'E004');
insert into Equipment(Equipment_ID,Equipment_name,equipment_description,date_acquired,date_disposal,Employee_ID) values('EQ05','Equipment5','description5',0000-00-00,9999-12-30,'E005');
insert into Equipment(Equipment_ID,Equipment_name,equipment_description,date_acquired,date_disposal,Employee_ID) values('EQ06','Equipment6','description6',0000-00-00,9999-12-30,'E006');
insert into Equipment(Equipment_ID,Equipment_name,equipment_description,date_acquired,date_disposal,Employee_ID) values('EQ07','Equipment7','description7',0000-00-00,9999-12-30,'E007');
insert into Equipment(Equipment_ID,Equipment_name,equipment_description,date_acquired,date_disposal,Employee_ID) values('EQ08','Equipment8','description8',0000-00-00,9999-12-30,'E008');
insert into Equipment(Equipment_ID,Equipment_name,equipment_description,date_acquired,date_disposal,Employee_ID) values('EQ09','Equipment9','description9',0000-00-00,9999-12-30,'E009');
insert into Equipment(Equipment_ID,Equipment_name,equipment_description,date_acquired,date_disposal,Employee_ID) values('EQ10','Equipment10','description10',0000-00-00,9999-12-30,'E010');


/*Problem table*/
insert into Problem(Problem_ID,Problem_description,Problem_type_ID,Equipment_ID) values('P001','description1','PT01','EQ01');
insert into Problem(Problem_ID,Problem_description,Problem_type_ID,Equipment_ID) values('P002','description2','PT02','EQ02');
insert into Problem(Problem_ID,Problem_description,Problem_type_ID,Equipment_ID) values('P003','description3','PT03','EQ03');
insert into Problem(Problem_ID,Problem_description,Problem_type_ID,Equipment_ID) values('P004','description4','PT04','EQ04');
insert into Problem(Problem_ID,Problem_description,Problem_type_ID,Equipment_ID) values('P005','description5','PT05','EQ05');
insert into Problem(Problem_ID,Problem_description,Problem_type_ID,Equipment_ID) values('P006','description6','PT06','EQ06');
insert into Problem(Problem_ID,Problem_description,Problem_type_ID,Equipment_ID) values('P007','description7','PT07','EQ07');
insert into Problem(Problem_ID,Problem_description,Problem_type_ID,Equipment_ID) values('P008','description8','PT08','EQ08');
insert into Problem(Problem_ID,Problem_description,Problem_type_ID,Equipment_ID) values('P009','description9','PT09','EQ09');
insert into Problem(Problem_ID,Problem_description,Problem_type_ID,Equipment_ID) values('P010','description10','PT10','EQ10');



/*caller table*/
insert into caller(Caller_ID,Employee_ID) values('C001','E001');
insert into caller(Caller_ID,Employee_ID) values('C002','E002');
insert into caller(Caller_ID,Employee_ID) values('C003','E003');
insert into caller(Caller_ID,Employee_ID) values('C004','E004');
insert into caller(Caller_ID,Employee_ID) values('C005','E005');
insert into caller(Caller_ID,Employee_ID) values('C006','E006');
insert into caller(Caller_ID,Employee_ID) values('C007','E007');
insert into caller(Caller_ID,Employee_ID) values('C008','E008');
insert into caller(Caller_ID,Employee_ID) values('C009','E009');
insert into caller(Caller_ID,Employee_ID) values('C010','E010');


/*Operator table*/
insert into Operator(Operator_ID,Employee_ID) values('O001','E001');
insert into Operator(Operator_ID,Employee_ID) values('O002','E002');
insert into Operator(Operator_ID,Employee_ID) values('O003','E003');
insert into Operator(Operator_ID,Employee_ID) values('O004','E004');
insert into Operator(Operator_ID,Employee_ID) values('O005','E005');
insert into Operator(Operator_ID,Employee_ID) values('O006','E006');
insert into Operator(Operator_ID,Employee_ID) values('O007','E007');
insert into Operator(Operator_ID,Employee_ID) values('O008','E008');
insert into Operator(Operator_ID,Employee_ID) values('O009','E009');
insert into Operator(Operator_ID,Employee_ID) values('O010','E010');


/*Skill table*/
insert into Skill(Skill,Skill_description) values('skill1','description1');
insert into Skill(Skill,Skill_description) values('skill2','description2');
insert into Skill(Skill,Skill_description) values('skill3','description3');
insert into Skill(Skill,Skill_description) values('skill4','description4');
insert into Skill(Skill,Skill_description) values('skill5','description5');
insert into Skill(Skill,Skill_description) values('skill6','description6');
insert into Skill(Skill,Skill_description) values('skill7','description7');
insert into Skill(Skill,Skill_description) values('skill8','description8');
insert into Skill(Skill,Skill_description) values('skill9','description9');
insert into Skill(Skill,Skill_description) values('skill10','description10');




/*Specialistskill table*/
insert into Specialistskill (Skill,Specialist_ID) values('skill1','S001');
insert into Specialistskill (Skill,Specialist_ID) values('skill2','S001');
insert into Specialistskill (Skill,Specialist_ID) values('skill3','S001');
insert into Specialistskill (Skill,Specialist_ID) values('skill4','S001');
insert into Specialistskill (Skill,Specialist_ID) values('skill5','S001');
insert into Specialistskill (Skill,Specialist_ID) values('skill6','S001');
insert into Specialistskill (Skill,Specialist_ID) values('skill7','S001');
insert into Specialistskill (Skill,Specialist_ID) values('skill8','S001');
insert into Specialistskill (Skill,Specialist_ID) values('skill9','S001');
insert into Specialistskill (Skill,Specialist_ID) values('skill10','S001'); 




/*Priority table*/
insert into Priority (Priority_no,Priority_description,Problem_ID) values('no1','description1','P001');
insert into Priority (Priority_no,Priority_description,Problem_ID) values('no2','description2','P002');
insert into Priority (Priority_no,Priority_description,Problem_ID) values('no3','description3','P003');
insert into Priority (Priority_no,Priority_description,Problem_ID) values('no4','description4','P004');
insert into Priority (Priority_no,Priority_description,Problem_ID) values('no5','description5','P005');
insert into Priority (Priority_no,Priority_description,Problem_ID) values('no6','description6','P006');
insert into Priority (Priority_no,Priority_description,Problem_ID) values('no7','description7','P007');
insert into Priority (Priority_no,Priority_description,Problem_ID) values('no8','description8','P008');
insert into Priority (Priority_no,Priority_description,Problem_ID) values('no9','description9','P009');
insert into Priority (Priority_no,Priority_description,Problem_ID) values('no10','description10','P010');


/*ProblemHistory table*/
insert into ProblemHistory(Problem_history_ID,fix_datetime,Descriptions,Problem_ID) values('PH01',2017-03-03,'description1','P001');
insert into ProblemHistory(Problem_history_ID,fix_datetime,Descriptions,Problem_ID) values('PH02',2017-03-03,'description2','P002');
insert into ProblemHistory(Problem_history_ID,fix_datetime,Descriptions,Problem_ID) values('PH03',2017-03-03,'description3','P003');
insert into ProblemHistory(Problem_history_ID,fix_datetime,Descriptions,Problem_ID) values('PH04',2017-03-03,'description4','P004');
insert into ProblemHistory(Problem_history_ID,fix_datetime,Descriptions,Problem_ID) values('PH05',2017-03-03,'description5','P005');
insert into ProblemHistory(Problem_history_ID,fix_datetime,Descriptions,Problem_ID) values('PH06',2017-03-03,'description6','P006');
insert into ProblemHistory(Problem_history_ID,fix_datetime,Descriptions,Problem_ID) values('PH07',2017-03-03,'description7','P007');
insert into ProblemHistory(Problem_history_ID,fix_datetime,Descriptions,Problem_ID) values('PH08',2017-03-03,'description8','P008');
insert into ProblemHistory(Problem_history_ID,fix_datetime,Descriptions,Problem_ID) values('PH09',2017-03-03,'description9','P009');
insert into ProblemHistory(Problem_history_ID,fix_datetime,Descriptions,Problem_ID) values('PH10',2017-03-03,'description10','P0010');




/*UseSoftware table*/
insert into UseSoftware(Software_type,Software_need) values('type1','need1');
insert into UseSoftware(Software_type,Software_need) values('type2','need2');
insert into UseSoftware(Software_type,Software_need) values('type3','need3');
insert into UseSoftware(Software_type,Software_need) values('type4','need4');
insert into UseSoftware(Software_type,Software_need) values('type5','need5');
insert into UseSoftware(Software_type,Software_need) values('type6','need6');
insert into UseSoftware(Software_type,Software_need) values('type7','need7');
insert into UseSoftware(Software_type,Software_need) values('type8','need8');
insert into UseSoftware(Software_type,Software_need) values('type9','need9');
insert into UseSoftware(Software_type,Software_need) values('type10','need10');



/*Software table*/
insert into software(Software_ID,Software_name,Software_type,Software_serial,versions,licence,Equipment_ID) values('S001','software1','type1','serial1','version1','li1','EQ01');
insert into software(Software_ID,Software_name,Software_type,Software_serial,versions,licence,Equipment_ID) values('S002','software2','type2','serial2','version2','li2','EQ02');
insert into software(Software_ID,Software_name,Software_type,Software_serial,versions,licence,Equipment_ID) values('S003','software3','type3','serial3','version3','li3','EQ03');
insert into software(Software_ID,Software_name,Software_type,Software_serial,versions,licence,Equipment_ID) values('S004','software4','type4','serial4','version4','li4','EQ04');
insert into Software(Software_ID,Software_name,Software_type,Software_serial,versions,licence,Equipment_ID) values('S005','software5','type5','serial5','version5','li5','EQ05');
insert into Software(Software_ID,Software_name,Software_type,Software_serial,versions,licence,Equipment_ID) values('S006','software6','type6','serial6','version6','li6','EQ06');
insert into Software(Software_ID,Software_name,Software_type,Software_serial,versions,licence,Equipment_ID) values('S007','software7','type7','serial7','version7','li7','EQ07');
insert into Software(Software_ID,Software_name,Software_type,Software_serial,versions,licence,Equipment_ID) values('S008','software8','type8','serial8','version8','li8','EQ08');
insert into Software(Software_ID,Software_name,Software_type,Software_serial,versions,licence,Equipment_ID) values('S009','software9','type9','serial9','version9','li9','EQ09');
insert into Software(Software_ID,Software_name,Software_type,Software_serial,versions,licence,Equipment_ID) values('S010','software10','type10','serial10','version10','li10','EQ10');


/*TypeHardware table*/
insert into TypeHardware(Hardware_name,Hardware_Type) values('name1','type1');
insert into TypeHardware(Hardware_name,Hardware_Type) values('name2','type2');
insert into TypeHardware(Hardware_name,Hardware_Type) values('name3','type3');
insert into TypeHardware(Hardware_name,Hardware_Type) values('name4','type4');
insert into TypeHardware(Hardware_name,Hardware_Type) values('name5','type5');
insert into TypeHardware(Hardware_name,Hardware_Type) values('name6','type6');
insert into TypeHardware(Hardware_name,Hardware_Type) values('name7','type7');
insert into TypeHardware(Hardware_name,Hardware_Type) values('name8','type8');
insert into TypeHardware(Hardware_name,Hardware_Type) values('name9','type9');
insert into TypeHardware(Hardware_name,Hardware_Type) values('name10','type10');



/*Hardware table*/
insert into Hardware(Hardware_ID,Hardware_name,Manufacture_name,Hardware_serial,Equipment_ID) values('H001','name1','Mname1','serial1','EQ01');
insert into Hardware(Hardware_ID,Hardware_name,Manufacture_name,Hardware_serial,Equipment_ID) values('H002','name2','Mname2','serial2','EQ02');
insert into Hardware(Hardware_ID,Hardware_name,Manufacture_name,Hardware_serial,Equipment_ID) values('H003','name3','Mname3','serial3','EQ03');
insert into Hardware(Hardware_ID,Hardware_name,Manufacture_name,Hardware_serial,Equipment_ID) values('H004','name4','Mname4','serial4','EQ04');
insert into Hardware(Hardware_ID,Hardware_name,Manufacture_name,Hardware_serial,Equipment_ID) values('H005','name5','Mname5','serial5','EQ05');
insert into Hardware(Hardware_ID,Hardware_name,Manufacture_name,Hardware_serial,Equipment_ID) values('H006','name6','Mname6','serial6','EQ06');
insert into Hardware(Hardware_ID,Hardware_name,Manufacture_name,Hardware_serial,Equipment_ID) values('H007','name7','Mname7','serial7','EQ07');
insert into Hardware(Hardware_ID,Hardware_name,Manufacture_name,Hardware_serial,Equipment_ID) values('H008','name8','Mname8','serial8','EQ08');
insert into Hardware(Hardware_ID,Hardware_name,Manufacture_name,Hardware_serial,Equipment_ID) values('H009','name9','Mname9','serial9','EQ09');
insert into Hardware(Hardware_ID,Hardware_name,Manufacture_name,Hardware_serial,Equipment_ID) values('H010','name10','Mname10','serial10','EQ10');


/*Call table*/
insert into calls(Operator_ID,caller_ID) values('O001','C001');
insert into calls(Operator_ID,caller_ID) values('O002','C002');
insert into calls(Operator_ID,caller_ID) values('O003','C003');
insert into calls(Operator_ID,caller_ID) values('O004','C004');
insert into calls(Operator_ID,caller_ID) values('O005','C005');
insert into calls(Operator_ID,caller_ID) values('O006','C006');
insert into calls(Operator_ID,caller_ID) values('O007','C007');
insert into calls(Operator_ID,caller_ID) values('O008','C008');
insert into calls(Operator_ID,caller_ID) values('O009','C009');
insert into calls(Operator_ID,caller_ID) values('O010','C010');


/*Report table*/
insert into Report(Operator_ID,Problem_ID,report_datetime) values('O001','P001',2017-03-04);
insert into Report(Operator_ID,Problem_ID,report_datetime) values('O002','P002',2017-03-04);
insert into Report(Operator_ID,Problem_ID,report_datetime) values('O003','P003',2017-03-04);
insert into Report(Operator_ID,Problem_ID,report_datetime) values('O004','P004',2017-03-04);
insert into Report(Operator_ID,Problem_ID,report_datetime) values('O005','P005',2017-03-04);
insert into Report(Operator_ID,Problem_ID,report_datetime) values('O006','P006',2017-03-04);
insert into Report(Operator_ID,Problem_ID,report_datetime) values('O007','P007',2017-03-04);
insert into Report(Operator_ID,Problem_ID,report_datetime) values('O008','P008',2017-03-04);
insert into Report(Operator_ID,Problem_ID,report_datetime) values('O009','P009',2017-03-04);
insert into Report(Operator_ID,Problem_ID,report_datetime) values('O010','P010',2017-03-04);



/*ReferSpecialist table*/
insert into ReferSpecialist(Problem_Type_ID,Specialist_ID) values('PT01','S001');
insert into ReferSpecialist(Problem_Type_ID,Specialist_ID) values('PT02','S002');
insert into ReferSpecialist(Problem_Type_ID,Specialist_ID) values('PT03','S003');
insert into ReferSpecialist(Problem_Type_ID,Specialist_ID) values('PT04','S004');
insert into ReferSpecialist(Problem_Type_ID,Specialist_ID) values('PT05','S005');
insert into ReferSpecialist(Problem_Type_ID,Specialist_ID) values('PT06','S006');
insert into ReferSpecialist(Problem_Type_ID,Specialist_ID) values('PT07','S007');
insert into ReferSpecialist(Problem_Type_ID,Specialist_ID) values('PT08','S008');
insert into ReferSpecialist(Problem_Type_ID,Specialist_ID) values('PT09','S009');
insert into ReferSpecialist(Problem_Type_ID,Specialist_ID) values('PT10','S010');


/*CallProblem table*/
insert into CallProblem (Caller_ID,Problem_ID) values('C001','P001');
insert into CallProblem (Caller_ID,Problem_ID) values('C002','P002');
insert into CallProblem (Caller_ID,Problem_ID) values('C003','P003');
insert into CallProblem (Caller_ID,Problem_ID) values('C004','P004');
insert into CallProblem (Caller_ID,Problem_ID) values('C005','P005');
insert into CallProblem (Caller_ID,Problem_ID) values('C006','P006');
insert into CallProblem (Caller_ID,Problem_ID) values('C007','P007');
insert into CallProblem (Caller_ID,Problem_ID) values('C008','P008');
insert into CallProblem (Caller_ID,Problem_ID) values('C009','P009');
insert into CallProblem (Caller_ID,Problem_ID) values('C010','P010');


/*EmpContact table*/
insert into EmpContact(Phone_number,Employee_ID) values(0112846464,'E001');
insert into EmpContact(Phone_number,Employee_ID) values(0112465666,'E002');
insert into EmpContact(Phone_number,Employee_ID) values(0112523233,'E003');
insert into EmpContact(Phone_number,Employee_ID) values(0112855656,'E004');
insert into EmpContact(Phone_number,Employee_ID) values(0112687754,'E005');
insert into EmpContact(Phone_number,Employee_ID) values(0112843545,'E006');
insert into EmpContact(Phone_number,Employee_ID) values(0112889534,'E007');
insert into EmpContact(Phone_number,Employee_ID) values(0112676755,'E008');
insert into EmpContact(Phone_number,Employee_ID) values(0112865676,'E009');
insert into EmpContact(Phone_number,Employee_ID) values(0112842138,'E010');


/* checking caller id and reveiling employee details */

select caller.caller_ID,employee.employee_ID,empjob.jobtitle,empjob.department
from caller 
join employee on caller.employee_ID=employee.employee_ID
join empjob on employee.jobtitle=empjob.jobtitle
where Caller_ID='C005'


/* checking against a register of equipment to find the equipment type and make  */

select hardware.manufacture_name,typehardware.hardware_type
from hardware
join typehardware on hardware.hardware_name=typehardware.hardware_name
where hardware_serial='serial2'


/* The software will be checked to see if it is licensed software */

select licence
from software
where software_name='software3'

/*   look up previous problems of the same type to see if the problem has occurred before and if so how was it resolved */

select problemhistory.problem_history_id,problemhistory.descriptions,problemhistory.fix_datetime
from problemtype
join problem on problemtype.problem_type_id=problem.problem_type_id
join problemhistory on problemhistory.problem_ID=problem.problem_ID
where problem_type_name='name3'

/*  look up previous problems with the same equipment or from the same caller to see if there were other related problems */

select problemhistory.problem_history_id,problemhistory.descriptions,problemhistory.fix_datetime
from equipment
join problem on equipment.equipment_id=problem.equipment_id
join problemhistory on problemhistory.problem_id=problem.problem_id
join callproblem on callproblem.problem_id=problem.problem_id
where caller_id='C003' or equipment.equipment_id='EQ03'



/* specialist for problemtype */


select specialist.Specialist_ID,employee.Emp_f_name,employee.Emp_m_name,employee.Emp_l_name
from referspecialist
join problemtype on problemtype.Problem_Type_ID=ReferSpecialist.Problem_Type_ID
join Specialist on ReferSpecialist.Specialist_ID=Specialist.Specialist_ID
join employee on Specialist.employee_id=employee.Employee_ID
where problem_type_name='name4'

/*  no of problems currently working on */

select count(problem.problem_id) as 'no.of problems working on'
from referspecialist 
join problem on referspecialist.Problem_Type_ID=problem.Problem_Type_ID
where specialist_id='s008'
