1)
SELECT avg(bill_price)
FROM bill
WHERE bill_price>970

2)
SELECT avg(dc_salary)
FROM doctor
WHERE dc_gender='Male' and doctor_id<35

3)
SELECT dc_f_name,dc_l_name,dc_salary
FROM doctor
WHERE dc_salary>(SELECT dc_salary FROM doctor WHERE dc_l_name='Wyldish')

4)
SELECT dc_f_name,dc_l_name
FROM doctor
WHERE splztn_id=(SELECT specialization_id FROM specialization WHERE spzltn_name='Neurologist')

5)
SELECT dc_f_name,dc_l_name,dc_salary
FROM doctor
WHERE dc_salary>(SELECT avg(dc_salary) FROM doctor)

6)
SELECT dc_f_name,dc_l_name,dc_salary,splztn_id
FROM doctor 
WHERE dc_salary IN(SELECT min(dc_salary) FROM doctor GROUP BY splztn_id)
ORDER BY splztn_id asc

7)
SELECT dc_f_name,dc_l_name,dc_salary,splztn_id
FROM doctor
WHERE dc_salary=(SELECT min(dc_salary) FROM doctor)

8)
SELECT dc_f_name,dc_l_name,dc_salary
FROM doctor
ORDER BY dc_salary asc
LIMIT 3;

9)
SELECT dc_f_name,dc_salary,dc_gender,avg(dc_salary) OVER (PARTITION BY dc_gender)
FROM doctor

10)
SELECT dc_f_name,dc_l_name,hospital_id,dc_salary,max(dc_salary) OVER(PARTITION BY hospital_id) 
FROM doctor

11)
SELECT dc_f_name, dc_l_name, dc_gender, splztn_id, ROW_NUMBER () OVER (PARTITION BY splztn_id ORDER BY dc_f_name)
FROM doctor
WHERE dc_salary>500 and dc_salary<1500

12)
SELECT dc_f_name,dc_l_name,dc_salary,hospital_id FROM (SELECT *,DENSE_RANK() OVER(PARTITION BY hospital_id ORDER BY dc_salary) rnk 
FROM doctor ) rnk1
WHERE rnk=1

13) 
SELECT dc_f_name,dc_l_name,dc_salary,splztn_id,hospital_id,FIRST_VALUE(dc_f_name) OVER(PARTITION BY hospital_id ORDER BY dc_salary RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) lowest_price
FROM doctor
WHERE dc_salary%3=0 and splztn_id>5