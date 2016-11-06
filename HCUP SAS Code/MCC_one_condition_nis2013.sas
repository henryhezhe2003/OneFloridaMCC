
 /****************************************************
* CREATE A TABLE HCUP.dbo.PATIENT_CONDITION 
* (PATID, AGE, SEX, HISPANIC, RACE, CONDITION, C_WT); 
* 'C_WT' IS USED FOR CALCULATING COMORBIDITY INDEX 
******************************************************/ 

LIBNAME NIS13 "V:\unzipHCUP_Zhe\NIS2013\NIS2013_SAS";
LIBNAME NIS13D  "V:\unzipHCUP_Zhe\NIS2013\NIS2013_SAS\types_diseases";


/* Create a dummy variable, "HISPANIC=1" if race=3 */
data NIS13.NIS2013CORE_hispanic;
set NIS13.NIS_2013_CORE;
if race=3 then HISPANIC=1;
else HISPANIC=0;
run;

/* N (obs) = 7119563 */

/* Create a table HCUP.dbo.PATIENT_CONDITION 
(PATID, AGE, SEX, HISPANIC, RACE, CONDITION, C_WT); 
'C_WT' IS USED FOR CALCULATING COMORBIDITY INDEX; 
'C1-C7' IS USED FOR CHECKING CONDITION (among DX1-DX7)INDEX 
 */ 

/* SEX=1 if SEX is female*/
/* SEX=0 if SEX is male*/
PROC SQL; 
CREATE TABLE NIS13.HCUP_DAT AS
SELECT KEY_NIS as PATID, AGE, FEMALE as SEX, RACE, HISPANIC,
       DX1, DX2, DX3, DX4, DX5, DX6, DX7, 
	   DX8, DX9, DX10, DX11, DX12, DX13, DX14, 
	   DX15, DX16, DX17, DX18, DX19, DX20, DX21, 
	   DX22, DX23, DX24, DX25, 
       "DISEASE_CONDITION" as CONDITION, 
       0 as C1, 
       0 as C2, 
	   0 as C3,
	   0 as C4, 
       0 as C5, 
	   0 as C6,
	   0 as C7,
	   0 as C8, 
       0 as C9, 
	   0 as C10,
	   0 as C11, 
       0 as C12, 
	   0 as C13,
	   0 as C14,
	   0 as C15,
	   0 as C16, 
       0 as C17, 
	   0 as C18,
	   0 as C19,
	   0 as C20, 
       0 as C21, 
	   0 as C22,
	   0 as C23,
	   0 as C24,
	   0 as C25, 
       0 as C_WT,
       case
	   WHEN age>=65 then 1 ELSE 0
	   end as AGE_indx
FROM NIS13.NIS2013CORE_hispanic;
QUIT;

/*-------------------------------
   Creating one condition
---------------------------------*/

/* Subset for short computation*/
/* delete later */
/*data NIS13.subdat;
set NIS13.HCUP_dat;
if PATID<50000000;
run;*/


/***********************************************************
Macro "_squote(list = )" :
Parse the &list macro variable into a macro array &&d&num 
Build quoted macro string &in_str from &list macro variable 
Written here as a macro function - returns %unquote(&in_str) 
**************************************************************/
%macro _squote(list = );
%global num; /* also returns &num */
%let list = %upcase(&list);
%let num=1;
%let in_str=;
%do %while(%scan(&list, &num, %str( )) ne);
%let d&num = %scan(&list, &num, %str( ));
%let in_str = &in_str&&d&num;
%let num = %eval(&num+1);
%if %scan(&list, &num, %str( )) ne
%then %let in_str = &in_str%str( );
%end;
%let num = %eval(&num-1);
%str( )&in_str%str( )
%mend _squote;

/***************************************
 Prevalence of MCC with ONE condition
***************************************/
/*-----------------------------------
   Types of diseases and disorders 
-----------------------------------*/
/*1.  ACQUIRED HYPOTHYROIDISM */ 
%LET name1= ACQUIRED_HYPOTH;
%LET c_dx1='2440' '2441' '2442' '2443' '2448' '2449';
%LET disease_indx1=1;

