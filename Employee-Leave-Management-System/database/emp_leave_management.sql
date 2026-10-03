use emp_leave_management;

create table employees (
employee_id int primary key auto_increment,
employee_name varchar (20),
email_id varchar (30) unique,
dept varchar (20),
joining_date date );

select * from employees;

-- Query 6
INSERT INTO employees (employee_name, email_id, dept, joining_date)
VALUES
('Yuvaraj', 'yuvaraj@gmail.com', 'IT', '2025-01-27'),
('Arun', 'arun@gmail.com', 'HR', '2024-06-15'),
('Karthik', 'karthik@gmail.com', 'Finance', '2023-11-10'),
('Priya', 'priya@gmail.com', 'IT', '2025-03-05'),
('Janani', 'janani@gmail.com', 'Marketing', '2024-09-20');


CREATE TABLE leave_balance (
    balance_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    total_leaves INT NOT NULL,
    used_leaves INT DEFAULT 0,
    remaining_leaves INT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO leave_balance
(employee_id, total_leaves, used_leaves, remaining_leaves)
VALUES
(1, 20, 2, 18),
(2, 20, 5, 15),
(3, 20, 3, 17),
(4, 20, 0, 20),
(5, 20, 4, 16);

SELECT * FROM leave_balance;


CREATE TABLE leave_requests (
    leave_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    leave_type VARCHAR(30),
    start_date DATE,
    end_date DATE,
    reason VARCHAR(100),
    status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);


INSERT INTO leave_requests
(employee_id, leave_type, start_date, end_date, reason, status)
VALUES
(1, 'Casual', '2026-10-05', '2026-10-06', 'Personal work', 'Pending'),
(2, 'Sick', '2026-10-08', '2026-10-09', 'Not feeling well', 'Approved'),
(3, 'Casual', '2026-10-12', '2026-10-13', 'Family function', 'Pending'),
(4, 'Earned', '2026-10-15', '2026-10-17', 'Vacation', 'Approved'),
(5, 'Sick', '2026-10-20', '2026-10-20', 'Medical appointment', 'Rejected'); 

select * from leave_requests;