/********************************************************
Developer name: Mr.NGOO CHEN THONG
Job position: Data Scientist, APU SDN BHD
Program name: mydap_project_tp078601.sas
Description: Loan application status prediction - (1 - 2 lines)
Date first written: Fri,26-Apr-2024
Date last updated: Thu,6-Jun-2024
Folder name:  MY_DAP_FT_MAR_2024_TP078601
Library name:  LIB78601
********************************************************/

/*SAS Codes to display the data dictionary of LIB78601.TRAINING_DS */
PROC SQL;
DESCRIBE TABLE LIB78601.TESTING_DS;
RUN;

PROC CONTENTS DATA = LIB78601.TRAINING_DS;
RUN;



TITLE ' Univariate Analysis of the Categorical variable: MARITAL_STATUS';
PROC FREQ DATA = LIB78601.TRAINING_DS;
TABLE marital_status;
RUN;
ODS GRAPHIC / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA = LIB78601.TRAINING_DS;
VBAR marital_status;
TITLE ' Univariate Analysis of the Categorical variable: MARITAL_STATUS';
RUN;


TITLE ' Univariate Analysis of the Categorical variable: LOAN_LOCATION';
PROC FREQ DATA = LIB78601.TRAINING_DS;
TABLE loan_location;
RUN;
ODS GRAPHIC / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA = LIB78601.TRAINING_DS;
VBAR loan_location;
TITLE ' Univariate Analysis of the Categorical variable: LOAN_LOCATION';
RUN;


TITLE ' Univariate Analysis of the Categorical variable: QUALIFICATION';
PROC FREQ DATA = LIB78601.TRAINING_DS;
TABLE qualification;
RUN;
ODS GRAPHIC / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA = LIB78601.TRAINING_DS;
VBAR qualification;
TITLE ' Univariate Analysis of the Categorical variable: QUALIFICATION';
RUN;


TITLE ' Univariate Analysis of the Categorical variable: FAMILY_MEMBERS';
PROC FREQ DATA = LIB78601.TRAINING_DS;
TABLE family_members;
RUN;
ODS GRAPHIC / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;

PROC SGPLOT DATA = LIB78601.TRAINING_DS;
VBAR family_members;
TITLE ' Univariate Analysis of the Categorical variable: FAMILY_MEMBERS';
RUN;



TITLE ' Univariate Analysis of the Categorical variable: GENDER';
PROC FREQ DATA = LIB78601.TRAINING_DS;
TABLE GENDER;
RUN;
ODS GRAPHIC / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;


TITLE ' Univariate Analysis of the Categorical variable: EMPLOYMENT';
PROC FREQ DATA = LIB78601.TRAINING_DS;
TABLE EMPLOYMENT;
RUN;
ODS GRAPHIC / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;


TITLE ' Univariate Analysis of the Categorical variable: LOAN_HISTORY';
PROC FREQ DATA = LIB78601.TRAINING_DS;
TABLE LOAN_HISTORY;
RUN;
ODS GRAPHIC / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;



TITLE ' Univariate Analysis of the continuous variable: GUARANTEE_INCOME';
PROC MEANS DATA = LIB78601.TRAINING_DS N NMISS MIN MAX MEAN MEDIAN STD;
VAR guarantee_income;
RUN;
ODS GRAPHIC / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;
PROC SGPLOT DATA = LIB78601.TRAINING_DS;
HISTOGRAM guarantee_income;
TITLE ' Univariate Analysis of the continuous variable: GUARANTEE_INCOME';
RUN;



TITLE ' Univariate Analysis of the continuous variable: LOAN_AMOUNT';
PROC MEANS DATA = LIB78601.TRAINING_DS N NMISS MIN MAX MEAN MEDIAN STD;
VAR loan_amount;
RUN;
ODS GRAPHIC / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;
PROC SGPLOT DATA = LIB78601.TRAINING_DS;
HISTOGRAM loan_amount;
TITLE ' Univariate Analysis of the continuous variable: LOAN_AMOUNT';
RUN;



TITLE ' Univariate Analysis of the continuous variable: LOAN_DURATION';
PROC MEANS DATA = LIB78601.TRAINING_DS N NMISS MIN MAX MEAN MEDIAN STD;
VAR loan_duration;
RUN;
ODS GRAPHIC / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;
PROC SGPLOT DATA = LIB78601.TRAINING_DS;
HISTOGRAM loan_duration;
TITLE ' Univariate Analysis of the continuous variable: LOAN_DURATION';
RUN;



TITLE ' Univariate Analysis of the continuous variable: CANDIDATE_INCOME';
PROC MEANS DATA = LIB78601.TRAINING_DS N NMISS MIN MAX MEAN MEDIAN STD;
VAR candidate_income;
RUN;
ODS GRAPHIC / RESET WIDTH = 3.0 IN HEIGHT = 4.0 IN IMAGEMAP;
PROC SGPLOT DATA = LIB78601.TRAINING_DS;
HISTOGRAM candidate_income;
TITLE ' Univariate Analysis of the continuous variable: CANDIDATE_INCOME';
RUN;



TITLE1 ' Bivariate analysis of the variables:';
TITLE2 ' Categorical variable [QUALIFICATION] VS Categorical variable [EMPLOYMENT] ';
PROC FREQ DATA = LIB78601.TRAINING_DS;
TABLE qualification*employment/
PLOTS = FREQPLOT(TWOWAY = STACKED SCALE = GROUPPCT);
RUN;



TITLE1 ' Bivariate analysis of the variables:';
TITLE2 ' Categorical variable [QUALIFICATION] VS Categorical variable [MARITAL_STATUS] ';
PROC FREQ DATA = LIB78601.TRAINING_DS;
TABLE qualification*marital_status/
PLOTS = FREQPLOT(TWOWAY = STACKED SCALE = GROUPPCT);
RUN;



TITLE1 ' Bivariate analysis of the variables:';
TITLE2 ' Categorical variable [QUALIFICATION] VS Categorical variable [LOAN_LOCATION] ';
PROC FREQ DATA = LIB78601.TRAINING_DS;
TABLE qualification*loan_location/
PLOTS = FREQPLOT(TWOWAY = STACKED SCALE = GROUPPCT);
RUN;



TITLE1 ' Bivariate analysis of the variables:';
TITLE2 ' Categorical variable [LOAN_LOCATION] VS Continuous variable [LOAN_AMOUNT] ';
PROC MEANS DATA = LIB78601.TRAINING_DS;
CLASS loan_location; /* Categorical */
VAR loan_amount; /* Continuous */
RUN;



TITLE1 ' Bivariate analysis of the variables:';
TITLE2 ' Categorical variable [QUALIFICATION] VS Continuous variable [GUARANTEE_INCOME] ';
PROC MEANS DATA = LIB78601.TRAINING_DS;
CLASS qualification; /* Categorical */
VAR guarantee_income; /* Continuous */
RUN;




