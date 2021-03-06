/* CREATE A TABLE HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, SEX, HISPANIC, RACE, CONDITION, ADMIT_DATE, C_WT); 'C_WT' IS USED FOR CALCULATING COMORBIDITY INDEX */

DROP TABLE HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120;

PRINT 'table1, before delete' 

CREATE TABLE HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120
(
PATID VARCHAR(64),
AGE INT,
AGE_GROUP VARCHAR(20),
SEX VARCHAR(2),
HISPANIC VARCHAR(2),
RACE VARCHAR(2),
ETHNICITY VARCHAR(50),
CONDITION VARCHAR(150),
ADMIT_DATE DATE,
C_WT INT
);


/* REVISED ACQUIRED HYPOTHYROIDISM ALGORITHM: 1 inpatient or 2 outpatient */

INSERT INTO HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, AGE_GROUP, SEX, HISPANIC, RACE, ETHNICITY, CONDITION, ADMIT_DATE, C_WT)
SELECT DISTINCT PC.PATID, PC.AGE, PC.AGE_GROUP, PC.SEX, PC.HISPANIC, PC.RACE, PC.ETHNICITY, PC.CONDITION, PC.ADMIT_DATE, PC.C_WT 
FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721 PC
WHERE PC.CONDITION = 'ACQUIRED HYPOTHYROIDISM' AND ((PC.ENC_TYPE ='IP' OR PC.ENC_TYPE ='EI') OR (PC.PATID IN 
(SELECT PATID FROM (SELECT PATID, COUNT(*) FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721
WHERE CONDITION = 'ACQUIRED HYPOTHYROIDISM' AND (ENC_TYPE ='AV' OR ENC_TYPE ='ED' OR ENC_TYPE ='IS' OR ENC_TYPE ='OS' OR ENC_TYPE ='OA')
GROUP BY PATID HAVING COUNT(*)>=2))));

/* REVISED ACUTE MYOCARDIAL INFARCTION ALGORITHM: 1 inpatient (same as before) */

INSERT INTO HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, AGE_GROUP, SEX, HISPANIC, RACE, ETHNICITY, CONDITION, ADMIT_DATE, C_WT)
SELECT DISTINCT PC.PATID, PC.AGE, PC.AGE_GROUP, PC.SEX, PC.HISPANIC, PC.RACE, PC.ETHNICITY, PC.CONDITION, PC.ADMIT_DATE, PC.C_WT 
FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721 PC
WHERE PC.CONDITION = 'ACUTE MYOCARDIAL INFARCTION' AND (PC.ENC_TYPE ='IP' OR PC.ENC_TYPE ='EI');

/* REVISED ALZHEIMERS DISEASE ALGORITHM: 1 inpatient or 1 outpatient */

INSERT INTO HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, AGE_GROUP, SEX, HISPANIC, RACE, ETHNICITY, CONDITION, ADMIT_DATE, C_WT)
SELECT DISTINCT PC.PATID, PC.AGE, PC.AGE_GROUP, PC.SEX, PC.HISPANIC, PC.RACE, PC.ETHNICITY, PC.CONDITION, PC.ADMIT_DATE, PC.C_WT 
FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721 PC
WHERE PC.CONDITION = 'ALZHEIMERS DISEASE' AND (PC.ENC_TYPE ='IP' OR PC.ENC_TYPE ='EI' OR PC.ENC_TYPE ='AV' OR PC.ENC_TYPE ='ED' OR PC.ENC_TYPE ='IS' OR PC.ENC_TYPE ='OS' OR PC.ENC_TYPE ='OA');


/* REVISED ALZHEIMERS DISEASE AND RELATED DISORDERS OR SENILE DEMENTIA ALGORITHM: 1 inpatient or 1 outpatient*/

INSERT INTO HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, AGE_GROUP, SEX, HISPANIC, RACE, ETHNICITY, CONDITION, ADMIT_DATE, C_WT)
SELECT DISTINCT PC.PATID, PC.AGE, PC.AGE_GROUP, PC.SEX, PC.HISPANIC, PC.RACE, PC.ETHNICITY, PC.CONDITION, PC.ADMIT_DATE, PC.C_WT 
FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721 PC
WHERE PC.CONDITION = 'ALZHEIMERS DISEASE AND RELATED DISORDERS OR SENILE DEMENTIA' AND (PC.ENC_TYPE ='IP' OR PC.ENC_TYPE ='EI' OR PC.ENC_TYPE ='AV' OR PC.ENC_TYPE ='ED' OR PC.ENC_TYPE ='IS' OR PC.ENC_TYPE ='OS' OR PC.ENC_TYPE ='OA');

