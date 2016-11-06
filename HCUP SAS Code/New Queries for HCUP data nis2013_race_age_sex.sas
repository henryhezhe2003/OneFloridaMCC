
 /***********************************************************************
 New Queries for HCUP data for NIS2013 classified by sex, race, and age

query	sex	age	race	Calendar Year	Enc_TYPE CDM
1	male	6574	NHW	2013	Inpatient or ED leads to Inpatient
2	male	6574	NHB	2013	Inpatient or ED leads to Inpatient
3	male	6574	HIS	2013	Inpatient or ED leads to Inpatient
4	male	6574	API	2013	Inpatient or ED leads to Inpatient
5	male	7584	NHW	2013	Inpatient or ED leads to Inpatient
6	male	7584	NHB	2013	Inpatient or ED leads to Inpatient
7	male	7584	HIS	2013	Inpatient or ED leads to Inpatient
8	male	7584	API	2013	Inpatient or ED leads to Inpatient
9	male	85up	NHW	2013	Inpatient or ED leads to Inpatient
10	male	85up	NHB	2013	Inpatient or ED leads to Inpatient
11	male	85up	HIS	2013	Inpatient or ED leads to Inpatient
12	male	85up	API	2013	Inpatient or ED leads to Inpatient
13	female	6574	NHW	2013	Inpatient or ED leads to Inpatient
14	female	6574	NHB	2013	Inpatient or ED leads to Inpatient
15	female	6574	HIS	2013	Inpatient or ED leads to Inpatient
16	female	6574	API	2013	Inpatient or ED leads to Inpatient
17	female	7584	NHW	2013	Inpatient or ED leads to Inpatient
18	female	7584	NHB	2013	Inpatient or ED leads to Inpatient
19	female	7584	HIS	2013	Inpatient or ED leads to Inpatient
20	female	7584	API	2013	Inpatient or ED leads to Inpatient
21	female	85up	NHW	2013	Inpatient or ED leads to Inpatient
22	female	85up	NHB	2013	Inpatient or ED leads to Inpatient
23	female	85up	HIS	2013	Inpatient or ED leads to Inpatient
24	female	85up	API	2013	Inpatient or ED leads to Inpatient

This sas code is for freq table on gender*race*age
*************************************************************************/ 

LIBNAME NIS13 "V:\unzipHCUP_Zhe\NIS2013\NIS2013_SAS";
LIBNAME NIS13D  "V:\unzipHCUP_Zhe\NIS2013\NIS2013_SAS\types_diseases";
%include "V:\unzipHCUP_Zhe\NIS2013\NIS2013_SAS\codes\Proc format for HCUP age gender  race.sas";

/***************************************
 Prevalence of MCC with ONE condition
***************************************/
/*-----------------------------------
   Types of diseases and disorders 
-----------------------------------*/
/*1.  ACQUIRED HYPOTHYROIDISM */ 
%LET name1= ACQUIRED_HYPOTH;
%LET disease_indx1=1;

/*2.  ACUTE MYOCARDIAL INFARCTION */ 
%LET name2= MYOCARDIAL_INFAR;
%LET disease_indx2=2;

/*3. ALZHEIMERS DISEASE */
%LET name3= ALZHEIMERS;
%LET disease_indx3=3;

/*4.  ALZHEIMERS DISEASE AND RELATED DISORDERS OR SENILE DEMENTIA */
%LET name4= ALZH_SENILE_DEMENTIA ;
%LET disease_indx4=4;

/*5. ANEMIA */ 
%LET name5= ANEMIA;
%LET disease_indx5=5;

/*6. ASTHMA */ 
%LET name6= ASTHMA;
%LET disease_indx6=6;

/*7. ATRIAL FIBRILLATION */ 
%LET name7= ATRIAL_FIBRILLATION;
%LET disease_indx7=7;

/*8. BENIGN PROSTATIC HYPERPLASIA */
%LET name8= BENIGN_PRO_HYPERPLASIA;
%LET disease_indx8=8;

/*9. CATARACT */
%LET name9= CATARACT;
%LET disease_indx9=9;

/*10. CHRONIC KIDNEY DISEASE */ 
%LET name10= CHRO_KIDNEY_DISEASE;
%LET disease_indx10=10;

/*11. CHRONIC OBSTRUCTIVE PULMONARY DISEASE AND BRONCHIECTASIS */
%LET name11= OBST_PUL_BRONCHIECTASIS;
%LET disease_indx11=11;