TITLE1 ' Bivariate analysis of the variables:';
TITLE2 ' Categorical variable [LOAN_DURATION] VS Continuous variable [LOAN_AMOUNT] ';
PROC MEANS DATA = LIB78601.TRAINING_DS;
CLASS loan_duration; /* Categorical */
VAR loan_amount; /* Continuous */
RUN;



/* Macro begins here */
OPTIONS MCOMPILENOTE=ALL;

%MACRO UVA_CATE_VARI(ptitle, pdataset, pcate_vari);
TITLE &ptitle; 
PROC FREQ DATA = &pdataset;
TABLE &pcate_vari;
RUN;
%MEND UVA_CATE_VARI; 
/* Macro end here */

/* Call the SAS Macro - UVA_CATE_VARI */
%UVA_CATE_VARI('Univariate Analysis of the Categorical Variable - FAMILY_MEMBERS', LIB78601.TESTING_DS, FAMILY_MEMBERS);
%UVA_CATE_VARI('Univariate Analysis of the Categorical Variable - GENDER', LIB78601.TESTING_DS, GENDER);
%UVA_CATE_VARI('Univariate Analysis of the Categorical Variable - LOAN_LOCATION', LIB78601.TESTING_DS, LOAN_LOCATION);
%UVA_CATE_VARI('Univariate Analysis of the Categorical Variable - QUALIFICATION', LIB78601.TESTING_DS, QUALIFICATION);
%UVA_CATE_VARI('Univariate Analysis of the Categorical Variable - MARITAL_STATUS', LIB78601.TESTING_DS, MARITAL_STATUS);
%UVA_CATE_VARI('Univariate Analysis of the Categorical Variable - EMPLOYMENT', LIB78601.TESTING_DS, EMPLOYMENT);



/* Macro begins here */
OPTIONS MCOMPILENOTE=ALL;

%MACRO UVA_CONT_VARI(ptitle, pdataset, pcont_vari);
TITLE &ptitle; 
PROC MEANS DATA = &pdataset N NMISS MIN MAX MEAN MEDIAN STD;
VAR &pcont_vari;
RUN;
%MEND UVA_CONT_VARI; 
/* Macro end here */

/* Call the SAS Macro - UVA_CONT_VARI */
%UVA_CONT_VARI('Univariate Analysis of the Continuous Variable - CANDIDATE_INCOME', LIB78601.TESTING_DS, CANDIDATE_INCOME);
%UVA_CONT_VARI('Univariate Analysis of the Continuous Variable - GUARANTEE_INCOME', LIB78601.TESTING_DS, GUARANTEE_INCOME);
%UVA_CONT_VARI('Univariate Analysis of the Continuous Variable - LOAN_AMOUNT', LIB78601.TESTING_DS, LOAN_AMOUNT);
%UVA_CONT_VARI('Univariate Analysis of the Continuous Variable - LOAN_DURATION', LIB78601.TESTING_DS, LOAN_DURATION);



/* Macro begins here */
OPTIONS MCOMPILENOTE=ALL;

%MACRO BVA_CATE_CATE(ptitle1, ptitle2, pdataset, pcate_vari1, pcate_vari2);
TITLE &ptitle1; 
TITLE2 &ptitle2;
PROC FREQ DATA = &pdataset;
TABLE &pcate_vari1 * &pcate_vari2/
PLOTS = FREQPLOT(TWOWAY = STACKED SCALE = GROUPPCT);
RUN;
%MEND BVA_CATE_CATE; 
/* Macro end here */

/* Call the SAS Macro - bVA_CATE_CATE */
%BVA_CATE_CATE('Bivariate analysis of the variables:', 
' Categorical variable [FAMILY_MEMBERS] VS Categorical variable [QUALIFICATION] ',
LIB78601.TESTING_DS, FAMILY_MEMBERS, QUALIFICATION);

%BVA_CATE_CATE('Bivariate analysis of the variables:', 
' Categorical variable [MARITAL_STATUS] VS Categorical variable [LOAN_LOCATION] ',
LIB78601.TESTING_DS, MARITAL_STATUS, LOAN_LOCATION);

%BVA_CATE_CATE('Bivariate analysis of the variables:', 
' Categorical variable [GENDER] VS Categorical variable [EMPLOYMENT] ',
LIB78601.TESTING_DS, GENDER, EMPLOYMENT);




/* Macro begins here */
OPTIONS MCOMPILENOTE=ALL;

%MACRO BVA_CATE_CON(ptitle1, ptitle2, pdataset, pcate_vari1, pcate_vari2);
TITLE &ptitle1; 
TITLE2 &ptitle2;
PROC MEANS DATA = &pdataset;
CLASS &pcate_vari1; /* Categorical */
VAR &pcate_vari2; /* Continuous */
RUN;
%MEND BVA_CATE_CON; 
/* Macro end here */

/* Call the SAS Macro - BVA_CATE_CON */
%BVA_CATE_CON(' Bivariate analysis of the variables:', 
' Categorical variable [LOAN_LOCATION] VS Continuous variable [LOAN_AMOUNT]  ',
LIB78601.TESTING_DS, LOAN_LOCATION, LOAN_AMOUNT);

%BVA_CATE_CON(' Bivariate analysis of the variables:', 
' Categorical variable [MARITAL_STATUS] VS Continuous variable [LOAN_AMOUNT]  ',
LIB78601.TESTING_DS, MARITAL_STATUS, LOAN_AMOUNT);

%BVA_CATE_CON(' Bivariate analysis of the variables:', 
' Categorical variable [QUALIFICATION] VS Continuous variable [LOAN_AMOUNT]  ',
LIB78601.TESTING_DS, QUALIFICATION, LOAN_AMOUNT);








/* Step1: Obtain the information of loan applicants who submitted their 
loan application without marital status */

TITLE 'Obtain the information of loan applicants who submitted their';
TITLE2 'loan application without marital status';
FOTENOTE '-------END-------';
PROC SQL;
SELECT *
FROM LIB78601.TRAINING_DS e
WHERE (e.marital_status = '' OR e.marital_status IS MISSING);
QUIT;

/* Step2: Count the number of loan applicants who submitted their 
loan application without marital status */

TITLE 'Count the number of loan applicants who submitted their';
TITLE2 'loan application without marital status';
FOTENOTE '-------END-------';
PROC SQL;
SELECT COUNT(*) label = 'Number of Applicants' 
FROM LIB78601.TRAINING_DS e
WHERE (e.marital_status = '' OR e.marital_status IS MISSING);
QUIT;

/* Step3: Find the statistics of applicants who submitted their 
loan application without marital status */

TITLE 'Find the statistics of applicants who submitted their';
TITLE2 'loan application without marital status';
FOTENOTE '-------END-------';
PROC SQL;
SELECT e.marital_status AS MARITAL_STATUS,  
	   COUNT(*) AS COUNTS   
