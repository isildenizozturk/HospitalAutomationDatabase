CREATE DATABASE Hospital_Automation
Go
USE Hospital_Automation
Go

Create Table Patients -- Hasta
(
	PatientID int primary key identity(1,1) not null,
	First_Name nvarchar(50) not null,
	Last_Name nvarchar(50) not null,
	Citizenship_Number int not null,
	Insurance_Id int not null,
	Gender nvarchar(15) not null,
	DateOfBirth Datetime not null,
)
Go
Create Table PatientDetail -- Hasta Detay
(
	PatientDetailID int primary key not null,
	Phone nvarchar(15) not null,
	Address1 nvarchar(100) not null,
	Address2 nvarchar(100) not null,
	File_No nvarchar(100) not null,
	Patient_Type_Id int not null
)

GO
Create Table Polyclinics -- Poliklinikler
(
	Polyclinic_Id int primary key identity(1,1) not null,
	Polyclinics_Name nvarchar(50) NOT NULL,
	Active bit not null
)

GO
Create Table Nurse -- Hemþire
(
	NurseID int primary key identity(1,1) not null,
	--Polyclinic_Id int not null, +
	Citizenship_Number int not null,
	First_Name nvarchar(50) not null,
	Last_Name nvarchar(50) not null,
	Phone nvarchar(15) not null,
	Email nvarchar(100) not null,                   
	Address nvarchar(250) not null,
	Active bit not null
)

GO
Create Table Doctors -- Doktorlar
(
	DoctorID int primary key identity(1,1) not null,
	--Polyclinic_Id int not null, +
	Citizenship_Number int not null,
	First_Name nvarchar(50) not null,
	Last_Name nvarchar(50) not null,
	Title nvarchar(50) not null,
	--BranchID int not null,
	Phone nvarchar(15) not null,
	Email nvarchar(100) not null,
	Address nvarchar(250) not null,
	Active bit not null
)
GO
Create Table Branches -- Branþlar
(
	BranchID int primary key identity(1,1) not null,
	Branch_Name nvarchar(50) not null,
)

GO
Create Table Appointment -- Randevu
(
	AppointmentID int primary key identity(1,1) not null,
	--PatientID int not null, +
	Appointment_Date datetime not null,
	Appointment_Time time not null,
	--PolyclinicID int not null, + 
	--DoctorID int not null, +
)

GO
Create Table Insurance -- Sigorta
(
	Insurance_Id int primary key not null,
	Insurance_Name nvarchar(50) not null,
	Insurance_Owner nvarchar(50) not null,
)
GO
Create Table Medicines -- Ýlaçlar
(
	MedicineID int primary key not null,
	Medicine_Name nvarchar(100) not null,
	SGK int not null,
	Price decimal(18,2) not null
)
GO
Create Table Prescription -- Reçete
(
	PrescriptionID int primary key not null,
	Prescription_No int not null,
	--PatientID int not null, +
)
GO
Create Table Prescription_Medicine -- Reçete Ýlaç,  Ara Tablo Reçete-Ýlaç
(
	MedicineID int not null,
	PrescriptionID int not null,
	primary key(MedicineID, PrescriptionID)
)