/*2.  ACUTE MYOCARDIAL INFARCTION */ 
%LET name2= MYOCARDIAL_INFAR;
%LET c_dx2='41001' '41011' '41021' '41031' '41041' '41051' '41061' '41071' '41081' '41091';
%LET disease_indx2=2;

/*3. ALZHEIMERS DISEASE */
%LET name3= ALZHEIMERS;
%LET c_dx3='3310';
%LET disease_indx3=3;

/*4.  ALZHEIMERS DISEASE AND RELATED DISORDERS OR SENILE DEMENTIA */
%LET name4= ALZH_SENILE_DEMENTIA ;
%LET c_dx4='3310' '33111' '33119' '3312' '3317' '2900' '29010' '29011' '29012' '29013' 
           '29020' '29021' '2903' '29040' '29043' '2940' '29410' '29411' '29420' '29421' '2948' '797';
%LET disease_indx4=4;

/*5. ANEMIA */ 
%LET name5= ANEMIA;
%LET c_dx5='2800' '2801' '2808' '2809' '2810' '2811' '2812' '2813' '2814' '2818' '2819' '2820' '2821' '2822' 
           '2823' '28240' '28241' '28242' '28243' '28244' '28245' '28246' '28247' '28249' '2825' '28260' 
           '28261' '28262' '28263' '28264' '28268' '28269' '2830' 
           '28310' '28311' '28319' '2832' '2839' '28401' '28409' '28411' '28412' '28419' 
           '2842' '28481' '28489' '2850' '2851' '28521' '28522' '28529' '2853' '2858' '2859';
%LET disease_indx5=5;

/*6. ASTHMA */ 
%LET name6= ASTHMA;
%LET c_dx6='49300' '49301' '49302' '49310' '49311' '49312' '49320' '49321' '49322' '49381' '49382' '49390' '49391' '49392';
%LET disease_indx6=6;

/*7. ATRIAL FIBRILLATION */ 
%LET name7= ATRIAL_FIBRILLATION;
%LET c_dx7='42731';
%LET disease_indx7=7;

/*8. BENIGN PROSTATIC HYPERPLASIA */
%LET name8= BENIGN_PRO_HYPERPLASIA;
%LET c_dx8='6000' '60001' '60011' '60020' '60021' '6003' '60090' '60091';
%LET disease_indx8=8;

/*9. CATARACT */
%LET name9= CATARACT;
%LET c_dx9='36601' '36602' '36603' '36604' '36609' '36610' '36612' '36613' '36614'
           '36615' '36616' '36617' '36618' '36619' '36620' '36621' '36622' '36623' 
           '36630' '36645' '36646' '36650' '36651' '36652' '36653' '3668' '3669' 
           '37926' '37939' '74330' '74331' '74332' '74333' 'V431';
%LET disease_indx9=9;

/*10. CHRONIC KIDNEY DISEASE */ 
%LET name10= CHRO_KIDNEY_DISEASE;
%LET c_dx10='01600' '01601' '01602' '01603' '01604' '01605' '01606' '0954' '1890' '1899' 
            '2230'  '23691' '24940' '24941' '25040' '25041' '25042' '25043' '2714' '27410' 
            '28311' '40301' '40311' '40391' '40402' '40403' '40412' '40413' '40492' '40493' 
            '4401'  '4421' '5724' '5800' '5804' '58081' '58089' '5809' '5810' '5811' '5812' 
            '5813'  '58181' '58189' '5819' '5820' '5821' '5822' '5824' '58281' '58289' '5829' 
            '5830'  '5831' '5832' '5834' '5836' '5837' '58381' '58389' '5839' '5845' '5846' 
            '5847' '5848' '5849' '5851' '5852' '5853' '5854' '5855' '5856' '5859' '586' '587' 
            '5880' '5881' '58881' '58889' '5889' '591' '75312' '75313' '75314' '75315' '75316' 
            '75317' '75319' '75320' '75321' '75322' '75323' '75329' '7944';
%LET disease_indx10=10;

/*11. CHRONIC OBSTRUCTIVE PULMONARY DISEASE AND BRONCHIECTASIS */
%LET name11= OBST_PUL_BRONCHIECTASIS;
%LET c_dx11='490' '4910' '4911' '4918' '4919' '4920' '4928' '49120' '49121' '49122' '4940' '4941' '496';
%LET disease_indx11=11;