FROM LIB78601.TRAINING_DS e
WHERE (e.marital_status ne ' ' OR e.marital_status IS NOT MISSING)
GROUP BY e.marital_status;
QUIT;

/* Step4: Save the statistics in a dataset */

PROC SQL;
CREATE TABLE LIB78601.TRAINING_STAT_DS AS 
SELECT e.marital_status AS MARITAL_STATUS,  
	   COUNT(*) AS COUNTS   
FROM LIB78601.TRAINING_DS e
WHERE (e.marital_status ne ' ' OR e.marital_status IS NOT MISSING)
GROUP BY e.marital_status;
QUIT;


/* Step4.1: Create a backup dataset */
PROC SQL;
CREATE TABLE LIB78601.TRAINING_BK_DS AS 
SELECT * 
FROM LIB78601.TRAINING_DS;
QUIT;


/* Step5: Impute the missing value found in the categorical variable MARITAL_STATUS */
PROC SQL;
UPDATE LIB78601.TRAINING_DS 
SET marital_status = ( SELECT t1.MARITAL_STATUS AS MARITAL_STATUS
					   FROM LIB78601.TRAINING_STAT_DS t1 
					   WHERE COUNTS = ( SELECT MAX(t2.COUNTS) AS HIGHEST_COUNT
									    FROM LIB78601.TRAINING_STAT_DS t2 ))
						     			/* sub-program to find highest count */
WHERE (marital_status = '' OR marital_status IS MISSING);				
QUIT;

/* Step6: (AI) Obtain the information of loan applicants who submitted their 
loan application without marital status */

TITLE '(AI) Obtain the information of loan applicants who submitted their';
TITLE2 'loan application without marital status';
FOTENOTE '-------END-------';
PROC SQL;
SELECT *
FROM LIB78601.TRAINING_DS e
WHERE (e.marital_status = '' OR e.marital_status IS MISSING);
QUIT;





/* Step1: Obtain the information of loan applicants who submitted their 
loan application without employment */

TITLE 'Obtain the information of loan applicants who submitted their';
TITLE2 'loan application without employment';
FOTENOTE '-------END-------';
PROC SQL;
SELECT *
FROM LIB78601.TRAINING_DS e
WHERE (e.employment = '' OR e.employment IS MISSING);
QUIT;

/* Step2: Count the number of loan applicants who submitted their 
loan application without employment */

TITLE 'Count the number of loan applicants who submitted their';
TITLE2 'loan application without employment';
FOTENOTE '-------END-------';
PROC SQL;
SELECT COUNT(*) label = 'Number of Applicants' 
FROM LIB78601.TRAINING_DS e
WHERE (e.employment = '' OR e.employment IS MISSING);
QUIT;

/* Step3: Find the statistics of applicants who submitted their 
loan application without employment */

TITLE 'Find the statistics of applicants who submitted their';
TITLE2 'loan application without employment';
FOTENOTE '-------END-------';
PROC SQL;
SELECT e.employment AS EMPLOYMENT,  
	   COUNT(*) AS COUNTS   
FROM LIB78601.TRAINING_DS e
WHERE (e.employment ne ' ' OR e.employment IS NOT MISSING)
GROUP BY e.employment;
QUIT;

/* Step4: Save the statistics in a dataset */

PROC SQL;
CREATE TABLE LIB78601.TRAINING_STAT_DS AS 
SELECT e.employment AS EMPLOYMENT,  
	   COUNT(*) AS COUNTS   
FROM LIB78601.TRAINING_DS e
WHERE (e.employment ne ' ' OR e.employment IS NOT MISSING)
GROUP BY e.employment;
QUIT;


/* Step4.1: Create a backup dataset */
PROC SQL;
CREATE TABLE LIB78601.TRAINING_BK_DS AS 
SELECT * 
FROM LIB78601.TRAINING_DS;
QUIT;


/* Step5: Impute the missing value found in the categorical variable EMPLOYMENT */
PROC SQL;
UPDATE LIB78601.TRAINING_DS 
SET EMPLOYMENT = ( SELECT t1.EMPLOYMENT AS EMPLOYMENT
					   FROM LIB78601.TRAINING_STAT_DS t1 
					   WHERE COUNTS = ( SELECT MAX(t2.COUNTS) AS HIGHEST_COUNT
									    FROM LIB78601.TRAINING_STAT_DS t2 ))
						     			/* sub-program to find highest count */
WHERE (employment = '' OR employment IS MISSING);				
QUIT;

/* Step6: (AI) Obtain the information of loan applicants who submitted their 
loan application without employment */

TITLE '(AI) Obtain the information of loan applicants who submitted their';
TITLE2 'loan application without employment';
FOTENOTE '-------END-------';
PROC SQL;
SELECT *
FROM LIB78601.TRAINING_DS e
WHERE (e.employment = '' OR e.employment IS MISSING);
QUIT;





/* Step1: Obtain the information of loan applicants who submitted their 
loan application without gender */

TITLE 'Obtain the information of loan applicants who submitted their';
TITLE2 'loan application without gender';
FOTENOTE '-------END-------';
PROC SQL;
SELECT *
FROM LIB78601.TRAINING_DS e
WHERE (e.gender = '' OR e.gender IS MISSING);
QUIT;

/* Step2: Count the number of loan applicants who submitted their 
loan application without gender */

TITLE 'Count the number of loan applicants who submitted their';
TITLE2 'loan application without gender';
FOTENOTE '-------END-------';
PROC SQL;
SELECT COUNT(*) label = 'Number of Applicants' 
FROM LIB78601.TRAINING_DS e
WHERE (e.gender = '' OR e.gender IS MISSING);
QUIT;

/* Step3: Find the statistics of applicants who submitted their 
loan application without gender */

TITLE 'Find the statistics of applicants who submitted their';
TITLE2 'loan application without gender';
FOTENOTE '-------END-------';
PROC SQL;
SELECT e.gender AS GENDER,  
	   COUNT(*) AS COUNTS   
FROM LIB78601.TRAINING_DS e
WHERE (e.gender ne ' ' OR e.gender IS NOT MISSING)
GROUP BY e.gender;
QUIT;

/* Step4: Save the statistics in a dataset */

PROC SQL;
CREATE TABLE LIB78601.TRAINING_STAT_DS AS 
SELECT e.gender AS GENDER,  
	   COUNT(*) AS COUNTS   
FROM LIB78601.TRAINING_DS e
WHERE (e.gender ne ' ' OR e.gender IS NOT MISSING)
GROUP BY e.gender;
QUIT;


/* Step4.1: Create a backup dataset */
PROC SQL;
CREATE TABLE LIB78601.TRAINING_BK_DS AS 
SELECT * 
FROM LIB78601.TRAINING_DS;
QUIT;