/* REVISED ANEMIA ALGORITHM: 1 inpatient or 1 outpatient */

INSERT INTO HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, AGE_GROUP, SEX, HISPANIC, RACE, ETHNICITY, CONDITION, ADMIT_DATE, C_WT)
SELECT DISTINCT PC.PATID, PC.AGE, PC.AGE_GROUP, PC.SEX, PC.HISPANIC, PC.RACE, PC.ETHNICITY, PC.CONDITION, PC.ADMIT_DATE, PC.C_WT 
FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721 PC
WHERE PC.CONDITION = 'ANEMIA' AND (PC.ENC_TYPE ='IP' OR PC.ENC_TYPE ='EI' OR PC.ENC_TYPE ='AV' OR PC.ENC_TYPE ='ED' OR PC.ENC_TYPE ='IS' OR PC.ENC_TYPE ='OS' OR PC.ENC_TYPE ='OA');


/* REFINED ATHMA ALGORITHM: 1 inpatient or 2 outpatient */

INSERT INTO HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, AGE_GROUP, SEX, HISPANIC, RACE, ETHNICITY, CONDITION, ADMIT_DATE, C_WT)
SELECT DISTINCT PC.PATID, PC.AGE, PC.AGE_GROUP, PC.SEX, PC.HISPANIC, PC.RACE, PC.ETHNICITY, PC.CONDITION, PC.ADMIT_DATE, PC.C_WT 
FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721 PC
WHERE PC.CONDITION = 'ASTHMA' AND ((PC.ENC_TYPE ='IP' OR PC.ENC_TYPE ='EI') OR (PC.PATID IN 
(SELECT PATID FROM (SELECT PATID, COUNT(*) FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721
WHERE CONDITION = 'ASTHMA' AND (ENC_TYPE ='AV' OR ENC_TYPE ='ED' OR ENC_TYPE ='IS' OR ENC_TYPE ='OS' OR ENC_TYPE ='OA')
GROUP BY PATID HAVING COUNT(*)>=2))));


/* REFINED ATRIAL FIBRILLATION: 1 inpatient or 2 outpatient */

INSERT INTO HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, AGE_GROUP, SEX, HISPANIC, RACE, ETHNICITY, CONDITION, ADMIT_DATE, C_WT)
SELECT DISTINCT PC.PATID, PC.AGE, PC.AGE_GROUP, PC.SEX, PC.HISPANIC, PC.RACE, PC.ETHNICITY, PC.CONDITION, PC.ADMIT_DATE, PC.C_WT 
FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721 PC
WHERE PC.CONDITION = 'ATRIAL FIBRILLATION' AND ((PC.ENC_TYPE ='IP' OR PC.ENC_TYPE ='EI') OR (PC.PATID IN 
(SELECT PATID FROM (SELECT PATID, COUNT(*) FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721
WHERE CONDITION = 'ATRIAL FIBRILLATION' AND (ENC_TYPE ='AV' OR ENC_TYPE ='ED' OR ENC_TYPE ='IS' OR ENC_TYPE ='OS' OR ENC_TYPE ='OA')
GROUP BY PATID HAVING COUNT(*)>=2))));

/* REFINED BENIGN PROSTATIC HYPERPLASIA ALGORITHM: 1 inpatient or 2 outpatient */

INSERT INTO HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, AGE_GROUP, SEX, HISPANIC, RACE, ETHNICITY, CONDITION, ADMIT_DATE, C_WT)
SELECT DISTINCT PC.PATID, PC.AGE, PC.AGE_GROUP, PC.SEX, PC.HISPANIC, PC.RACE, PC.ETHNICITY, PC.CONDITION, PC.ADMIT_DATE, PC.C_WT 
FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721 PC
WHERE PC.CONDITION = 'BENIGN PROSTATIC HYPERPLASIA' AND ((PC.ENC_TYPE ='IP' OR PC.ENC_TYPE ='EI') OR (PC.PATID IN 
(SELECT PATID FROM (SELECT PATID, COUNT(*) FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721
WHERE CONDITION = 'BENIGN PROSTATIC HYPERPLASIA' AND (ENC_TYPE ='AV' OR ENC_TYPE ='ED' OR ENC_TYPE ='IS' OR ENC_TYPE ='OS' OR ENC_TYPE ='OA')
GROUP BY PATID HAVING COUNT(*)>=2))));