/*12. DEPRESSION */
%LET name12= DEPRESSION;
%LET c_dx12='29620' '29621' '29622' '29623' '29624' '29625' '29626' '29630' '29631' '29632' '29633' '29634' 
            '29635' '29636' '29650' '29651' '29652' '29653' '29654' '29655' '29656' '29660' '29661' '29662' 
            '29663' '29664' '29665' '29666' '29689' '2980' '3004' '3091' '311';
%LET disease_indx12=12;

/*13. DIABETES */
%LEt name13= DIABETES;
%LET c_dx13='24900' '24901' '24910' '24911' '24920' '24921' '24930' '24931' '24940' '24941' '24950' '24951' 
            '24960' '24961' '24970' '24971' '24980' '24981' '24990' '24991' '25000' '25001' '25002' '25003' 
            '25010' '25011' '25012' '25013' '25020' '25021' '25022' '25023' '25030' '25031' '25032' '25033' 
            '25040' '25041' '25042' '25043' '25050' '25051' '25052' '25053' '25060' '25061' '25062' '25063' 
            '25070' '25071' '25072' '25073' '25080' '25081' '25082' '25083' '25090' '25091' '25092' '25093' 
            '3572' '36201' '36202' '36203' '36204' '36205' '36206' '36641';
%LET disease_indx13=13;

/*14. GLAUCOMA */
%LET name14= GLAUCOMA;
%LET c_dx14='36285' '36500' '36501' '36502' '36503' '36504' '36510' '36511' '36512' '36513' '36515' '36520' '36521' 
            '36522' '36523' '36524' '36531' '36532' '36541' '36542' '36543' '36551' '36552' '36559' '36560' '36561' 
            '36562' '36563' '36564' '36565' '36581' '36582' '36583' '36589' '3659' '37714';
%LET disease_indx14=14;

/*15. HEART FAILURE */ 
%LET name15= HEART_FAILURE;
%LET c_dx15='39891' '40201' '40211' '40291' '40401' '40403' '40411' '40413' '40491' '40493' '4280' '4281' 
            '42820' '42821' '42822' '42823' '42830' '42831' '42832' '42833' '42840' '42841' '42842' 
            '42843' '4289';
%LET disease_indx15=15;

/*16. HIP/PELVIC FRACTURE */
%LET name16= HIP_PELVIC_FRACTURE;
%LET c_dx16='73314' '73315' '73396' '73397' '73398' '8080' '8081' '8082' '8083' '80841' '80842' 
            '80843' '80844' '80849' '80851' '80852' '80853' '80854' '80859' '8088' '8089' '82000' 
            '82001' '82002' '82003' '82009' '82010' '82011' '82012' '82013' '82019' '82020' '82021' 
            '82022' '82030' '82031' '82032' '8208' '8209';
%LET disease_indx16=16;

/*17. HYPERLIPIDEMIA */ 
%LET name17= HYPERLIPIDEMIA;
%LET c_dx17='2720' '2721'  '2722'  '2723'  '2724';
%LET disease_indx17=17;


/*18. HYPERTENSION */ 
%LET name18= HYPERTENSION;
%LET c_dx18='36211' '4010' '4011' '4019' '40200' '40201' '40210' '40211' '40290' '40291' '40300' 
            '40301' '40310' '40311' '40390' '40391' '40400' '40401' '40402' '40403' '40410' '40411' 
            '40412' '40413' '40490' '40491' '40492' '40493' '40501' '40509' '40511' '40519' '40591' '40599' '4372';
%LET disease_indx18=18;


/*19. ISCHEMIC HEART DISEASE */ 
%LET name19= ISCH_HEART_DISEASE;
%LET c_dx19='41000' '41001' '41002' '41010' '41011' '41012' '41020' '41021' '41022' '41030' '41031' '41032' 
            '41040' '41041' '41042' '41050' '41051' '41052' '41060' '41061' '41062' '41070' '41071' '41072' 
            '41080' '41081' '41082' '41090' '41091' '41092' '4110' '4111' '41181' '41189' '412' '4130' 
            '4131' '4139' '41400' '41401' '41402' '41403' '41404' '41405' '41406' '41407' '41412' '4142' 
            '4143' '4144' '4148' '4149';