/* Step5: Impute the missing value found in the categorical variable GENDER */
PROC SQL;
UPDATE LIB78601.TRAINING_DS 
SET GENDER = ( SELECT t1.GENDER AS GENDER
					   FROM LIB78601.TRAINING_STAT_DS t1 
					   WHERE COUNTS = ( SELECT MAX(t2.COUNTS) AS HIGHEST_COUNT
									    FROM LIB78601.TRAINING_STAT_DS t2 ))
						     			/* sub-program to find highest count */
WHERE (gender = '' OR gender IS MISSING);				
QUIT;


/* Step6: (AI) Obtain the information of loan applicants who submitted their 
loan application without gender */

TITLE '(AI) Obtain the information of loan applicants who submitted their';
TITLE2 'loan application without gender';
FOTENOTE '-------END-------';
PROC SQL;
SELECT *
FROM LIB78601.TRAINING_DS e
WHERE (e.gender = '' OR e.gender IS MISSING);
QUIT;




/* Step1:  List the detaild of the loan applicants who sumitted their 
applications without family members details*/

TITLE 'List the detaild of the loan applicants who sumitted their';
TITLE2 'applications without family members details';
FOTENOTE '-------END-------';
PROC SQL;
SELECT *
FROM LIB78601.TRAINING_DS e
WHERE (e.family_members = '' OR e.family_members IS MISSING);
QUIT;


/* Step2: Count the number of loan applicants who submitted their 
loan application without family members */

TITLE 'Count the number of loan applicants who submitted their';
TITLE2 'loan application without family members';
FOTENOTE '-------END-------';
PROC SQL;
SELECT COUNT(*) label = 'Number of Applicants' 
FROM LIB78601.TRAINING_DS e
WHERE (e.family_members = '' OR e.family_members IS MISSING);
QUIT;


/* Step3: List the details of loan applicants with '3+' family members */

TITLE 'List the details of loan applicants with '3+' family members';
FOTENOTE '-------END-------';
PROC SQL;
SELECT e.family_members label = 'Family Members', 
	   SUBSTR(e.family_members,1,1) label = 'The data found in the 1st position', 
	   SUBSTR(e.family_members,2,1) label = 'The data found in the 2nd position' 
FROM LIB78601.TRAINING_DS e 
WHERE (e.family_members ne '' OR e.family_members IS NOT MISSING);
QUIT;


/* Step4: Create a backup dataset */
PROC SQL;
CREATE TABLE LIB78601.TRAINING_BK_DS AS 
SELECT * 
FROM LIB78601.TRAINING_DS;
QUIT;


/* Step5: Remove the '+' found in the family_members variable */

TITLE 'Remove the '+' found in the family_members variable';
FOTENOTE '-------END-------';
PROC SQL;
UPDATE LIB78601.TRAINING_DS
SET family_members =  SUBSTR(family_members,1,1) 
WHERE SUBSTR(family_members,2,1) eq '+';
QUIT;


/* Step6: Show the statistics about family members variable */

PROC SQL;
SELECT e.family_members AS FAMILY_MEMBERS,  
	   COUNT(*) AS COUNTS   
FROM LIB78601.TRAINING_DS e
WHERE (e.family_members ne ' ' OR e.family_members IS NOT MISSING)
GROUP BY e.family_members;
QUIT;


/* Step7: Save the statistics in a dataset */

PROC SQL;
CREATE TABLE LIB78601.TRAINING_STAT_FM_DS AS 
SELECT e.family_members AS FAMILY_MEMBERS,  
	   COUNT(*) AS COUNTS   
FROM LIB78601.TRAINING_DS e
WHERE (e.family_members ne ' ' OR e.family_members IS NOT MISSING)
GROUP BY e.family_members;
QUIT;


/* Step8: Impute the missing value found in the categorical variable FAMILY_MEMBERS */
PROC SQL;
UPDATE LIB78601.TRAINING_DS 
SET family_members = ( SELECT t1.FAMILY_MEMBERS AS FAMILY_MEMBERS
					   FROM LIB78601.TRAINING_STAT_FM_DS t1 
					   WHERE COUNTS = ( SELECT MAX(t2.COUNTS) AS HIGHEST_COUNT
									    FROM LIB78601.TRAINING_STAT_FM_DS t2 ))
						     			/* sub-program to find highest count */
WHERE (family_members = '' OR family_members IS MISSING);				
QUIT;


/* Step9: (AI) List the detailds of the loan applicants who submitted their 
applications without family members details*/

TITLE '(AI) List the detaild of the loan applicants who sumitted their';
TITLE2 'applications without family members details';
FOTENOTE '-------END-------';
PROC SQL;
SELECT *
FROM LIB78601.TRAINING_DS e
WHERE (e.family_members = '' OR e.family_members IS MISSING);
QUIT;


/* Step10: (AI) Count the number of loan applicants who submitted their 
loan application without family members */

TITLE '(AI) Count the number of loan applicants who submitted their';
TITLE2 'loan application without family members';
FOTENOTE '-------END-------';
PROC SQL;
SELECT COUNT(*) label = 'Number of Applicants' 
FROM LIB78601.TRAINING_DS e
WHERE (e.family_members = '' OR e.family_members IS MISSING);
QUIT;



/* Step1: Obtain the information of loan applicants who submitted their 
loan application without loan_amount */

TITLE 'Obtain the information of loan applicants who submitted their';
TITLE2 'loan application without loan_amount';
FOTENOTE '-------END-------';
PROC SQL;
SELECT * 
FROM LIB78601.TRAINING_DS e
WHERE (e.loan_amount EQ . OR e.loan_amount IS MISSING);
QUIT;

/* Step2: Count the number of loan applicants who submitted their 
loan application without loan_amount */

TITLE 'Count the number of loan applicants who submitted their';
TITLE2 'loan application without loan_amount';
FOTENOTE '-------END-------';
PROC SQL;
SELECT COUNT(*) label = 'Number of Applicants' 
FROM LIB78601.TRAINING_DS e
WHERE (e.loan_amount EQ . OR e.loan_amount IS MISSING);
QUIT;

/* Create a backup dataset */
PROC SQL;
CREATE TABLE LIB78601.TRAINING_BK_DS AS 
SELECT * 
FROM LIB78601.TRAINING_DS;
QUIT;

/* Step3: Impute the missing value found in the
CONTINUOUS variable - loan_amount */

PROC STDIZE DATA =  LIB78601.TRAINING_DS REPONLY
METHOD = MEAN OUT = LIB78601.TRAINING_DS;
VAR loan_amount;
QUIT;

/* Step4: (AI) Obtain the information of loan applicants who submitted their 
loan application without loan_amount */

TITLE 'Obtain the information of loan applicants who submitted their';
TITLE2 'loan application without loan_amount';
FOTENOTE '-------END-------';
PROC SQL;
SELECT * 
FROM LIB78601.TRAINING_DS e
WHERE (e.loan_amount EQ . OR e.loan_amount IS MISSING);
QUIT;

/* Step5: (AI) Count the number of loan applicants who submitted their 
loan application without loan_amount */