/* REFINED CATARACT ALGORITHM: 1 outpatient */

INSERT INTO HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, AGE_GROUP, SEX, HISPANIC, RACE, ETHNICITY, CONDITION, ADMIT_DATE, C_WT)
SELECT DISTINCT PC.PATID, PC.AGE, PC.AGE_GROUP, PC.SEX, PC.HISPANIC, PC.RACE, PC.ETHNICITY, PC.CONDITION, PC.ADMIT_DATE, PC.C_WT 
FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721 PC
WHERE PC.CONDITION = 'CATARACT' AND (PC.ENC_TYPE ='IP' OR PC.ENC_TYPE ='EI' OR PC.ENC_TYPE ='AV' OR PC.ENC_TYPE ='ED' OR PC.ENC_TYPE ='IS' OR PC.ENC_TYPE ='OS' OR PC.ENC_TYPE ='OA');


/* REFINED CHRONIC KIDNEY DISEASE ALGORITHM: 1 inpatient or 2 outpatient */

INSERT INTO HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, AGE_GROUP, SEX, HISPANIC, RACE, ETHNICITY, CONDITION, ADMIT_DATE, C_WT)
SELECT DISTINCT PC.PATID, PC.AGE, PC.AGE_GROUP, PC.SEX, PC.HISPANIC, PC.RACE, PC.ETHNICITY, PC.CONDITION, PC.ADMIT_DATE, PC.C_WT 
FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721 PC
WHERE PC.CONDITION = 'CHRONIC KIDNEY DISEASE' AND ((PC.ENC_TYPE ='IP' OR PC.ENC_TYPE ='EI') OR (PC.PATID IN 
(SELECT PATID FROM (SELECT PATID, COUNT(*) FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721
WHERE CONDITION = 'CHRONIC KIDNEY DISEASE' AND (ENC_TYPE ='AV' OR ENC_TYPE ='ED' OR ENC_TYPE ='IS' OR ENC_TYPE ='OS' OR ENC_TYPE ='OA')
GROUP BY PATID HAVING COUNT(*)>=2))));

/* REVISED CHRONIC OBSTRUCTIVE PULMONARY DISEASE AND BRONCHIECTASIS: 1 inpatient or 2 outpatient */

INSERT INTO HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, AGE_GROUP, SEX, HISPANIC, RACE, ETHNICITY, CONDITION, ADMIT_DATE, C_WT)
SELECT DISTINCT PC.PATID, PC.AGE, PC.AGE_GROUP, PC.SEX, PC.HISPANIC, PC.RACE, PC.ETHNICITY, PC.CONDITION, PC.ADMIT_DATE, PC.C_WT 
FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721 PC
WHERE PC.CONDITION = 'CHRONIC OBSTRUCTIVE PULMONARY DISEASE AND BRONCHIECTASIS' AND ((PC.ENC_TYPE ='IP' OR PC.ENC_TYPE ='EI') OR (PC.PATID IN 
(SELECT PATID FROM (SELECT PATID, COUNT(*) FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721
WHERE CONDITION = 'CHRONIC OBSTRUCTIVE PULMONARY DISEASE AND BRONCHIECTASIS' AND (ENC_TYPE ='AV' OR ENC_TYPE ='ED' OR ENC_TYPE ='IS' OR ENC_TYPE ='OS' OR ENC_TYPE ='OA')
GROUP BY PATID HAVING COUNT(*)>=2))));

/* REVISED DEPRESSION ALGORITHM: 1 inpatient or 1 outpatient */

