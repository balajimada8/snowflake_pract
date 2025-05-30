--- Create and manage roles & users ---

--- Create Sales roles & Users for Sales ---

CREATE ROLE sales_admin;
CREATE ROLE sales_users;

--- Create Heirarchy ---

GRANT ROLE sales_users TO ROLE sales_admin;

--- Assign Roles to SYSADMIN as per Best Practice ---

GRANT ROLE sales_admin TO ROLE SYSADMIN;


---user 3 ---
CREATE USER user_sales_user PASSWORD = '123'
DEFAULT_ROLE = sales_users
MUST_CHANGE_PASSWORD = TRUE;

GRANT ROLE sales_users TO USER user_sales_user;


---user 3 ---
CREATE USER user_sales_admin PASSWORD = '123'
DEFAULT_ROLE = sales_admin
MUST_CHANGE_PASSWORD = TRUE;

GRANT ROLE sales_admin TO USER user_sales_admin;


--- HR Roles ---
CREATE ROLE hr_admin;
CREATE ROLE hr_users;

--- Create Heirarchy ---

GRANT ROLE hr_users TO ROLE hr_admin;


CREATE USER user_hr_user PASSWORD = '123'
DEFAULT_ROLE = hr_users
MUST_CHANGE_PASSWORD = TRUE;

GRANT ROLE hr_users TO USER user_hr_user;


---user  ---
CREATE USER user_hr_admin PASSWORD = '123'
DEFAULT_ROLE = hr_admin
MUST_CHANGE_PASSWORD = TRUE;

GRANT ROLE hr_admin TO USER user_hr_admin;