TITLE 'Count the number of loan applicants who submitted their';
TITLE2 'loan application without loan_amount';
FOTENOTE '-------END-------';
PROC SQL;
SELECT COUNT(*) label = 'Number of Applicants' 
FROM LIB78601.TRAINING_DS e
WHERE (e.loan_amount EQ . OR e.loan_amount IS MISSING);
QUIT;





/* Impute missing value for loan_history */
/* Impute missing value for loan_history */
/* Impute missing value for loan_history */

/* Step1: Obtain the information of loan applicants who submitted their 
loan application without loan_history */

TITLE 'Obtain the information of loan applicants who submitted their';
TITLE2 'loan application without loan_history';
FOTENOTE '-------END-------';
PROC SQL;
SELECT *
FROM LIB78601.TRAINING_DS e
WHERE (e.loan_history eq . OR e.loan_history IS MISSING);
QUIT;

/* Step2: Count the number of loan applicants who submitted their 
loan application without loan_history */

TITLE 'Count the number of loan applicants who submitted their';
TITLE2 'loan application without loan_history';
FOTENOTE '-------END-------';
PROC SQL;
SELECT COUNT(*) label = 'Number of Applicants' 
FROM LIB78601.TRAINING_DS e
WHERE (e.loan_history eq . OR e.loan_history IS MISSING);
QUIT;

/* Step3: Find the statistics of applicants who submitted their 
loan application without loan_history */

TITLE 'Find the statistics of applicants who submitted their';
TITLE2 'loan application without loan_history';
FOTENOTE '-------END-------';
PROC SQL;
SELECT e.loan_history AS loan_history,  
	   COUNT(*) AS COUNTS   
FROM LIB78601.TRAINING_DS e
WHERE (e.loan_history ne . OR e.loan_history IS NOT MISSING)
GROUP BY e.loan_history;
QUIT;

/* Step4: Save the statistics in a dataset */

PROC SQL;
CREATE TABLE LIB78601.TRAINING_STAT_DS AS 
SELECT e.loan_history AS loan_history,  
	   COUNT(*) AS COUNTS   
FROM LIB78601.TRAINING_DS e
WHERE (e.loan_history ne . OR e.loan_history IS NOT MISSING)
GROUP BY e.loan_history;
QUIT;


/* Step4.1: Create a backup dataset */
PROC SQL;
CREATE TABLE LIB78601.TRAINING_BK_DS AS 
SELECT * 
FROM LIB78601.TRAINING_DS;
QUIT;


/* Step5: Impute the missing value found in the categorical variable EMPLOYMENT */
PROC SQL;
UPDATE LIB78601.TRAINING_DS 
SET loan_history = ( SELECT t1.loan_history AS loan_history
					   FROM LIB78601.TRAINING_STAT_DS t1 
					   WHERE COUNTS = ( SELECT MAX(t2.COUNTS) AS HIGHEST_COUNT
									    FROM LIB78601.TRAINING_STAT_DS t2 ))
						     			/* sub-program to find highest count */
WHERE (loan_history = . OR loan_history IS MISSING);				
QUIT;


/* Step6: (AI) Obtain the information of loan applicants who submitted their 
loan application without loan_history */

TITLE '(AI) Obtain the information of loan applicants who submitted their';
TITLE2 'loan application without loan_history';
FOTENOTE '-------END-------';
PROC SQL;
SELECT *
FROM LIB78601.TRAINING_DS e
WHERE (e.loan_history eq . OR e.loan_history IS MISSING);
QUIT;









/* Step1: Obtain the information of loan applicants who submitted their 
loan application without loan_duration */

TITLE 'Obtain the information of loan applicants who submitted their';
TITLE2 'loan application without loan_duration';
FOTENOTE '-------END-------';
PROC SQL;
SELECT * 
FROM LIB78601.TRAINING_DS e
WHERE (e.loan_duration EQ . OR e.loan_duration IS MISSING);
QUIT;

/* Step2: Count the number of loan applicants who submitted their 
loan application without loan_duration */

TITLE 'Count the number of loan applicants who submitted their';
TITLE2 'loan application without loan_duration';
FOTENOTE '-------END-------';
PROC SQL;
SELECT COUNT(*) label = 'Number of Applicants' 
FROM LIB78601.TRAINING_DS e
WHERE (e.loan_duration EQ . OR e.loan_duration IS MISSING);
QUIT;

/* Create a backup dataset */
PROC SQL;
CREATE TABLE LIB78601.TRAINING_BK_DS AS 
SELECT * 
FROM LIB78601.TRAINING_DS;
QUIT;

/* Step3: Impute the missing value found in the
CONTINUOUS variable - loan_duration */

PROC STDIZE DATA =  LIB78601.TRAINING_DS REPONLY
METHOD = MEAN OUT = LIB78601.TRAINING_DS;
VAR loan_duration;
QUIT;

/* Step4: (AI) Obtain the information of loan applicants who submitted their 
loan application without loan_duration */

TITLE 'Obtain the information of loan applicants who submitted their';
TITLE2 'loan application without loan_duration';
FOTENOTE '-------END-------';
PROC SQL;
SELECT * 
FROM LIB78601.TRAINING_DS e
WHERE (e.loan_duration EQ . OR e.loan_duration IS MISSING);
QUIT;

/* Step5: (AI) Count the number of loan applicants who submitted their 
loan application without loan_duration */

TITLE 'Count the number of loan applicants who submitted their';
TITLE2 'loan application without loan_duration';
FOTENOTE '-------END-------';
PROC SQL;
SELECT COUNT(*) label = 'Number of Applicants' 
FROM LIB78601.TRAINING_DS e
WHERE (e.loan_duration EQ . OR e.loan_duration IS MISSING);
QUIT;






/* Step1: Obtain the information of loan applicants who submitted their 
loan application without loan_history */

TITLE 'Obtain the information of loan applicants who submitted their';
TITLE2 'loan application without loan_history';
FOTENOTE '-------END-------';
PROC SQL;
SELECT *
FROM LIB78601.TESTING_DS e
WHERE (e.loan_history eq . OR e.loan_history IS MISSING);
QUIT;

/* Step2: Count the number of loan applicants who submitted their 
loan application without loan_history */

TITLE 'Count the number of loan applicants who submitted their';
TITLE2 'loan application without loan_history';
FOTENOTE '-------END-------';
PROC SQL;
SELECT COUNT(*) label = 'Number of Applicants' 
FROM LIB78601.TESTING_DS e
WHERE (e.loan_history eq . OR e.loan_history IS MISSING);
QUIT;

/* Step3: Find the statistics of applicants who submitted their 
loan application without loan_history */

TITLE 'Find the statistics of applicants who submitted their';
TITLE2 'loan application without loan_history';
FOTENOTE '-------END-------';
PROC SQL;
SELECT e.loan_history AS loan_history,  
	   COUNT(*) AS COUNTS   