/*12. DEPRESSION */
%LET name12= DEPRESSION;
%LET disease_indx12=12;

/*13. DIABETES */
%LEt name13= DIABETES;
%LET disease_indx13=13;

/*14. GLAUCOMA */
%LET name14= GLAUCOMA;
%LET disease_indx14=14;

/*15. HEART FAILURE */ 
%LET name15= HEART_FAILURE;
%LET disease_indx15=15;

/*16. HIP/PELVIC FRACTURE */
%LET name16= HIP_PELVIC_FRACTURE;
%LET disease_indx16=16;

/*17. HYPERLIPIDEMIA */ 
%LET name17= HYPERLIPIDEMIA;
%LET disease_indx17=17;


/*18. HYPERTENSION */ 
%LET name18= HYPERTENSION;
%LET disease_indx18=18;


/*19. ISCHEMIC HEART DISEASE */ 
%LET name19= ISCH_HEART_DISEASE;
%LET disease_indx19=19;


/*20. OSTEOPOROSIS */
%LET name20= OSTEOPOROSIS;
%LET disease_indx20=20;

/*21. RA/OA (RHEUMATOID ARTHRITIS/OSTEOARTHRITIS) */
%LET name21= RA_OA;
%LET disease_indx21=21;


/*22. STROKE/TRANSIENT ISCHEMIC ATTACK */
%LET name22= STROKE_TRAN_ISCH_ATTACK;
%LET disease_indx22=22;


/*23.  FEMALE / MALE BREAST CANCER */ 
%LET name23= BREAST_CANCER;
%LET disease_indx23=23;



/*24. COLORECTAL CANCER */ 
%LET name24= COLORECTAL_CANCER;
%LET disease_indx24=24;


/*25. PROSTATE CANCER */ 
%LET name25= PROSTATE_CANCER;
%LET disease_indx25=25;


/*26. LUNG CANCER */ 
%LET name26= LUNG_CANCER;
%LET disease_indx26=26;


/*27. ENDOMETRIAL CANCER */
%LET name27= ENDOMETRIAL_CANCER;
%LET disease_indx27=27;



%macro MCC1_catorical_sex_age_race(dat);

data catorical_sex_age_race;
set NIS13D.&dat;
format SEX sexfmt. RACE racefmt. AGE agefmt.;
if MCC_count1_25>0 ;
if race>4 then delete;
run;

title "disease codition is &dat";
ods pdf file="V:\unzipHCUP_Zhe\NIS2013\HCUP2013_and_OneFlorida\HCUP_2013_sex_race_age_103116\MCC1_&dat._HCUP_2013_sex_race_age_103116.pdf";
proc freq data=catorical_sex_age_race ;
tables sex*race*age/ nopercent;
run;
ods pdf close;

%mend MCC1_catorical_sex_age_race;

%MCC1_catorical_sex_age_race(&name1);
%MCC1_catorical_sex_age_race(&name2);
%MCC1_catorical_sex_age_race(&name3);
%MCC1_catorical_sex_age_race(&name4);
%MCC1_catorical_sex_age_race(&name5);
%MCC1_catorical_sex_age_race(&name6);
%MCC1_catorical_sex_age_race(&name7);
%MCC1_catorical_sex_age_race(&name8);
%MCC1_catorical_sex_age_race(&name9);
%MCC1_catorical_sex_age_race(&name10);
%MCC1_catorical_sex_age_race(&name11);
%MCC1_catorical_sex_age_race(&name12);
%MCC1_catorical_sex_age_race(&name13);
%MCC1_catorical_sex_age_race(&name14);
%MCC1_catorical_sex_age_race(&name15);
%MCC1_catorical_sex_age_race(&name16);
%MCC1_catorical_sex_age_race(&name17);
%MCC1_catorical_sex_age_race(&name18);
%MCC1_catorical_sex_age_race(&name19);
%MCC1_catorical_sex_age_race(&name20);
%MCC1_catorical_sex_age_race(&name21);
%MCC1_catorical_sex_age_race(&name22);
%MCC1_catorical_sex_age_race(&name23);
%MCC1_catorical_sex_age_race(&name24);
%MCC1_catorical_sex_age_race(&name25);
%MCC1_catorical_sex_age_race(&name26);
%MCC1_catorical_sex_age_race(&name27);


/* title "disease codition is &name1";
proc tabulate data =catorical_sex_age_race ;
class  sex race age ;
table sex,race, age;
run; */





