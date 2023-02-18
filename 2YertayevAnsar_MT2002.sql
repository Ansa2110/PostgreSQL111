1) 
SELECT COUNT(DISTINCT patient_id)
FROM appointment
WHERE appointment_date>'2018-10-02'

2)
SELECT * FROM Doctor
GROUP BY doctor_id
HAVING COUNT(hospital_id) < 2;

3)
SELECT CONCAT(patient.ptn_f_name,' ',patient.ptn_l_name) as patient,CONCAT(doctor.dc_f_name,' ',doctor.dc_l_name) as doctor
FROM appointment
JOIN patient ON appointment.patient_id=patient.patient_id
JOIN doctor ON appointment.doctor_id=doctor.doctor_id
WHERE appointment_date<'2021-01-10'

4)
SELECT COUNT(DISTINCT patient_id)
FROM appointment
WHERE appointment_date<'2021-10-01'

5)
SELECT CONCAT(patient.ptn_f_name,' ',patient.ptn_l_name) as patient 
FROM appointment
JOIN patient ON appointment.patient_id=patient.patient_id
WHERE appointment_date='2008-04-09'
	
6)
SELECT appointment_id
FROM appointment
JOIN bill ON appointment.bill_id=bill.bill_id
WHERE bill.bill_price=(SELECT max(bill.bill_price) FROM bill JOIN appointment ON appointment.bill_id=bill.bill_id)

7)
SELECT hospitals.hospital_name,doctor.dc_f_name,doctor.dc_l_name
FROM hospitals
JOIN doctor ON hospitals.hospital_id=doctor.hospital_id
ORDER BY hospitals.hospital_name asc

8)
SELECT CONCAT(doctor.dc_f_name,' ',doctor.dc_l_name) as doctor
FROM appointment
JOIN disease ON appointment.disease_id=disease.disease_id
JOIN doctor ON appointment.doctor_id=doctor.doctor_id
WHERE disease_name='COVID-19'

9)
SELECT CONCAT(doctor.dc_f_name,' ',doctor.dc_l_name) as doctor
FROM appointment
JOIN doctor ON appointment.doctor_id=doctor.doctor_id
WHERE appointment_date <> '2018-06-25'

10)
SELECT ambulance.ambulance_id,driver.driver_f_name,driver.driver_l_name
FROM driver
JOIN ambulance ON driver.ambulance_id=ambulance.ambulance_id
ORDER BY ambulance.ambulance_id asc

11)
SELECT hospitals.hospital_address
FROM hospital_medicaments
JOIN medicaments ON hospital_medicaments.medicament_id=medicaments.medicament_id
JOIN hospitals ON hospital_medicaments.hospital_id=hospitals.hospital_id
WHERE medicaments.medicament_name IN ('Toradol','Leurekan')

12)
SELECT t1.dc_l_name,t2.dc_f_name,t1.hospital_id
FROM doctor t1
JOIN doctor t2 ON t1.doctor_id=t2.doctor_id
WHERE t1.hospital_id%3=0
ORDER BY t1.hospital_id desc

13)
SELECT * FROM doctor
CROSS JOIN specialization
JOIN hospitals ON hospitals.hospital_id=doctor.hospital_id
WHERE hospitals.hospital_status IS NOT NULL

14)
SELECT * FROM doctor 
NATURAL JOIN hospitals
WHERE town LIKE 'A%'