%LET disease_indx19=19;


/*20. OSTEOPOROSIS */
%LET name20= OSTEOPOROSIS;
%LET c_dx20='73300'  '73301'  '73302'  '73303'  '73309';
%LET disease_indx20=20;

/*21. RA/OA (RHEUMATOID ARTHRITIS/OSTEOARTHRITIS) */
%LET name21= RA_OA;
%LET c_dx21='7140' '7141' '7142' '71430' '71431' '71432' '71433' '71500' '71504' '71509' '71510' 
            '71511' '71512' '71513' '71514' '71515' '71516' '71517' '71518' '71520' '71521' '71522' 
            '71523' '71524' '71525' '71526' '71527' '71528' '71530' '71531' '71532' '71533' '71534' 
            '71535' '71536' '71537' '71538' '71580' '71589' '71590' '71591' '71592' '71593' '71594' 
            '71595' '71596' '71597' '71598' '7200' '7210' '7211' '7212' '7213' '72190' '72191';
%LET disease_indx21=21;


/*22. STROKE/TRANSIENT ISCHEMIC ATTACK */
%LET name22= STROKE_TRAN_ISCH_ATTACK;
%LET c_dx22='430' '431' '43301' '43311' '43321' '43331' '43381' '43391' '43400' '43401' '43410' 
            '43411' '43490' '43491' '4350' '4351' '4353' '4358' '4359' '436' '99702';
%LET disease_indx22=22;


/*23.  FEMALE / MALE BREAST CANCER */ 
%LET name23= BREAST_CANCER;
%LET c_dx23='1740' '1741' '1742' '1743' '1744' '1745' '1746' '1748' '1749' '1750' '1759' '2330' 'V103';
%LET disease_indx23=23;



/*24. COLORECTAL CANCER */ 
%LET name24= COLORECTAL_CANCER;
%LET c_dx24='1530' '1531' '1532' '1533' '1534' '1535' '1536' '1537' '1538' '1539' '1540' '1541' '2303' 
             '2304' 'V1005' 'V1006' '153.0' '1531' '1532' '1533' '1534' '1535' '1536' '1537' '1538' '1539' 
             '1540' '1541' '2303' '2304' 'V1005' 'V1006' ;
%LET disease_indx24=24;


/*25. PROSTATE CANCER */ 
%LET name25= PROSTATE_CANCER;
%LET c_dx25='185' '2334' 'V1046' ;
%LET disease_indx25=25;


/*26. LUNG CANCER */ 
%LET name26= LUNG_CANCER;
%LET c_dx26='1622' '1623' '1624' '1625' '1628' '1629' '2312' 'V1011';
%LET disease_indx26=26;


/*27. ENDOMETRIAL CANCER */
%LET name27= ENDOMETRIAL_CANCER;
%LET c_dx27='1820'  '2332'  'V1042';
%LET disease_indx27=27;


/********************************
 Create dataset 
*********************************/
%macro _repeat;
	%macro MCC_CASE(DX, CC, list=&c_dx);
	    case
		WHEN &DX in(%unquote(%_squote(list = &list))) then 1  ELSE 0  end as &CC
	%mend MCC_CASE;

	PROC SQL; 
		CREATE TABLE &name AS
		SELECT Distinct PATID,  AGE , AGE_indx, SEX ,RACE, HISPANIC, 1 as C_WT, "&name" as CONDITION, 
		%MCC_CASE(DX1 , C1), %MCC_CASE(DX2 , C2), %MCC_CASE(DX3 , C3), %MCC_CASE(DX4 , C4), %MCC_CASE(DX5 , C5), 
	    %MCC_CASE(DX6 , C6), %MCC_CASE(DX7 , C7), %MCC_CASE(DX8 , C8),%MCC_CASE(DX9 , C9),%MCC_CASE(DX10 , C10),
        %MCC_CASE(DX11 , C11), %MCC_CASE(DX12 , C12), %MCC_CASE(DX13 , C13),%MCC_CASE(DX14 , C14),%MCC_CASE(DX15 , C15),
		%MCC_CASE(DX16 , C16), %MCC_CASE(DX17 , C17), %MCC_CASE(DX18 , C18),%MCC_CASE(DX19 , C19),%MCC_CASE(DX20 , C20),
	    %MCC_CASE(DX21 , C21), %MCC_CASE(DX22 , C22), %MCC_CASE(DX23 , C23),%MCC_CASE(DX24 , C24),%MCC_CASE(DX25 , C25)
		FROM NIS13.HCUP_DAT;
	 QUIT;
	/* age>=65 and sum of C1-C25  */
	 data NIS13D.&name ;
	 set &name ;
	 if age_indx>0;
	 MCC_count1_18=SUM (of C1-C18);
	 MCC_count19_25=SUM (of C19-C25);
	 MCC_count1_25=SUM (of C1-C25);
	 disease_indx=&disease_indx;
	run;
