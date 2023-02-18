1) 
SELECT * FROM patient 
WHERE ptn_f_name LIKE 'N%' and char_length(ptn_f_name)>=4 and char_length(ptn_f_name)<=7 

2)
SELECT CONCAT(driver_f_name,' ',driver_l_name) as fl
FROM driver 

3) 
SELECT * FROM patient LIMIT 15

4)
SELECT patient_id as p_id,ptn_f_name as p_f_name,ptn_l_name as p_l_name,ptn_gender as p_gender
FROM patient  
ORDER BY ptn_f_name desc 

5)
SELECT dc_f_name,dc_l_name,dc_bith_of_date
FROM doctor 
WHERE dc_bith_of_date>='1970-01-01' and dc_bith_of_date<='1985-01-01'

6)
UPDATE hospitals 
SET hospital_status='private' WHERE town='Alexandria'

7) 
SELECT COUNT(DISTINCT(town))
FROM hospitals 

8)
SELECT sum(bill.bill_price)
FROM appointment,bill
WHERE appointment.bill_id=bill.bill_id

9)
SELECT DISTINCT medicament_name
FROM medicaments

10)
SELECT hospital_name 
FROM hospitals 
WHERE hospital_status IS NOT NULL

11)
SELECT specialization.spzltn_name,COUNT(*)
FROM doctor,specialization
WHERE doctor.splztn_id=specialization.specialization_id
GROUP BY specialization.spzltn_name

12)
SELECT ptn_f_name,ptn_l_name
FROM patient
WHERE ptn_f_name LIKE '____n%' and ptn_f_name LIKE '%r%'

13)
SELECT dc_l_name 
FROM doctor 
WHERE char_length(dc_f_name)=7

14)
SELECT max(bill_price)-min(bill_price)
FROM bill

15)
SELECT dc_f_name,dc_l_name
FROM doctor
WHERE dc_f_name LIKE 'To%' and dc_f_name NOT LIKE 'Fidoe'
ORDER BY dc_f_name asc

16)
SELECT ROUND(avg(bill.bill_price)::numeric,2)
FROM appointment,bill
WHERE appointment.bill_id=bill.bill_id

17)
SELECT patient_id,appointment_date,COUNT(*)
FROM appointment
WHERE appointment_date>='2012-01-01' and appointment_date<='2015-01-01' 
GROUP BY patient_id,appointment_date
ORDER BY appointment_date asc

18)
SELECT dc_l_name,
CASE 
  WHEN EXTRACT(year FROM age(current_date,dc_bith_of_date))<35 THEN 'young'
  WHEN EXTRACT(year FROM age(current_date,dc_bith_of_date))>=35 and EXTRACT(year FROM age(current_date,dc_bith_of_date))<=60 THEN 'middle'
  WHEN EXTRACT(year FROM age(current_date,dc_bith_of_date))>60 THEN 'old'
END type_of_age
FROM doctor 
ORDER BY dc_l_name asc

19)
SELECT town,count(*) 
FROM hospitals
GROUP BY town
ORDER BY town desc

20)
SELECT hospital_name 
FROM hospitals
WHERE hospital_status is NULL
LIMIT 10