GO
Create Table Examination -- Muayene
(
	ExaminationID int primary key not null,
	Examination_Date datetime not null,
)
Go
Create Table Lab_Test -- Laboratuvar Testleri
(
	Lab_TestID int primary key identity(1,1) not null,
	Test_Name nvarchar(100) not null,	
)
Create Table Lab_Result -- Hasta Laboratuvar Sonuçlarý
(
	Lab_ResultID int primary key not null,
	--PatientID int not null, +
)
GO
Create table Examination_LabTest -- Muayene Lab Test Ara Tablo
(
	Lab_TestID int not null,
	Examination_ID int not null,
	primary key(Lab_TestID, Examination_ID)
)
GO
Create Table Rad_Test -- Radioloji Testleri
(
	Rad_TestID int primary key identity(1,1) not null,
	Test_Name nvarchar(100) not null,
	Test_Quantity int not null,
)
GO
Create Table Rad_Result -- Hasta Radyoloji Sonuçlarý
(
	Rad_ResultID int primary key not null,
	--PatientID int not null, +
)
GO
Create table Examination_RadTest -- Muayene Rad Test Ara Tablo
(
	Rad_TestID int not null,
	Examination_ID int not null,
	primary key(Rad_TestID, Examination_ID)
)
Go
Create Table Surgery_Room -- Ameliyathane
(
	Surgery_RoomID int primary key identity(1,1) not null,
	Surgery_Room_Floor int not null,
)
GO
Create Table Surgery -- Ameliyat
(
	Surgery_ID int primary key identity(1,1) not null,
	Surgery_Name nvarchar(100) not null,
	--PatientID int not null, +
	--DoctorID int not null, +
	--NurseID int not null, + 
	Surgery_Date datetime not null,
	--Surgery_RoomID int not null,
	--AdmissionID int not null,
)
GO
Create Table Patient_Admission -- Hasta Yatýþ 
(
	AdmissionID int primary key not null,
	--Service_ID int  null, + 
	Begin_Date datetime null,
	Active bit not null
)
GO
Create Table Patient_Accompanist -- Hasta Refakatçi
(
	Patient_AccompanistID int primary key not null,
	Citizenship_Number int not null,
	Accompanist_Name nvarchar(50) not null,
	Accompanist_Lastname nvarchar(50) not null,
	Relation int not null,
	Address nvarchar(250) not null,
	Phone nvarchar(15) not null,
	Begin_Date datetime not null,
	End_Date datetime not null
)
GO
Create Table Rooms -- Odalar
(
	Room_Id int primary key identity(1,1) not null,
	Room_Number int not null,
	--Service_Id int not null
)
GO
Create Table Beds -- Yataklar
(
	Bed_Id int primary key identity(1,1) not null,
	Active bit not null,
	Busy bit not null,
	--Room_Id int not null,
)
GO
Create Table Hosp_Services -- Servisler
(
	Service_Id int primary key identity(1,1) not null, 
	Service_Name nvarchar(50) not null,
)
GO
Create Table Patient_Discharge -- Hasta Çýkýþ
(
	Patient_Discharge_ID int primary key not null,
	Discharge_Date datetime not null,
	Feedback nvarchar(250) null
)
GO
Create Table Visit -- Vizite
(
	Visit_ID int primary key identity(1,1) not null,
	--Polyclinic_Id int not null, +
	--DoctorID int not null, + 
	--PatientID int not null, +
	-- NurseID int not null, +
	Visit_Date datetime not null,
	Visit_End_Date datetime null,
)
GO
Create Table Diagnoses -- Taný
(
	DiagnoseID int primary key identity(1,1) not null,
	Diagnose_Code nvarchar(20) not null,
	Diagnose_Name nvarchar(50) not null,
	Active bit not null,
	Admission_Date datetime not null
)

GO
Create Table Visit_Diagnoses -- Vizite Taný, Ara Tablo Taný-Vizite
(
	Visit_ID int not null,
	Diagnose_ID int not null,
	primary key (Visit_ID, Diagnose_ID) 
)
GO
Create table Visit_LabTest -- Vizite Lab Test Ara Tablo
(
	Lab_TestID int not null,
	Visit_ID int not null,
	primary key(Lab_TestID, Visit_ID)
)
Go
Create table Visit_RadTest -- Vizite Rad Test Ara Tablo
(
	Rad_TestID int not null,
	Visit_ID int not null,
	primary key(Rad_TestID, Visit_ID)
)


-- Patient Ýliþkileri

Alter Table PatientDetail add foreign key (PatientDetailID) references Patients(PatientID) 
Alter Table Insurance add foreign key (Insurance_Id) references Patients(PatientID) 

Alter Table Visit add PatientID int not null
Alter Table Visit add foreign key (PatientID) references Patients(PatientID)

Alter Table Appointment add PatientID int not null
Alter Table Appointment add foreign key (PatientID) references Patients(PatientID)

Alter Table Lab_Result add PatientID int not null
Alter Table Lab_Result add foreign key (PatientID) references Patients(PatientID)

Alter Table Rad_Result add PatientID int not null
Alter Table Rad_Result add foreign key (PatientID) references Patients(PatientID)

Alter Table Surgery add PatientID int not null
Alter Table Surgery add foreign key (PatientID) references Patients(PatientID)

Alter Table Prescription add PatientID int not null
Alter Table Prescription add foreign key (PatientID) references Patients(PatientID)


-- Poliklinik Ýliþkiler
Alter Table Nurse add Polyclinic_Id int not null
Alter Table Nurse add foreign key (Polyclinic_Id) references Polyclinics(Polyclinic_Id)

Alter Table Doctors add Polyclinic_Id int not null
Alter Table Doctors add foreign key (Polyclinic_Id) references Polyclinics(Polyclinic_Id)

