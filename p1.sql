-- Domains for similar column in each table --

create domain "name" AS varchar(20);

create domain "date" AS DATE
   constraint valid_date check (value > '2023-01-01');
   
create domain "username" AS varchar(20);

create domain "password" AS varchar(10)
	constraint pass check (length(value) <=5);
	
create domain phone AS char(10)
	constraint valid_phone check (value ~ '^\+?[0-9]{10,15}$');
	
create domain address AS varchar(50);

create domain email AS varchar(25)
	constraint valid_email check (value like '%_@__%.__%');




-- Domain for Admin table--

create domain "adminid" AS int;


-- Domain for Student table--

create domain "stdid" AS int;

-- Domain for Course table--

create domain "crs_id" AS varchar(25);
create domain "coursecredit" AS int;

-- Domain for Subject table --

create domain "subid" AS int;

-- Domain for Instructor table --

create domain "insid" AS int;

-- Domain for Department table --

create domain "deptid" AS int;

-- Domain for Attendance table --

create domain "attid" AS int;
create domain "status" AS varchar(10);

-- Domain for Schedule table --

create domain "schid" AS int;

-- Domain for Exam table --

create domain "examid" AS int;
create domain "grade" AS char(5);

-- Domain for Advisor --

create domain "advid" AS int;

-- Domain for Notification table --

create domain "nftid" AS int;
create domain "nfttxt" AS varchar(50);

-- Domain for Evaluation table --
create domain "evalid" AS int;
create domain "evaltxt" AS varchar(50);

-- Domain for Payment table --
create domain "payid" AS int;
create domain "p_amount" AS int;



create table admin
( admin_id adminid,
a_name "name" NOT null,
a_date "date",
a_username "username" NOT NULL,
a_password "password" NOT NULL,
primary key(admin_id));


create table student
( std_id stdid,
s_name "name" NOT null,
s_phone "phone",
s_address "address",
s_email "email",
s_username "username" NOT NULL,
s_password "password" NOT NULL,
primary key(std_id));


create table course
(course_id crs_id,
course_name "name",
course_credit "coursecredit",
dept_id deptid,
primary key(course_id),
foreign key(dept_id) references department(dept_id) on delete cascade on update cascade);


create table department
(dept_id deptid,
deptname "name",
primary key(dept_id));

create table subject
( sub_id subid,
subname "name",
std_id stdid,
course_id crs_id,
instructor_id insid,
exam_id examid,
primary key (sub_id),
foreign key(std_id) references student(std_id) ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(course_id) references course(course_id) ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(instructor_id) references instructor(instructor_id) ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(exam_id) references exam(exam_id) ON DELETE CASCADE ON UPDATE CASCADE);


create table instructor
(instructor_id insid,
instructorname "name",
instphone "phone",
insemail "email",
dept_id deptid,
primary key (instructor_id),
foreign key(dept_id) references department(dept_id) ON DELETE CASCADE ON UPDATE CASCADE);

create table exam
(exam_id examid,
examdate "date",
examgrade "grade",
std_id "stdid",
primary key(exam_id),
foreign key(std_id) references student(std_id) ON DELETE CASCADE ON UPDATE CASCADE);

create table attendence
( attend_id attid,
at_date "date",
at_status "status",
std_id "stdid",
course_id "crs_id",
primary key (attend_id),
foreign key (std_id) references student(std_id) on delete cascade on update cascade,
foreign key(course_id) references course(course_id) ON DELETE CASCADE ON UPDATE CASCADE);

create table schedule
(schedule_id schid,
course_id "crs_id",
instructor_id "insid",
primary key(schedule_id),
foreign key(course_id) references course(course_id) ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(instructor_id) references instructor(instructor_id) ON DELETE CASCADE ON UPDATE CASCADE);


create table notification
(notification_id nftid,
notificationtext "nfttxt",
datesent "date",
instructor_id "insid",
primary key(notification_id),
foreign key(instructor_id) references instructor(instructor_id) ON DELETE CASCADE ON UPDATE CASCADE);


create table payment
(pay_id payid,
amount "p_amount",
paymentdate "date",
std_id "stdid",
course_id "crs_id",
primary key(pay_id),
foreign key (std_id) references student(std_id) on delete cascade on update cascade,
foreign key(course_id) references course(course_id) ON DELETE CASCADE ON UPDATE CASCADE);

create table advisor(
advisor_id advid,
advisorname "name",
std_id "stdid",
primary key (advisor_id),
foreign key (std_id) references student(std_id) on delete cascade on update cascade);

create table evaluation(
evaluation_id evalid,
evaluationtext "evaltxt",
std_id "stdid",
instructor_id "insid",
primary key (evaluation_id),
foreign key (std_id) references student(std_id) on delete cascade on update cascade,
foreign key (instructor_id) references instructor(instructor_id) ON DELETE CASCADE ON UPDATE CASCADE);



--- Insert tuples in tables---

insert into admin(admin_id, a_name, a_date, a_username, a_password)
values 
(01,'shiv','2023-01-05','shiv0369','shiv0'),
(02,'vedant','2023-02-05','vedant0369','veda3'),
(03,'milan','2023-01-11','milan0369','mila6'),
(04,'meet','2024-04-24','meet0369','meet9'),
(05,'shreyash','2024-01-10','shrey0369','shre0'),
(06,'darshan','2025-01-09','darshan0369','dars3'),
(07,'chintu','2023-04-28','chintu0369','chin6'),
(08,'aman','2023-06-27','aman0369','aman9'),
(09,'ayush','2023-05-07','ayush0369','ayus0'),
(10,'akash','2024-08-09','akash0369','akas3');


