FROM LIB78601.TESTING_DS e
WHERE (e.loan_history ne . OR e.loan_history IS NOT MISSING)
GROUP BY e.loan_history;
QUIT;

/* Step4: Save the statistics in a dataset */

PROC SQL;
CREATE TABLE LIB78601.TESTING_STAT_DS AS 
SELECT e.loan_history AS loan_history,  
	   COUNT(*) AS COUNTS   
FROM LIB78601.TESTING_DS e
WHERE (e.loan_history ne . OR e.loan_history IS NOT MISSING)
GROUP BY e.loan_history;
QUIT;


/* Step4.1: Create a backup dataset */
PROC SQL;
CREATE TABLE LIB78601.TESTING_BK_DS AS 
SELECT * 
FROM LIB78601.TESTING_DS;
QUIT;


/* Step5: Impute the missing value found in the categorical variable LOAN_HISTORY */
PROC SQL;
UPDATE LIB78601.TESTING_DS 
SET loan_history = ( SELECT t1.loan_history AS loan_history
					   FROM LIB78601.TESTING_STAT_DS t1 
					   WHERE COUNTS = ( SELECT MAX(t2.COUNTS) AS HIGHEST_COUNT
									    FROM LIB78601.TESTING_STAT_DS t2 ))
						     			/* sub-program to find highest count */
WHERE (loan_history = . OR loan_history IS MISSING);				
QUIT;


/* Step6: (AI) Obtain the information of loan applicants who submitted their 
loan application without loan_history */

TITLE '(AI) Obtain the information of loan applicants who submitted their';
TITLE2 'loan application without loan_history';
FOTENOTE '-------END-------';
PROC SQL;
SELECT *
FROM LIB78601.TESTING_DS e
WHERE (e.loan_history eq . OR e.loan_history IS MISSING);
QUIT;




/* Step1: Obtain the information of loan applicants who submitted their 
loan application without gender */

TITLE 'Obtain the information of loan applicants who submitted their';
TITLE2 'loan application without gender';
FOTENOTE '-------END-------';
PROC SQL;
SELECT *
FROM LIB78601.TESTING_DS e
WHERE (e.gender eq '' OR e.gender IS MISSING);
QUIT;

/* Step2: Count the number of loan applicants who submitted their 
loan application without gender */

TITLE 'Count the number of loan applicants who submitted their';
TITLE2 'loan application without gender';
FOTENOTE '-------END-------';
PROC SQL;
SELECT COUNT(*) label = 'Number of Applicants' 
FROM LIB78601.TESTING_DS e
WHERE (e.gender eq '' OR e.gender IS MISSING);
QUIT;

/* Step3: Find the statistics of applicants who submitted their 
loan application without gender */

TITLE 'Find the statistics of applicants who submitted their';
TITLE2 'loan application without gender';
FOTENOTE '-------END-------';
PROC SQL;
SELECT e.gender AS gender,  
	   COUNT(*) AS COUNTS   
FROM LIB78601.TESTING_DS e
WHERE (e.gender ne '' OR e.gender IS NOT MISSING)
GROUP BY e.gender;
QUIT;

/* Step4: Save the statistics in a dataset */

PROC SQL;
CREATE TABLE LIB78601.TESTING_STAT_DS AS 
SELECT e.gender AS gender,  
	   COUNT(*) AS COUNTS   
FROM LIB78601.TESTING_DS e
WHERE (e.gender ne '' OR e.gender IS NOT MISSING)
GROUP BY e.gender;
QUIT;


/* Step4.1: Create a backup dataset */
PROC SQL;
CREATE TABLE LIB78601.TESTING_BK_DS AS 
SELECT * 
FROM LIB78601.TESTING_DS;
QUIT;


/* Step5: Impute the missing value found in the categorical variable GENDER */
PROC SQL;
UPDATE LIB78601.TESTING_DS 
SET gender = ( SELECT t1.gender AS gender
					   FROM LIB78601.TESTING_STAT_DS t1 
					   WHERE COUNTS = ( SELECT MAX(t2.COUNTS) AS HIGHEST_COUNT
									    FROM LIB78601.TESTING_STAT_DS t2 ))
						     			/* sub-program to find highest count */
WHERE (gender eq '' OR gender IS MISSING);				
QUIT;


/* Step6: (AI) Obtain the information of loan applicants who submitted their 
loan application without gender */

TITLE '(AI) Obtain the information of loan applicants who submitted their';
TITLE2 'loan application without gender';
FOTENOTE '-------END-------';
PROC SQL;
SELECT *
FROM LIB78601.TESTING_DS e
WHERE (e.gender eq '' OR e.gender IS MISSING);
QUIT;




/* Step1: Obtain the information of loan applicants who submitted their 
loan application without employment */

TITLE 'Obtain the information of loan applicants who submitted their';
TITLE2 'loan application without employment';
FOTENOTE '-------END-------';
PROC SQL;
SELECT *
FROM LIB78601.TESTING_DS e
WHERE (e.employment eq '' OR e.employment IS MISSING);
QUIT;

/* Step2: Count the number of loan applicants who submitted their 
loan application without employment */

TITLE 'Count the number of loan applicants who submitted their';
TITLE2 'loan application without employment';
FOTENOTE '-------END-------';
PROC SQL;
SELECT COUNT(*) label = 'Number of Applicants' 
FROM LIB78601.TESTING_DS e
WHERE (e.employment eq '' OR e.employment IS MISSING);
QUIT;

/* Step3: Find the statistics of applicants who submitted their 
loan application without employment */

TITLE 'Find the statistics of applicants who submitted their';
TITLE2 'loan application without employment';
FOTENOTE '-------END-------';
PROC SQL;
SELECT e.employment AS employment,  
	   COUNT(*) AS COUNTS   
FROM LIB78601.TESTING_DS e
WHERE (e.employment ne '' OR e.employment IS NOT MISSING)
GROUP BY e.employment;
QUIT;

/* Step4: Save the statistics in a dataset */

PROC SQL;
CREATE TABLE LIB78601.TESTING_STAT_DS AS 
SELECT e.employment AS employment,  
	   COUNT(*) AS COUNTS   
FROM LIB78601.TESTING_DS e
WHERE (e.employment ne '' OR e.employment IS NOT MISSING)
GROUP BY e.employment;
QUIT;


/* Step4.1: Create a backup dataset */
PROC SQL;
CREATE TABLE LIB78601.TESTING_BK_DS AS 
SELECT * 
FROM LIB78601.TESTING_DS;
QUIT;


/* Step5: Impute the missing value found in the categorical variable EMPLOYMENT */
PROC SQL;
UPDATE LIB78601.TESTING_DS 
SET employment = ( SELECT t1.employment AS employment
					   FROM LIB78601.TESTING_STAT_DS t1 
					   WHERE COUNTS = ( SELECT MAX(t2.COUNTS) AS HIGHEST_COUNT
									    FROM LIB78601.TESTING_STAT_DS t2 ))
						     			/* sub-program to find highest count */