/*	proc sort data=NIS13D.&name out=NIS13D.&name ;
	by PATID;
	run;*/
%mend;

/*----creating each dataset-------------------------*/
%LET name=&name1;      
%LET c_dx=&c_dx1;
%LET disease_indx=&disease_indx1;
%_repeat;  /* n1=2497676 */

%LET name=&name2; 
%LET c_dx=&c_dx2;
%LET disease_indx=&disease_indx2; 
%_repeat;

%LET name=&name3; 
%LET c_dx=&c_dx3;
%LET disease_indx=&disease_indx3; 
%_repeat;


%LET name=&name4; 
%LET c_dx=&c_dx4;
%LET disease_indx=&disease_indx4; 
%_repeat;


%LET name=&name5; 
%LET c_dx=&c_dx5;
%LET disease_indx=&disease_indx5; 
%_repeat;


%LET name=&name6; 
%LET c_dx=&c_dx6;
%LET disease_indx=&disease_indx6; 
%_repeat;

%LET name=&name7; 
%LET c_dx=&c_dx7;
%LET disease_indx=&disease_indx7; 
%_repeat;


%LET name=&name8; 
%LET c_dx=&c_dx8;
%LET disease_indx=&disease_indx8; 
%_repeat;

%LET name=&name9; 
%LET c_dx=&c_dx9;
%LET disease_indx=&disease_indx9; 
%_repeat;

%LET name=&name10; 
%LET c_dx=&c_dx10;
%LET disease_indx=&disease_indx10; 
%_repeat;

%LET name=&name11; 
%LET c_dx=&c_dx11;
%LET disease_indx=&disease_indx11; 
%_repeat;


%LET name=&name12; 
%LET c_dx=&c_dx12;
%LET disease_indx=&disease_indx12; 
%_repeat;

%LET name=&name13; 
%LET c_dx=&c_dx13;
%LET disease_indx=&disease_indx13; 
%_repeat;


%LET name=&name14; 
%LET c_dx=&c_dx14;
%LET disease_indx=&disease_indx14; 
%_repeat;

%LET name=&name15; 
%LET c_dx=&c_dx15;
%LET disease_indx=&disease_indx15; 
%_repeat;

%LET name=&name16; 
%LET c_dx=&c_dx16;
%LET disease_indx=&disease_indx16; 
%_repeat;


%LET name=&name17; 
%LET c_dx=&c_dx17;
%LET disease_indx=&disease_indx17; 
%_repeat;

%LET name=&name18; 
%LET c_dx=&c_dx18;
%LET disease_indx=&disease_indx18; 
%_repeat;

%LET name=&name19; 
%LET c_dx=&c_dx19;
%LET disease_indx=&disease_indx19; 
%_repeat;

%LET name=&name20; 
%LET c_dx=&c_dx20;
%LET disease_indx=&disease_indx20; 
%_repeat;

%LET name=&name21; 
%LET c_dx=&c_dx21;
%LET disease_indx=&disease_indx21; 
%_repeat;

%LET name=&name22; 
%LET c_dx=&c_dx22;
%LET disease_indx=&disease_indx22; 
%_repeat;

%LET name=&name23; 
%LET c_dx=&c_dx23;
%LET disease_indx=&disease_indx23; 
%_repeat;