INSERT INTO HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, AGE_GROUP, SEX, HISPANIC, RACE, ETHNICITY, CONDITION, ADMIT_DATE, C_WT)
SELECT DISTINCT PC.PATID, PC.AGE, PC.AGE_GROUP, PC.SEX, PC.HISPANIC, PC.RACE, PC.ETHNICITY, PC.CONDITION, PC.ADMIT_DATE, PC.C_WT 
FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721 PC
WHERE PC.CONDITION = 'DEPRESSION' AND (PC.ENC_TYPE ='IP' OR PC.ENC_TYPE ='EI' OR PC.ENC_TYPE ='AV' OR PC.ENC_TYPE ='ED' OR PC.ENC_TYPE ='IS' OR PC.ENC_TYPE ='OS' OR PC.ENC_TYPE ='OA');


/* REVISED DIABETES ALGORITHM: 1 inpatient or 2 outpatient */


INSERT INTO HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, AGE_GROUP, SEX, HISPANIC, RACE, ETHNICITY, CONDITION, ADMIT_DATE, C_WT)
SELECT DISTINCT PC.PATID, PC.AGE, PC.AGE_GROUP, PC.SEX, PC.HISPANIC, PC.RACE, PC.ETHNICITY, PC.CONDITION, PC.ADMIT_DATE, PC.C_WT 
FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721 PC
WHERE PC.CONDITION = 'DIABETES' AND ((PC.ENC_TYPE ='IP' OR PC.ENC_TYPE ='EI') OR (PC.PATID IN 
(SELECT PATID FROM (SELECT PATID, COUNT(*) FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721
WHERE CONDITION = 'DIABETES' AND (ENC_TYPE ='AV' OR ENC_TYPE ='ED' OR ENC_TYPE ='IS' OR ENC_TYPE ='OS' OR ENC_TYPE ='OA')
GROUP BY PATID HAVING COUNT(*)>=2))));

/* REVISED GLAUCOMA ALGORITHM: At least 1 Carrier claim with DX code */

INSERT INTO HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, AGE_GROUP, SEX, HISPANIC, RACE, ETHNICITY, CONDITION, ADMIT_DATE, C_WT)
SELECT DISTINCT PC.PATID, PC.AGE, PC.AGE_GROUP, PC.SEX, PC.HISPANIC, PC.RACE, PC.ETHNICITY, PC.CONDITION, PC.ADMIT_DATE, PC.C_WT 
FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721 PC
WHERE PC.CONDITION = 'GLAUCOMA' AND (PC.ENC_TYPE ='IP' OR PC.ENC_TYPE ='EI' OR PC.ENC_TYPE ='AV' OR PC.ENC_TYPE ='ED' OR PC.ENC_TYPE ='IS' OR PC.ENC_TYPE ='OS' OR PC.ENC_TYPE ='OA');

/* REVISED HEART FAILURE ALGORITHM: 1 patient or 1 outpatient*/

INSERT INTO HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, AGE_GROUP, SEX, HISPANIC, RACE, ETHNICITY, CONDITION, ADMIT_DATE, C_WT)
SELECT DISTINCT PC.PATID, PC.AGE, PC.AGE_GROUP, PC.SEX, PC.HISPANIC, PC.RACE, PC.ETHNICITY, PC.CONDITION, PC.ADMIT_DATE, PC.C_WT 
FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721 PC
WHERE PC.CONDITION = 'HEART FAILURE' AND (PC.ENC_TYPE ='IP' OR PC.ENC_TYPE ='EI' OR PC.ENC_TYPE ='AV' OR PC.ENC_TYPE ='ED' OR PC.ENC_TYPE ='IS' OR PC.ENC_TYPE ='OS' OR PC.ENC_TYPE ='OA');

/* REVISED HIP/PELVIC FRACTURE ALGORITHM: 1 inpatient (same as before) */

INSERT INTO HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, AGE_GROUP, SEX, HISPANIC, RACE, ETHNICITY, CONDITION, ADMIT_DATE, C_WT)
SELECT DISTINCT PC.PATID, PC.AGE, PC.AGE_GROUP, PC.SEX, PC.HISPANIC, PC.RACE, PC.ETHNICITY, PC.CONDITION, PC.ADMIT_DATE, PC.C_WT 
FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721 PC
WHERE PC.CONDITION = 'HIP/PELVIC FRACTURE' AND (PC.ENC_TYPE ='IP' OR PC.ENC_TYPE ='EI');


