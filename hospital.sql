create database HospitaldB; 
use HospitaldB;
create table Patient(
			PatientID int primary key IDENTITY(1,1),
			PatientName varchar(255)  not null ,
			Age INT NOT NULL,
			Gender varchar(255) not null,
			PhoneNumber BigInt not null,
			PatientAddress varchar not null,
			
			);
create table Doctor (
			DoctorID int primary key IDENTITY(1,1),
			DoctorName varchar(255)  not null ,
			Age INT NOT NULL,
			Gender varchar(255) not null,
			DoctorNumber BigInt not null,
			Designation varchar(255) NOT NULL, 
		    PatientId INT,
			CONSTRAINT FK_PatientId  FOREIGN KEY (PatientId) REFERENCES Patient(PatientId)
			);

create table Bill (
			BillNo int primary key IDENTITY(1,1),
			DoctorName varchar(255)  not null ,
			PatientID int   FOREIGN KEY REFERENCES Patient(PatientId) not null,
			DoctorId int FOREIGN KEY REFERENCES Doctor(DoctorId) not null,
			Amount int not null,
			);
--alter table patient add BloodGroup nvarchar not null;

/*
alter table  doctor drop constraint fk_patientId;
alter table  patient drop constraint fk_DoctorId;

drop table bill;
drop table Doctor;
drop table Patient;

alter table patient alter column PatientAddress varchar(250);
*/
alter table patient alter column  BloodGroup varchar(250);

insert into Patient (PatientName,Age,Gender,PhoneNumber,PatientAddress,BloodGroup) values('abc',25,'male',236478963,'abcghgj','a+');
insert into Patient(PatientName,Age,Gender,PhoneNumber,PatientAddress,BloodGroup) values('pqr',26,'female',56415466,'iodsnv','b+');

select * from Patient;

update patient 
set age = 30
where  PatientName = 'abc';

delete from patient  where PatientName = 'abc'; 
select min(age) from Patient;
SELECT MAX(age)
FROM patient;

 --The percent sign % represents zero, one, or multiple characters
-- The underscore sign _ represents one, single character
select * from patient where PatientName LIKE '%a%';
select * from patient where AGE BETWEEN 20 AND 30;
select * from patient where BLOODGROUP IN('B+');
select * from patient where BLOODGROUP NOT IN('B+');
SELECT COUNT(*)
FROM PATIENT;
SELECT TOP 3 * FROM PATIENT;
--GRANT SELECT, UPDATE ON patient TO omkar

select top 2*  from patient order by age desc ;
select top 1* from patient where bloodgroup = 'b+' order by age ;