%LET name=&name24; 
%LET c_dx=&c_dx24;
%LET disease_indx=&disease_indx24; 
%_repeat;


%LET name=&name25; 
%LET c_dx=&c_dx25;
%LET disease_indx=&disease_indx25; 
%_repeat;


%LET name=&name26; 
%LET c_dx=&c_dx26;
%LET disease_indx=&disease_indx26; 
%_repeat;

%LET name=&name27; 
%LET c_dx=&c_dx27;
%LET disease_indx=&disease_indx27; 
%_repeat;


/* Combining All Types of Diseases*/
/* NIS13.HCUP_PATIENT_CONDITION*/
%macro combined( dat);
INSERT INTO NIS13.HCUP_PATIENT_CONDITION
SELECT PATID, AGE, SEX, RACE, HISPANIC, CONDITION, C_WT, 
       MCC_count1_18, MCC_count19_25, MCC_count1_25,disease_indx
FROM NIS13D.&dat;
%mend combined;

PROC SQL;
CREATE TABLE NIS13.HCUP_PATIENT_CONDITION
(
PATID NUM,
AGE NUM,
SEX NUM,
RACE NUM,
HISPANIC NUM,
CONDITION CHAR(150),
C_WT NUM,
MCC_count1_18 NUM,
MCC_count19_25 NUM, 
MCC_count1_25 NUM,
disease_indx NUM
);

%combined(&name1);
%combined(&name2);
%combined(&name3);
%combined(&name4);
%combined(&name5);
%combined(&name6);
%combined(&name7);
%combined(&name8);
%combined(&name9);
%combined(&name10);
%combined(&name11);
%combined(&name12);
%combined(&name13);
%combined(&name14);
%combined(&name15);
%combined(&name16);
%combined(&name17);
%combined(&name18);
%combined(&name19);
%combined(&name20);
%combined(&name21);
%combined(&name22);
%combined(&name23);
%combined(&name24);
%combined(&name25);
%combined(&name26);
%combined(&name27);
QUIT;


/*proc contents data=NIS13.HCUP_PATIENT_CONDITION; run;*/


/* status=1 if MCC_count>0 */
data NIS13.HCUP_MCC_ONE;
set NIS13.HCUP_PATIENT_CONDITION;
if (MCC_count1_18 >0) then  status1_18=1; else status1_18=0;
if (MCC_count19_25 >0) then  status19_25=1; else status19_25=0;
if (MCC_count1_25 >0) then  status1_25=1; else status1_25=0;
run;

data NIS13.HCUP_MCC_ONE_dx1_18;
set NIS13.HCUP_MCC_ONE;
if status1_18>0;
run;

data NIS13.HCUP_MCC_ONE_dx1_25;
set NIS13.HCUP_MCC_ONE;
if status1_25>0;
run;


/* Exporting csv file*/
proc export data=NIS13.HCUP_MCC_ONE_dx1_18
   outfile='V:\unzipHCUP_Zhe\NIS2013\NIS2013_SAS\HCUP_MCC_ONE_dx1_18.csv'
   dbms=csv;
run;

proc export data=NIS13.HCUP_MCC_ONE_dx1_25
   outfile='V:\unzipHCUP_Zhe\NIS2013\NIS2013_SAS\HCUP_MCC_ONE_dx1_25.csv'
   dbms=csv;
run;

Title " Prevalence of MCC with One Condition for DX1 through DX25";
ods pdf file="V:\unzipHCUP_Zhe\NIS2013\NIS2013_SAS\HCUP_MCC_ONE_TABLE_dx1_25.pdf";
Proc freq data=NIS13.HCUP_MCC_ONE_dx1_25;
tables condition /out=Freq_MCCone_dx1_25;
run;
ods pdf close;


Title2 " Prevalence of MCC with One Condition for DX1 through DX18";
ods pdf file="V:\unzipHCUP_Zhe\NIS2013\NIS2013_SAS\HCUP_MCC_ONE_TABLE_dx1_18.pdf";
Proc freq data=NIS13.HCUP_MCC_ONE_dx1_18;
tables condition /out=Freq_MCCone_dx1_18;
run;
ods pdf close;
