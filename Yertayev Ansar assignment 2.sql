1)
CREATE TABLE Driver();
CREATE TABLE Ambulance_service();
CREATE TABLE Hospitals();
CREATE TABLE Hospital_medicaments();
CREATE TABLE Medical_treatments();
CREATE TABLE Specialization();
CREATE TABLE Doctor();
CREATE TABLE appointment();
CREATE TABLE Patient();
CREATE TABLE Disease();
CREATE TABLE Bill();

2)
ALTER TABLE Driver
ADD driver_id INT,
ADD driver_f_name VARCHAR,
ADD driver_l_name VARCHAR;
3)
ALTER TABLE Ambulance_service 
ADD ambulance_id INT,
ADD ambulance_service_name VARCHAR;
4)
ALTER TABLE Hospitals
ADD hospital_id INT,
ADD hospital_name VARCHAR,
ADD hospital_address VARCHAR,
ADD town VARCHAR,
ADD hospital_status VARCHAR;
5)
ALTER TABLE Medical_treatments
ADD medicament_id INT,
ADD medicament_name VARCHAR;
6)
ALTER TABLE Specialization 
ADD specialization_id INT,
ADD spzltn_name VARCHAR;
7)
ALTER TABLE Doctor
ADD doctor_id INT,
ADD dc_f_name VARCHAR,
ADD dc_l_name VARCHAR,
ADD dc_gender VARCHAR,
ADD dc_bith_of_date DATE;
8)
ALTER TABLE appointment
ADD appointment_id INT,
ADD appointment_date DATE;
9)
ALTER TABLE Patient
ADD patient_id INT,
ADD ptn_f_name VARCHAR,
ADD ptn_l_name VARCHAR,
ADD ptn_gender VARCHAR;
10)
ALTER TABLE Disease
ADD disease_id INT,
ADD disease_name VARCHAR;
11)
ALTER TABLE Bill
ADD bill_id INT,
ADD bill_price INT;
12)
ALTER TABLE Driver 
ADD PRIMARY KEY (driver_id);

ALTER TABLE Ambulance_service
ADD PRIMARY KEY (ambulance_id);

ALTER TABLE Hospitals
ADD PRIMARY KEY (hospital_id);

ALTER TABLE Medical_treatments
ADD PRIMARY KEY (medicament_id);

ALTER TABLE Specialization
ADD PRIMARY KEY (specialization_id);

ALTER TABLE Doctor
ADD PRIMARY KEY (doctor_id);

ALTER TABLE appointment
ADD PRIMARY KEY (appointment_id);

ALTER TABLE Patient
ADD PRIMARY KEY (patient_id);

ALTER TABLE Disease
ADD PRIMARY KEY (disease_id);

ALTER TABLE Bill
ADD PRIMARY KEY (bill_id);
13)
 a)
   ALTER TABLE Ambulance_service (First of all we need to add driver_id in ambulance_service table) 
   ADD driver_id INT;
   

   ALTER TABLE Ambulance_service 
   ADD FOREIGN KEY (driver_id) REFERENCES Driver (driver_id)
 b)
   ALTER TABLE Ambulance_service
   ADD hospital_id INT;

   ALTER TABLE Ambulance_service 
   ADD FOREIGN KEY (hospital_id) REFERENCES Hospitals (hospital_id)
 c)
   ALTER TABLE hospital_medicaments
   ADD hospital_id INT;

   ALTER TABLE hospital_medicaments 
   ADD FOREIGN KEY (hospital_id) REFERENCES Hospitals (hospital_id)
 d)
   ALTER TABLE hospital_medicaments
   ADD medicament_id INT;

   ALTER TABLE hospital_medicaments 
   ADD FOREIGN KEY (medicament_id) REFERENCES Medical_treatments (medicament_id)
 e) 
   ALTER TABLE Doctor
   ADD specialization_id INT;
   
   ALTER TABLE Doctor
   ADD FOREIGN KEY (specialization_id) REFERENCES Specialization (specialization_id)
 f)
   ALTER TABLE Appointment
   ADD doctor_id INT;

   ALTER TABLE Hospitals
   ADD doctor_id INT;

   ALTER TABLE Appointment
   ADD FOREIGN KEY (doctor_id) REFERENCES Doctor (doctor_id)
   
   ALTER TABLE Hospitals
   ADD FOREIGN KEY (doctor_id) REFERENCES Doctor (doctor_id)
 g)
   ALTER TABLE Appointment
   ADD patient_id INT,
   ADD disease_id INT,
   ADD bill_id INT;
   
   ALTER TABLE Appointment
   ADD FOREIGN KEY (patient_id) REFERENCES Patient (patient_id),
   ADD FOREIGN KEY (disease_id) REFERENCES Disease (disease_id),
   ADD FOREIGN KEY (bill_id) REFERENCES Bill (bill_id);
14)
ALTER TABLE Medical_treatments 
RENAME TO Medicaments

ALTER TABLE Ambulance_service
RENAME TO Ambulance
15)
ALTER TABLE Ambulance
DROP COLUMN ambulance_service_name;

   
   