WHERE (employment eq '' OR employment IS MISSING);				
QUIT;


/* Step6: (AI) Obtain the information of loan applicants who submitted their 
loan application without employment */

TITLE '(AI) Obtain the information of loan applicants who submitted their';
TITLE2 'loan application without employment';
FOTENOTE '-------END-------';
PROC SQL;
SELECT *
FROM LIB78601.TESTING_DS e
WHERE (e.employment eq '' OR e.employment IS MISSING);
QUIT;





/* Step1:  List the detaild of the loan applicants who sumitted their 
applications without family members details*/

TITLE 'List the detaild of the loan applicants who sumitted their';
TITLE2 'applications without family members details';
FOTENOTE '-------END-------';
PROC SQL;
SELECT *
FROM LIB78601.TESTING_DS e
WHERE (e.family_members = '' OR e.family_members IS MISSING);
QUIT;


/* Step2: Count the number of loan applicants who submitted their 
loan application without family members */

TITLE 'Count the number of loan applicants who submitted their';
TITLE2 'loan application without family members';
FOTENOTE '-------END-------';
PROC SQL;
SELECT COUNT(*) label = 'Number of Applicants' 
FROM LIB78601.TESTING_DS e
WHERE (e.family_members = '' OR e.family_members IS MISSING);
QUIT;


/* Step3: List the details of loan applicants with '3+' family members */

TITLE 'List the details of loan applicants with '3+' family members';
FOTENOTE '-------END-------';
PROC SQL;
SELECT e.family_members label = 'Family Members', 
	   SUBSTR(e.family_members,1,1) label = 'The data found in the 1st position', 
	   SUBSTR(e.family_members,2,1) label = 'The data found in the 2nd position' 
FROM LIB78601.TESTING_DS e 
WHERE (e.family_members ne '' OR e.family_members IS NOT MISSING);
QUIT;


/* Step4: Create a backup dataset */
PROC SQL;
CREATE TABLE LIB78601.TESTING_BK_DS AS 
SELECT * 
FROM LIB78601.TESTING_DS;
QUIT;


/* Step5: Remove the '+' found in the family_members variable */

TITLE 'Remove the '+' found in the family_members variable';
FOTENOTE '-------END-------';
PROC SQL;
UPDATE LIB78601.TESTING_DS
SET family_members =  SUBSTR(family_members,1,1) 
WHERE SUBSTR(family_members,2,1) eq '+';
QUIT;


/* Step6: Show the statistics about family members variable */

PROC SQL;
SELECT e.family_members AS FAMILY_MEMBERS,  
	   COUNT(*) AS COUNTS   
FROM LIB78601.TESTING_DS e
WHERE (e.family_members ne ' ' OR e.family_members IS NOT MISSING)
GROUP BY e.family_members;
QUIT;


/* Step7: Save the statistics in a dataset */

PROC SQL;
CREATE TABLE LIB78601.TESTING_STAT_FM_DS AS 
SELECT e.family_members AS FAMILY_MEMBERS,  
	   COUNT(*) AS COUNTS   
FROM LIB78601.TESTING_DS e
WHERE (e.family_members ne ' ' OR e.family_members IS NOT MISSING)
GROUP BY e.family_members;
QUIT;


/* Step8: Impute the missing value found in the categorical variable FAMILY_MEMBERS */
PROC SQL;
UPDATE LIB78601.TESTING_DS 
SET family_members = ( SELECT t1.FAMILY_MEMBERS AS FAMILY_MEMBERS
					   FROM LIB78601.TESTING_STAT_FM_DS t1 
					   WHERE COUNTS = ( SELECT MAX(t2.COUNTS) AS HIGHEST_COUNT
									    FROM LIB78601.TESTING_STAT_FM_DS t2 ))
						     			/* sub-program to find highest count */
WHERE (family_members = '' OR family_members IS MISSING);				
QUIT;


/* Step9: (AI) List the detailds of the loan applicants who submitted their 
applications without family members details*/

TITLE '(AI) List the detaild of the loan applicants who sumitted their';
TITLE2 'applications without family members details';
FOTENOTE '-------END-------';
PROC SQL;
SELECT *
FROM LIB78601.TESTING_DS e
WHERE (e.family_members = '' OR e.family_members IS MISSING);
QUIT;


/* Step10: (AI) Count the number of loan applicants who submitted their 
loan application without family members */

TITLE '(AI) Count the number of loan applicants who submitted their';
TITLE2 'loan application without family members';
FOTENOTE '-------END-------';
PROC SQL;
SELECT COUNT(*) label = 'Number of Applicants' 
FROM LIB78601.TESTING_DS e
WHERE (e.family_members = '' OR e.family_members IS MISSING);
QUIT;




/* Step1: Obtain the information of loan applicants who submitted their 
loan application without loan_amount */

TITLE 'Obtain the information of loan applicants who submitted their';
TITLE2 'loan application without loan_amount';
FOTENOTE '-------END-------';
PROC SQL;
SELECT * 
FROM LIB78601.TESTING_DS e
WHERE (e.loan_amount EQ . OR e.loan_amount IS MISSING);
QUIT;

/* Step2: Count the number of loan applicants who submitted their 
loan application without loan_amount */

TITLE 'Count the number of loan applicants who submitted their';
TITLE2 'loan application without loan_amount';
FOTENOTE '-------END-------';
PROC SQL;
SELECT COUNT(*) label = 'Number of Applicants' 
FROM LIB78601.TESTING_DS e
WHERE (e.loan_amount EQ . OR e.loan_amount IS MISSING);
QUIT;

/* Create a backup dataset */
PROC SQL;
CREATE TABLE LIB78601.TESTING_BK_DS AS 
SELECT * 
FROM LIB78601.TESTING_DS;
QUIT;

/* Step3: Impute the missing value found in the
CONTINUOUS variable - loan_amount */

PROC STDIZE DATA =  LIB78601.TESTING_DS REPONLY
METHOD = MEAN OUT = LIB78601.TESTING_DS;
VAR loan_amount;
QUIT;

/* Step4: (AI) Obtain the information of loan applicants who submitted their 
loan application without loan_amount */

TITLE 'Obtain the information of loan applicants who submitted their';
TITLE2 'loan application without loan_amount';
FOTENOTE '-------END-------';
PROC SQL;
SELECT * 
FROM LIB78601.TESTING_DS e
WHERE (e.loan_amount EQ . OR e.loan_amount IS MISSING);
QUIT;

/* Step5: (AI) Count the number of loan applicants who submitted their 
loan application without loan_amount */

TITLE 'Count the number of loan applicants who submitted their';
TITLE2 'loan application without loan_amount';
FOTENOTE '-------END-------';
PROC SQL;
SELECT COUNT(*) label = 'Number of Applicants' 
FROM LIB78601.TESTING_DS e
WHERE (e.loan_amount EQ . OR e.loan_amount IS MISSING);
QUIT;