Alter Table Visit add Polyclinic_Id int not null
Alter Table Visit add foreign key (Polyclinic_Id) references Polyclinics(Polyclinic_Id)

Alter Table Appointment add Polyclinic_Id int not null
Alter Table Appointment add foreign key (Polyclinic_Id) references Polyclinics(Polyclinic_Id)

-- Hemþire Ýliþkiler

Alter Table Visit add NurseID int not null
Alter Table Visit add foreign key (NurseID) references Nurse(NurseID)

Alter Table Surgery add NurseID int not null
Alter Table Surgery add foreign key (NurseID) references Nurse(NurseID)

-- Doktor Ýliþkileri

Alter Table Doctors add BranchID int not null
Alter Table Doctors add foreign key (BranchID) references Branches(BranchID)

Alter Table Appointment add DoctorID int not null
Alter Table Appointment add foreign key (DoctorID) references Doctors(DoctorID)

Alter Table Surgery add DoctorID int not null
Alter Table Surgery add foreign key (DoctorID) references Doctors(DoctorID)

Alter Table Visit add DoctorID int not null
Alter Table Visit add foreign key (DoctorID) references Doctors(DoctorID)

-- Randevu Ýliþkileri
Alter Table Examination add foreign key (ExaminationID) references Appointment(AppointmentID) 


-- Reçete Ýlaç Ara Tablo Ýliþkileri
Alter Table Prescription_Medicine add foreign key (MedicineID) references Medicines(MedicineID)
Alter Table Prescription_Medicine add foreign key (PrescriptionID) references Prescription(PrescriptionID)

-- Muayene Ýliþkileri
Alter Table Prescription add foreign key (PrescriptionID) references Examination(ExaminationID) 

Alter table Examination_LabTest add foreign key (Lab_TestID) references Lab_Test(Lab_TestID) 
Alter table Examination_LabTest add foreign key (Examination_ID) references Examination(ExaminationID) 

Alter table Examination_RadTest add foreign key (Rad_TestID) references Rad_Test(Rad_TestID) 
Alter table Examination_RadTest add foreign key (Examination_ID) references Examination(ExaminationID) 

-- Lab Sonuçlarý - Lab Test Ýliþki

Alter Table Lab_Result add foreign key (Lab_ResultID) references Lab_Test(Lab_TestID) 

-- Rad Sonuçlarý - Rad Test Ýliþki
Alter Table Rad_Result add foreign key (Rad_ResultID) references Rad_Test(Rad_TestID) 

-- Ameliyat Ýliþkileri

Alter Table Surgery add Surgery_RoomID int not null
Alter Table Surgery add foreign key (Surgery_RoomID) references Surgery_Room(Surgery_RoomID)

Alter Table Patient_Admission add foreign key (AdmissionID) references Surgery(Surgery_ID)

-- Hasta Yatýþ - Hasta Refatçi Ýliþki

Alter Table Patient_Accompanist add foreign key (Patient_AccompanistID) references Patient_Admission(AdmissionID)

-- Hasta Yatýþ - Servis Ýliþki

Alter Table Patient_Admission add Service_Id int not null
Alter Table Patient_Admission add foreign key (Service_Id) references Hosp_Services(Service_Id)

-- Servisler - Odalar Ýliþki
Alter Table Rooms add Service_Id int not null
Alter Table Rooms add foreign key (Service_Id) references Hosp_Services(Service_Id)

-- Odalar - Yataklar Ýliþki
Alter Table Beds add Room_Id int not null
Alter Table Beds add foreign key (Room_Id) references Rooms(Room_Id)

-- Hasta Çýkýþ - Vizite Ýliþki

Alter table Patient_Discharge add foreign key (Patient_Discharge_ID) references Visit(Visit_ID) 

--  Vizite - Taný Ara Tablo

Alter table Visit_Diagnoses add foreign key (Diagnose_ID) references Diagnoses(DiagnoseID) 
Alter table Visit_Diagnoses add foreign key (Visit_ID) references Visit(Visit_ID) 

-- Vizite - Lab Test
Alter table Visit_LabTest add foreign key (Lab_TestID) references Lab_Test(Lab_TestID) 
Alter table Visit_LabTest add foreign key (Visit_ID) references Visit(Visit_ID) 

-- Vizite - Rad Test
Alter table Visit_RadTest add foreign key (Rad_TestID) references Rad_Test(Rad_TestID) 
Alter table Visit_RadTest add foreign key (Visit_ID) references Visit(Visit_ID) 