/* REVISED HYPERLIPIDEMIA ALGORITHM: 1 inpatient or 2 outpatient */

INSERT INTO HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, AGE_GROUP, SEX, HISPANIC, RACE, ETHNICITY, CONDITION, ADMIT_DATE, C_WT)
SELECT DISTINCT PC.PATID, PC.AGE, PC.AGE_GROUP, PC.SEX, PC.HISPANIC, PC.RACE, PC.ETHNICITY, PC.CONDITION, PC.ADMIT_DATE, PC.C_WT 
FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721 PC
WHERE PC.CONDITION = 'HYPERLIPIDEMIA' AND ((PC.ENC_TYPE ='IP' OR PC.ENC_TYPE ='EI') OR (PC.PATID IN 
(SELECT PATID FROM (SELECT PATID, COUNT(*) FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721
WHERE CONDITION = 'HYPERLIPIDEMIA' AND (ENC_TYPE ='AV' OR ENC_TYPE ='ED' OR ENC_TYPE ='IS' OR ENC_TYPE ='OS' OR ENC_TYPE ='OA')
GROUP BY PATID HAVING COUNT(*)>=2))));


/* REVISED HYPERTENSION ALGORITHM: 1 inpatient or 2 outpatient */

INSERT INTO HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, AGE_GROUP, SEX, HISPANIC, RACE, ETHNICITY, CONDITION, ADMIT_DATE, C_WT)
SELECT DISTINCT PC.PATID, PC.AGE, PC.AGE_GROUP, PC.SEX, PC.HISPANIC, PC.RACE, PC.ETHNICITY, PC.CONDITION, PC.ADMIT_DATE, PC.C_WT 
FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721 PC
WHERE PC.CONDITION = 'HYPERTENSION' AND ((PC.ENC_TYPE ='IP' OR PC.ENC_TYPE ='EI') OR (PC.PATID IN 
(SELECT PATID FROM (SELECT PATID, COUNT(*) FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721
WHERE CONDITION = 'HYPERTENSION' AND (ENC_TYPE ='AV' OR ENC_TYPE ='ED' OR ENC_TYPE ='IS' OR ENC_TYPE ='OS' OR ENC_TYPE ='OA')
GROUP BY PATID HAVING COUNT(*)>=2))));


/* REVISED ISCHEMIC HEART DISEASE ALGORITHM: 1 inpatient or 1 outpatient */

INSERT INTO HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, AGE_GROUP, SEX, HISPANIC, RACE, ETHNICITY, CONDITION, ADMIT_DATE, C_WT)
SELECT DISTINCT PC.PATID, PC.AGE, PC.AGE_GROUP, PC.SEX, PC.HISPANIC, PC.RACE, PC.ETHNICITY, PC.CONDITION, PC.ADMIT_DATE, PC.C_WT 
FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721 PC
WHERE PC.CONDITION = 'ISCHEMIC HEART DISEASE' AND (PC.ENC_TYPE ='IP' OR PC.ENC_TYPE ='EI' OR PC.ENC_TYPE ='AV' OR PC.ENC_TYPE ='ED' OR PC.ENC_TYPE ='IS' OR PC.ENC_TYPE ='OS' OR PC.ENC_TYPE ='OA');



/* REVISED OSTEOPOROSIS ALGORITHM: */

INSERT INTO HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, AGE_GROUP, SEX, HISPANIC, RACE, ETHNICITY, CONDITION, ADMIT_DATE, C_WT)
SELECT DISTINCT PC.PATID, PC.AGE, PC.AGE_GROUP, PC.SEX, PC.HISPANIC, PC.RACE, PC.ETHNICITY, PC.CONDITION, PC.ADMIT_DATE, PC.C_WT 
FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721 PC
WHERE PC.CONDITION = 'OSTEOPOROSIS' AND ((PC.ENC_TYPE ='IP' OR PC.ENC_TYPE ='EI') OR (PC.PATID IN 
(SELECT PATID FROM (SELECT PATID, COUNT(*) FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721
WHERE CONDITION = 'OSTEOPOROSIS' AND (ENC_TYPE ='AV' OR ENC_TYPE ='ED' OR ENC_TYPE ='IS' OR ENC_TYPE ='OS' OR ENC_TYPE ='OA')
GROUP BY PATID HAVING COUNT(*)>=2))));