/* Step1: Obtain the information of loan applicants who submitted their 
loan application without loan_duration */

TITLE 'Obtain the information of loan applicants who submitted their';
TITLE2 'loan application without loan_duration';
FOTENOTE '-------END-------';
PROC SQL;
SELECT * 
FROM LIB78601.TESTING_DS e
WHERE (e.loan_duration EQ . OR e.loan_duration IS MISSING);
QUIT;

/* Step2: Count the number of loan applicants who submitted their 
loan application without loan_duration */

TITLE 'Count the number of loan applicants who submitted their';
TITLE2 'loan application without loan_duration';
FOTENOTE '-------END-------';
PROC SQL;
SELECT COUNT(*) label = 'Number of Applicants' 
FROM LIB78601.TESTING_DS e
WHERE (e.loan_duration EQ . OR e.loan_duration IS MISSING);
QUIT;

/* Create a backup dataset */
PROC SQL;
CREATE TABLE LIB78601.TESTING_BK_DS AS 
SELECT * 
FROM LIB78601.TESTING_DS;
QUIT;

/* Step3: Impute the missing value found in the
CONTINUOUS variable - loan_duration */

PROC STDIZE DATA =  LIB78601.TESTING_DS REPONLY
METHOD = MEAN OUT = LIB78601.TESTING_DS;
VAR loan_duration;
QUIT;

/* Step4: (AI) Obtain the information of loan applicants who submitted their 
loan application without loan_duration */

TITLE 'Obtain the information of loan applicants who submitted their';
TITLE2 'loan application without loan_duration';
FOTENOTE '-------END-------';
PROC SQL;
SELECT * 
FROM LIB78601.TESTING_DS e
WHERE (e.loan_duration EQ . OR e.loan_duration IS MISSING);
QUIT;

/* Step5: (AI) Count the number of loan applicants who submitted their 
loan application without loan_duration */

TITLE 'Count the number of loan applicants who submitted their';
TITLE2 'loan application without loan_duration';
FOTENOTE '-------END-------';
PROC SQL;
SELECT COUNT(*) label = 'Number of Applicants' 
FROM LIB78601.TESTING_DS e
WHERE (e.loan_duration EQ . OR e.loan_duration IS MISSING);
QUIT;




/* CREATION OF MODEL USING LOGISTIC REGRESSION */

PROC LOGISTIC DATA = LIB78601.TRAINING_DS OUTMODEL= LIB78601.TRAINING_DS_LR_MODEL;
CLASS	
	GENDER
	MARITAL_STATUS
	FAMILY_MEMBERS
	QUALIFICATION
	EMPLOYMENT
	LOAN_HISTORY
	LOAN_LOCATION
	;
	
MODEL LOAN_APPROVAL_STATUS = 
	GENDER
	MARITAL_STATUS
	FAMILY_MEMBERS
	QUALIFICATION
	EMPLOYMENT
	CANDIDATE_INCOME
	GUARANTEE_INCOME
	LOAN_AMOUNT
	LOAN_DURATION
	LOAN_HISTORY
	LOAN_LOCATION
	;
OUTPUT OUT = LIB78601.TRAINING_OUT_DS P = PPRED_PROB;
/********************************************************
PPRED_PROB = predicted probability - variable to hold predicted probability
OUT = the output will be stored in the dataset
Akaike Information Criteria must (AIC) < SC (Schwarz Criterion)
If Pr > ChiSq is <= 0.05, it means that that independent variable is an
important variable and as is truely contributing to predict dependent variable
********************************************************/
RUN;





/********************************************************

Predict the loan approval status using the model created

********************************************************/

PROC LOGISTIC INMODEL = LIB78601.TRAINING_DS_LR_MODEL; /* The model that created*/
SCORE DATA = LIB78601.TESTING_DS /* Test dataset*/
OUT = LIB78601.TESTING_LAS_PRED_78601_DS; /* Location of output*/
QUIT;




TITLE 'Display the details of the loan approval status predicted';
FOTENOTE '-------END-------';

PROC SQL;
SELECT * 
FROM LIB78601.TESTING_LAS_PRED_78601_DS;
QUIT;



/* Generate the report using SAS ODS - output delivery/display system
Display the details of the loan approval status predicted */


ODS HTML CLOSE;
ODS PDF CLOSE;
/* Determine the physical location of pdf*/ 
ODS PDF FILE = "/home/u63691871/DAP_FT_MAR_2024_TP078601/LAS78601_report.pdf";
OPTIONS NODATE;
TITLE1 'Bank loan approval status predicted';
TITLE2 'APU, TPM';
PROC REPORT DATA = LIB78601.TESTING_LAS_PRED_78601_DS NOWINDOWS;
BY SME_LOAN_ID_NO;
DEFINE SME_LOAN_ID_NO / GROUP 'Loan ID';
DEFINE GENDER / GROUP 'Gender Name';
DEFINE MARITAL_STATUS / GROUP 'Marital Status';
DEFINE FAMILY_MEMBERS / GROUP 'Family Members';
DEFINE CANDIDATE_INCOME / GROUP 'Candidate Income';
DEFINE GUARANTEE_INCOME / GROUP 'Co-Applicant Income';
DEFINE LOAN_AMOUNT / GROUP 'Loan Amount';
DEFINE LOAN_DURATION / GROUP 'Loan Duration';
DEFINE LOAN_HISTORY / GROUP 'Loan History';
DEFINE LOAN_LOCATION / GROUP 'Loan Location';
FOOTNOTE '-----End of Report-----';
RUN;




/***
LIB78601.TESTING_LAS_PRED_78601_DS
***/


/* Data Visualization using SAS code
graphical representation of information and data*/


/* SAS Simple Bar Chart*/

PROC SGPLOT DATA = LIB78601.TESTING_LAS_PRED_78601_DS;
VBAR loan_location;
TITLE 'Loan Applicants by Loan Location';
RUN;


/* Bar Chart
   The groups were stacked one above the other */

TITLE 'Number of family members by loan location';
PROC SGPLOT DATA = LIB78601.TESTING_LAS_PRED_78601_DS;
VBAR family_members/group = loan_location groupdisplay = cluster;
LABEL family_members = 'Number of family members';
RUN;


/* Pie Chart
   A pie-chart is a representation of values as slices of a circle with different colours */

TITLE 'Loan Approval Status';
PROC GCHART DATA = LIB78601.TESTING_LAS_PRED_78601_DS;
pid3d I_LOAN_APPROVAL_STATUS;
RUN;
QUIT;

GOPTIONS RESET = ALL BORDER;
TITLE 'family members VS loan location';
PROC GCHART DATA = LIB78601.TESTING_LAS_PRED_78601_DS;
pie family_members/detail = loan_location
detail_percent = best
detail_value = none
detail_slice = best
detail_threshold = 2
legend;
RUN;
QUIT;




















