CREATE OR REPLACE STAGE LOAN_PAYMENTS.EXTERNAL_STAGES.JSON_STAGE
    url = 's3://bucketsnowflake-jsondemo';

CREATE OR REPLACE file format LOAN_PAYMENTS.FILE_FORMATS.JSON_FORMAT
    type = JSON;

CREATE OR REPLACE TABLE LOAN_PAYMENTS.BRONZE.JSON_RAW (
    raw_file variant
    );

COPY INTO LOAN_PAYMENTS.BRONZE.JSON_RAW
    FROM @LOAN_PAYMENTS.EXTERNAL_STAGES.JSON_STAGE
    file_format = LOAN_PAYMENTS.EXTERNAL_STAGES.JSON_FORMAT
    files = ('HR_data.json');

SELECT * FROM LOAN_PAYMENTS.BRONZE.JSON_RAW;

SELECT 
    RAW_FILE:id::INT as id,
    RAW_FILE:first_name::string as first_name,
    RAW_FILE:city::string as city,
    RAW_FILE:gender::string as gender,
    RAW_FILE:job:salary::int as salary,
    RAW_FILE:job:title::string as job_title
FROM
    LOAN_PAYMENTS.BRONZE.JSON_RAW;

SELECT 
    RAW_FILE:id::INT as id,
    f.value:language::string as language,
    f.value:level::string as level,
FROM
    LOAN_PAYMENTS.BRONZE.JSON_RAW, table(flatten(RAW_FILE:spoken_languages)) f;


CREATE OR REPLACE TABLE LOAN_PAYMENTS.BRONZE.employees AS 
SELECT 
    RAW_FILE:id::INT as id,
    RAW_FILE:first_name::string as first_name,
    RAW_FILE:city::string as city,
    RAW_FILE:gender::string as gender,
    RAW_FILE:job:salary::int as salary,
    RAW_FILE:job:title::string as job_title
FROM
    LOAN_PAYMENTS.BRONZE.JSON_RAW;

CREATE OR REPLACE TABLE LOAN_PAYMENTS.BRONZE.employee_languages AS 
SELECT 
    RAW_FILE:id::INT as id,
    f.value:language::string as language,
    f.value:level::string as level,
FROM
    LOAN_PAYMENTS.BRONZE.JSON_RAW, table(flatten(RAW_FILE:spoken_languages)) f;

SELECT * FROM LOAN_PAYMENTS.BRONZE.EMPLOYEES;
SELECT * FROM LOAN_PAYMENTS.BRONZE.EMPLOYEE_LANGUAGES;


    