/* REVISED RA/OA (RHEUMATOID ARTHRITIS/OSTEOARTHRITIS) ALGORITHM: 2 inpatient or outpatient code*/

INSERT INTO HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, AGE_GROUP, SEX, HISPANIC, RACE, ETHNICITY, CONDITION, ADMIT_DATE, C_WT)
SELECT DISTINCT PC.PATID, PC.AGE, PC.AGE_GROUP, PC.SEX, PC.HISPANIC, PC.RACE, PC.ETHNICITY, PC.CONDITION, PC.ADMIT_DATE, PC.C_WT 
FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721 PC
WHERE PC.CONDITION = 'RHEUMATOID ARTHRITIS/OSTEOARTHRITIS' AND PC.PATID IN 
(SELECT PATID FROM (SELECT PATID, COUNT(*) FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721
WHERE CONDITION = 'RHEUMATOID ARTHRITIS/OSTEOARTHRITIS' AND (ENC_TYPE ='IP' OR ENC_TYPE ='EI' OR ENC_TYPE ='AV' OR ENC_TYPE ='ED' OR ENC_TYPE ='IS' OR ENC_TYPE ='OS' OR ENC_TYPE ='OA')
GROUP BY PATID HAVING COUNT(*)>=2));


/* REVISED STROKE/TRANSIENT ISCHEMIC ATTACK ALGORITHM: 1 inpatient and 2 outpatient */

INSERT INTO HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, AGE_GROUP, SEX, HISPANIC, RACE, ETHNICITY, CONDITION, ADMIT_DATE, C_WT)
SELECT DISTINCT PC.PATID, PC.AGE, PC.AGE_GROUP, PC.SEX, PC.HISPANIC, PC.RACE, PC.ETHNICITY, PC.CONDITION, PC.ADMIT_DATE, PC.C_WT 
FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721 PC
WHERE PC.CONDITION = 'STROKE/TRANSIENT ISCHEMIC ATTACK' AND ((PC.ENC_TYPE ='IP' OR PC.ENC_TYPE ='EI') OR (PC.PATID IN 
(SELECT PATID FROM (SELECT PATID, COUNT(*) FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721
WHERE CONDITION = 'STROKE/TRANSIENT ISCHEMIC ATTACK' AND (ENC_TYPE ='AV' OR ENC_TYPE ='ED' OR ENC_TYPE ='IS' OR ENC_TYPE ='OS' OR ENC_TYPE ='OA')
GROUP BY PATID HAVING COUNT(*)>=2))));

/*  REVISED FEMALE / MALE BREAST CANCER ALGORITHM: 1 inpatient and 2 outpatient */

INSERT INTO HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, AGE_GROUP, SEX, HISPANIC, RACE, ETHNICITY, CONDITION, ADMIT_DATE, C_WT)
SELECT DISTINCT PC.PATID, PC.AGE, PC.AGE_GROUP, PC.SEX, PC.HISPANIC, PC.RACE, PC.ETHNICITY, PC.CONDITION, PC.ADMIT_DATE, PC.C_WT 
FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721 PC
WHERE PC.CONDITION = 'FEMALE / MALE BREAST CANCER' AND ((PC.ENC_TYPE ='IP' OR PC.ENC_TYPE ='EI') OR (PC.PATID IN 
(SELECT PATID FROM (SELECT PATID, COUNT(*) FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721
WHERE CONDITION = 'FEMALE / MALE BREAST CANCER' AND (ENC_TYPE ='AV' OR ENC_TYPE ='ED' OR ENC_TYPE ='IS' OR ENC_TYPE ='OS' OR ENC_TYPE ='OA')
GROUP BY PATID HAVING COUNT(*)>=2))));


/*  REVISED COLORECTAL CANCER ALGORITHM: 1 inpatient and 2 outpatient */

