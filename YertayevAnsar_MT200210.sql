1)
SELECT COUNT(dc_gender) as genders,dc_country,dc_gender
FROM doctor
GROUP BY dc_country,dc_gender
ORDER BY dc_country asc

2)
SELECT appointment.disease_id,COUNT(doctor.dc_gender) as genders,doctor.dc_gender
FROM appointment
JOIN doctor ON appointment.doctor_id=doctor.doctor_id
GROUP BY appointment.disease_id,doctor.dc_gender
ORDER BY appointment.disease_id asc

3)
SELECT driver.ambulance_id,COUNT(driver.driver_id) as drivers,ambulance.hospital_id,COUNT(ambulance.ambulance_id) as ambulance
FROM driver
JOIN ambulance ON driver.ambulance_id=ambulance.ambulance_id
GROUP BY driver.ambulance_id,ambulance.hospital_id
ORDER BY driver.ambulance_id asc

4)
SELECT COUNT(doctor.doctor_id),doctor.hospital_id,hospitals.hospital_status,COUNT(hospitals.hospital_id)
FROM hospitals
JOIN doctor ON hospitals.hospital_id=doctor.hospital_id
GROUP BY hospitals.hospital_status,doctor.hospital_id
ORDER BY hospitals.hospital_status asc

5)
CREATE INDEX pt_phone ON patient(ptnt_phone);

insert into Patient (patient_id, ptn_f_name, ptn_l_name, ptn_gender, ptnt_birth_date, ptnt_phone, 
ptnt_country, ptnt_address) 
values (1212, 'Mikkela', 'Anderson', 'Female', '1985-03-05', '850-163-2365', 'Angola', '567 Nottingham place')

6)
CREATE INDEX dc_idx ON doctor(dc_f_name,dc_l_name,dc_bith_of_date,dc_country); 

SELECT * FROM doctor
WHERE dc_country='China' and dc_bith_of_date>'1979-01-01' and dc_bith_of_date<'1979-12-31'

7)
SELECT * FROM pg_indexes
WHERE tablename NOT LIKE 'pg%' and indexname NOT LIKE 'pk%'

DROP INDEX pt_phone

DROP INDEX dc_idx

8)
CREATE VIEW pt_f AS
SELECT CONCAT(patient.ptn_f_name,' ',patient.ptn_l_name) as fullname,patient.ptnt_country 
FROM appointment
JOIN patient ON appointment.patient_id=patient.patient_id
JOIN doctor ON appointment.doctor_id=doctor.doctor_id 
WHERE doctor.dc_country='Brazil'

9)
CREATE VIEW dc_f AS
SELECT CONCAT(doctor.dc_f_name,' ',doctor.dc_l_name) as fullname,doctor.doctor_id 
FROM appointment
JOIN doctor ON appointment.doctor_id=doctor.doctor_id
JOIN disease ON appointment.disease_id=disease.disease_id 
WHERE disease.disease_name LIKE 'M%'

10)
CREATE VIEW hs_f AS
SELECT doctor.doctor_id,doctor.dc_l_name
FROM doctor
JOIN hospitals ON hospitals.hospital_id=doctor.hospital_id
WHERE doctor.dc_salary<1200 and hospitals.hsptl_country='Colombia'

11)
CREATE OR REPLACE VIEW hs_f AS
SELECT doctor.doctor_id,doctor.dc_l_name
FROM doctor
JOIN hospitals ON hospitals.hospital_id=doctor.hospital_id
WHERE doctor.dc_salary>1200 and hospitals.hsptl_country='France'

12)
SELECT * FROM doctor WHERE dc_salary<1000 and hospital_id%3=0
UNION 
SELECT * FROM doctor WHERE dc_salary>500 and splztn_id%3=0
ORDER BY doctor_id asc

13)
SELECT * FROM hospitals WHERE hospital_address LIKE '4%' and town LIKE '%e' 
INTERSECT 
SELECT * FROM hospitals WHERE hsptl_country LIKE 'P%' and town LIKE 'D%'

14)
SELECT * FROM patient WHERE EXTRACT(year FROM age(current_date,ptnt_birth_date))<35 and LENGTH(ptnt_address)>5
EXCEPT
SELECT * FROM patient WHERE EXTRACT(year FROM age(current_date,ptnt_birth_date))>20 and LENGTH(ptnt_address)<15