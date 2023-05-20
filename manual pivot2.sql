-- Data from https://techtfq.com/video/solving-sql-query-rows-to-column-in-sql

/*
create table sales_data
    (
        sales_date      date,
        customer_id     varchar(30),
        amount          varchar(30)
    );
insert into sales_data values (to_date('01-Jan-2021','dd-mon-yyyy'), 'Cust-1', '50$');
insert into sales_data values (to_date('02-Jan-2021','dd-mon-yyyy'), 'Cust-1', '50$');
insert into sales_data values (to_date('03-Jan-2021','dd-mon-yyyy'), 'Cust-1', '50$');
insert into sales_data values (to_date('01-Jan-2021','dd-mon-yyyy'), 'Cust-2', '100$');
insert into sales_data values (to_date('02-Jan-2021','dd-mon-yyyy'), 'Cust-2', '100$');
insert into sales_data values (to_date('03-Jan-2021','dd-mon-yyyy'), 'Cust-2', '100$');
insert into sales_data values (to_date('01-Feb-2021','dd-mon-yyyy'), 'Cust-2', '-100$');
insert into sales_data values (to_date('02-Feb-2021','dd-mon-yyyy'), 'Cust-2', '-100$');
insert into sales_data values (to_date('03-Feb-2021','dd-mon-yyyy'), 'Cust-2', '-100$');
insert into sales_data values (to_date('01-Mar-2021','dd-mon-yyyy'), 'Cust-3', '1$');
insert into sales_data values (to_date('01-Apr-2021','dd-mon-yyyy'), 'Cust-3', '1$');
insert into sales_data values (to_date('01-May-2021','dd-mon-yyyy'), 'Cust-3', '1$');
insert into sales_data values (to_date('01-Jun-2021','dd-mon-yyyy'), 'Cust-3', '1$');
insert into sales_data values (to_date('01-Jul-2021','dd-mon-yyyy'), 'Cust-3', '-1$');
insert into sales_data values (to_date('01-Aug-2021','dd-mon-yyyy'), 'Cust-3', '-1$');
insert into sales_data values (to_date('01-Sep-2021','dd-mon-yyyy'), 'Cust-3', '-1$');
insert into sales_data values (to_date('01-Oct-2021','dd-mon-yyyy'), 'Cust-3', '-1$');
insert into sales_data values (to_date('01-Nov-2021','dd-mon-yyyy'), 'Cust-3', '-1$');
insert into sales_data values (to_date('01-Dec-2021','dd-mon-yyyy'), 'Cust-3', '-1$');

select * from sales_data;
*/

WITH fixed AS (
	SELECT customer_id AS customer,
			to_char(sales_date,'Mon') || to_char(sales_date,'-YY') AS sales_date,
			CAST (replace(amount, '$', '') AS double precision) AS amount
	FROM sales_data
)

SELECT customer, 
	SUM(CASE WHEN sales_date = 'Jan-21' THEN amount ELSE 0 END) AS Jan21,
	SUM(CASE WHEN sales_date = 'Feb-21' THEN amount ELSE 0 END) AS Feb21,
	SUM(CASE WHEN sales_date = 'Mar-21' THEN amount ELSE 0 END) AS Mar21,
	SUM(CASE WHEN sales_date = 'Apr-21' THEN amount ELSE 0 END) AS Apr21,
	SUM(CASE WHEN sales_date = 'May-21' THEN amount ELSE 0 END) AS May21,
	SUM(CASE WHEN sales_date = 'Jun-21' THEN amount ELSE 0 END) AS Jun21,
	SUM(CASE WHEN sales_date = 'Jul-21' THEN amount ELSE 0 END) AS Jul21,
	SUM(CASE WHEN sales_date = 'Aug-21' THEN amount ELSE 0 END) AS Aug21,
	SUM(CASE WHEN sales_date = 'Sep-21' THEN amount ELSE 0 END) AS Sep21,
	SUM(CASE WHEN sales_date = 'Oct-21' THEN amount ELSE 0 END) AS Oct21,
	SUM(CASE WHEN sales_date = 'Nov-21' THEN amount ELSE 0 END) AS Nov21,
	SUM(CASE WHEN sales_date = 'Dev-21' THEN amount ELSE 0 END) AS Dec21
	
FROM fixed
GROUP BY customer, sales_date
ORDER BY customer, sales_date



