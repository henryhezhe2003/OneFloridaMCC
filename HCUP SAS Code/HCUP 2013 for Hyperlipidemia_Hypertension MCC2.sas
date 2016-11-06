proc format;
value agefmt
65 - 74 = '65-74'
75 - 84 = '75-84'
85 - high = '85+'
;
run;

proc format;
value sexfmt
1 = 'F'
0 = 'M'
;
run;


proc format;
value racefmt
1 = 'White'
2 = 'Black'
3 = 'Hispanic'
4 = 'Asian/PI'
5 = 'others'
6 = 'others'
;
run;



LIBNAME NIS13D "V:\unzipHCUP_Zhe\NIS2013\NIS2013_SAS\Types_Diseases";
LIBNAME NIS13 "V:\unzipHCUP_Zhe\NIS2013\NIS2013_SAS";
LIBNAME HCUP "V:\unzipHCUP_Zhe\NIS2013\HCUP2013_and_OneFlorida\HCUP_2013_results_101116\ONE_DX1_25";
LIBNAME OneFL "V:\unzipHCUP_Zhe\NIS2013\HCUP2013_and_OneFlorida\MCC_OneFlorida_080516";

proc contents data=one;
run;

data one;
set NIS13d.hypertension;
run;  /*2497676*/
         
data two;
set NIS13d.Hyperlipidemia;
run; /*2497676*/

data one1;
set one;
if MCC_count1_25>0 and age_indx>0;
keep PATID age age_index Hispanic race sex condition MCC_count1_25 disease_indx;
run;  /* 1868149*/


data two1;
set two;
if MCC_count1_25>0 and age_indx>0;
keep PATID age age_index Hispanic race sex condition MCC_count1_25 disease_indx;
run; /*1124402*/

proc sort data=one1;
by PATID;
run;


proc sort data=two1;
by PATID;
run;

data one1;
set one1;
rename condition=conditon1
       disease_indx=disease_indx1;
run;


data two1;
set two1;
rename condition=conditon2
       disease_indx=disease_indx2;
run;

/*----------------------*/
PROC SQL;
CREATE TABLE NIS13.HCUP_Hyperlipidemia_Hypertension AS
SELECT A.*, B.conditon2, B.disease_indx2
FROM one1 A, two1 B
WHERE A.PATID=B.PATID
ORDER BY PATID;
QUIT; /* 960388 */

data NIS13.HCUP_Hyper_age;  /* continuous variable*/
set NIS13.HCUP_Hyperlipidemia_Hypertension;
keep age;
run;  /* 960388*/


/*age mean and std*/
proc means data=NIS13.HCUP_Hyper_age MEAN std MAXDEC=3;
run;


data NIS13.HCUP_Hyper;
set NIS13.HCUP_Hyperlipidemia_Hypertension;
cat_age=age;
format cat_age agefmt.  race racefmt. ;
run;


proc freq data=NIS13.HCUP_Hyper;
tables race;
run;


proc freq data=NIS13.HCUP_Hyper;
tables cat_age;
run;

data NIS13.HCUP_Hyper;
set NIS13.HCUP_Hyper;
format sex sexfmt.;
run;

proc freq data=NIS13.HCUP_Hyper;
tables sex ;
run;

/*From HCUP
HYPERLIPIDEMIA	HYPERTENSION	960388
From OneFL
HYPERLIPIDEMIA	HYPERTENSION	187562 */