INSERT INTO HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, AGE_GROUP, SEX, HISPANIC, RACE, ETHNICITY, CONDITION, ADMIT_DATE, C_WT)
SELECT DISTINCT PC.PATID, PC.AGE, PC.AGE_GROUP, PC.SEX, PC.HISPANIC, PC.RACE, PC.ETHNICITY, PC.CONDITION, PC.ADMIT_DATE, PC.C_WT 
FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721 PC
WHERE PC.CONDITION = 'COLORECTAL CANCER' AND ((PC.ENC_TYPE ='IP' OR PC.ENC_TYPE ='EI') OR (PC.PATID IN 
(SELECT PATID FROM (SELECT PATID, COUNT(*) FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721
WHERE CONDITION = 'COLORECTAL CANCER' AND (ENC_TYPE ='AV' OR ENC_TYPE ='ED' OR ENC_TYPE ='IS' OR ENC_TYPE ='OS' OR ENC_TYPE ='OA')
GROUP BY PATID HAVING COUNT(*)>=2))));


/*  REVISED PROSTATE CANCER ALGORITHM: 1 inpatient and 2 outpatient */

INSERT INTO HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, AGE_GROUP, SEX, HISPANIC, RACE, ETHNICITY, CONDITION, ADMIT_DATE, C_WT)
SELECT DISTINCT PC.PATID, PC.AGE, PC.AGE_GROUP, PC.SEX, PC.HISPANIC, PC.RACE, PC.ETHNICITY, PC.CONDITION, PC.ADMIT_DATE, PC.C_WT 
FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721 PC
WHERE PC.CONDITION = 'PROSTATE CANCER' AND ((PC.ENC_TYPE ='IP' OR PC.ENC_TYPE ='EI') OR (PC.PATID IN 
(SELECT PATID FROM (SELECT PATID, COUNT(*) FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721
WHERE CONDITION = 'PROSTATE CANCER' AND (ENC_TYPE ='AV' OR ENC_TYPE ='ED' OR ENC_TYPE ='IS' OR ENC_TYPE ='OS' OR ENC_TYPE ='OA')
GROUP BY PATID HAVING COUNT(*)>=2))));

/*  REVISED LUNG CANCER ALGORITHM: 1 inpatient and 2 outpatient */

INSERT INTO HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, AGE_GROUP, SEX, HISPANIC, RACE, ETHNICITY, CONDITION, ADMIT_DATE, C_WT)
SELECT DISTINCT PC.PATID, PC.AGE, PC.AGE_GROUP, PC.SEX, PC.HISPANIC, PC.RACE, PC.ETHNICITY, PC.CONDITION, PC.ADMIT_DATE, PC.C_WT 
FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721 PC
WHERE PC.CONDITION = 'LUNG CANCER' AND ((PC.ENC_TYPE ='IP' OR PC.ENC_TYPE ='EI') OR (PC.PATID IN 
(SELECT PATID FROM (SELECT PATID, COUNT(*) FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721
WHERE CONDITION = 'LUNG CANCER' AND (ENC_TYPE ='AV' OR ENC_TYPE ='ED' OR ENC_TYPE ='IS' OR ENC_TYPE ='OS' OR ENC_TYPE ='OA')
GROUP BY PATID HAVING COUNT(*)>=2))));


/*  REVISED ENDOMETRIAL CANCER ALGORITHM: 1 inpatient and 2 outpatient */

INSERT INTO HCUP.dbo.PATIENT_CONDITION_REFINED_ALGORITHMS_20171120 (PATID, AGE, AGE_GROUP, SEX, HISPANIC, RACE, ETHNICITY, CONDITION, ADMIT_DATE, C_WT)
SELECT DISTINCT PC.PATID, PC.AGE, PC.AGE_GROUP, PC.SEX, PC.HISPANIC, PC.RACE, PC.ETHNICITY, PC.CONDITION, PC.ADMIT_DATE, PC.C_WT 
FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721 PC
WHERE PC.CONDITION = 'ENDOMETRIAL CANCER' AND ((PC.ENC_TYPE ='IP' OR PC.ENC_TYPE ='EI') OR (PC.PATID IN 
(SELECT PATID FROM (SELECT PATID, COUNT(*) FROM HCUP.dbo.PATIENT_CONDITION_ENCTYPE_20170721
WHERE CONDITION = 'ENDOMETRIAL CANCER' AND (ENC_TYPE ='AV' OR ENC_TYPE ='ED' OR ENC_TYPE ='IS' OR ENC_TYPE ='OS' OR ENC_TYPE ='OA')
GROUP BY PATID HAVING COUNT(*)>=2))));