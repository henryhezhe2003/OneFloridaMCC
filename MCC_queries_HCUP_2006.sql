UPDATE HCUP.dbo.HCUP_MCC_2006 SET AGE_GROUP ='65_74' WHERE AGE >= 65 AND AGE <= 74;UPDATE HCUP.dbo.HCUP_MCC_2006 SET AGE_GROUP ='75_84' WHERE AGE >= 75 AND AGE <= 84;UPDATE HCUP.dbo.HCUP_MCC_2006 SET AGE_GROUP ='ABOVE_85' WHERE AGE >= 85;UPDATE HCUP.dbo.HCUP_MCC_2006 SET ETHNICITY='NON_HISPANIC_WHITE' WHERE RACE = '1' AND HISPANTIC = '0';UPDATE HCUP.dbo.HCUP_MCC_2006 SET ETHNICITY='NON_HISPANIC_BLACK' WHERE RACE = '2' AND HISPANTIC = '0';UPDATE HCUP.dbo.HCUP_MCC_2006 SET ETHNICITY='ASIAN_PI' WHERE RACE = '4' AND HISPANTIC = '0';UPDATE HCUP.dbo.HCUP_MCC_2006 SET ETHNICITY='HISPANIC' WHERE HISPANTIC = '1';/* HCUP 2006 MCC ANALYSIS */-- PREVALENCE OF MCC WITH TWO CONDITIONSPRINT 'ANALYZING PREVALENCE OF MCC WITH TWO CONDITIONS'bcp "SELECT PC1.CONDITION, PC2.CONDITION, COUNT(DISTINCT PC1.PATID) AS CT FROM HCUP.dbo.HCUP_MCC_2006 AS PC1 INNER JOIN HCUP.dbo.HCUP_MCC_2006 AS PC2 ON PC1.PATID = PC2.PATID AND PC1.CONDITION < PC2.CONDITION GROUP BY PC1.CONDITION, PC2.CONDITION ORDER BY CT DESC" queryout "mcc2_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01-- PREVALENCE OF MCC WITH TWO CONDITIONS OF MALEPRINT 'ANALYZING PREVALENCE OF MCC WITH TWO CONDITIONS OF MALE'bcp "SELECT PC1.CONDITION, PC2.CONDITION, COUNT(DISTINCT PC1.PATID) AS CT FROM HCUP.dbo.HCUP_MCC_2006 AS PC1 INNER JOIN HCUP.dbo.HCUP_MCC_2006 AS PC2 ON PC1.PATID = PC2.PATID  WHERE PC1.CONDITION < PC2.CONDITION AND PC1.SEX = '0' GROUP BY PC1.CONDITION, PC2.CONDITION ORDER BY CT DESC" queryout "mcc2_male_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01-- PREVALENCE OF MCC WITH TWO CONDITIONS OF FEMALEPRINT 'ANALYZING PREVALENCE OF MCC WITH TWO CONDITIONS OF FEMALE'bcp "SELECT PC1.CONDITION, PC2.CONDITION, COUNT(DISTINCT PC1.PATID) AS CT FROM HCUP.dbo.HCUP_MCC_2006 AS PC1 INNER JOIN HCUP.dbo.HCUP_MCC_2006 AS PC2 ON PC1.PATID = PC2.PATID WHERE PC1.CONDITION < PC2.CONDITION AND PC1.SEX = '1' GROUP BY PC1.CONDITION, PC2.CONDITION ORDER BY CT DESC" queryout "mcc2_female_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01-- PREVALENCE OF MCC WITH THREE CONDITIONSPRINT 'ANALYZING PREVALENCE OF MCC WITH THREE CONDITIONS'bcp "SELECT PC1.CONDITION, PC2.CONDITION, PC3.CONDITION, COUNT(DISTINCT PC1.PATID) AS CT FROM HCUP.dbo.HCUP_MCC_2006 AS PC1, HCUP.dbo.HCUP_MCC_2006 AS PC2, HCUP.dbo.HCUP_MCC_2006 AS PC3 WHERE PC1.PATID = PC2.PATID AND PC1.PATID = PC3.PATID AND PC1.CONDITION < PC2.CONDITION AND PC2.CONDITION < PC3.CONDITION  GROUP BY PC1.CONDITION, PC2.CONDITION, PC3.CONDITION ORDER BY CT DESC" queryout "mcc3_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01-- PREVALENCE OF MCC WITH THREE CONDITIONS OF MALEPRINT 'ANALYZING PREVALENCE OF MCC WITH THREE CONDITIONS OF MALE'bcp "SELECT PC1.CONDITION, PC2.CONDITION, PC3.CONDITION, COUNT(DISTINCT PC1.PATID) AS CT  FROM HCUP.dbo.HCUP_MCC_2006 AS PC1, HCUP.dbo.HCUP_MCC_2006 AS PC2, HCUP.dbo.HCUP_MCC_2006 AS PC3 WHERE PC1.PATID = PC2.PATID AND PC1.PATID = PC3.PATID AND PC1.CONDITION < PC2.CONDITION AND PC2.CONDITION < PC3.CONDITION AND PC1.SEX = '0' GROUP BY PC1.CONDITION, PC2.CONDITION, PC3.CONDITION ORDER BY CT DESC" queryout "mcc3_male_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01-- PREVALENCE OF MCC WITH THREE CONDITIONS OF FEMALEPRINT 'ANALYZING PREVALENCE OF MCC WITH THREE CONDITIONS OF FEMALE'bcp "SELECT PC1.CONDITION, PC2.CONDITION, PC3.CONDITION, COUNT(DISTINCT PC1.PATID) AS CT FROM HCUP.dbo.HCUP_MCC_2006 AS PC1, HCUP.dbo.HCUP_MCC_2006 AS PC2, HCUP.dbo.HCUP_MCC_2006 AS PC3 WHERE PC1.PATID = PC2.PATID AND PC1.PATID = PC3.PATID AND PC1.CONDITION < PC2.CONDITION AND PC2.CONDITION < PC3.CONDITION AND PC1.SEX = '1' GROUP BY PC1.CONDITION, PC2.CONDITION, PC3.CONDITION ORDER BY CT DESC" queryout "mcc3_female_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01-- PREVALENCE OF MCC WITH FOUR CONDITIONS--PRINT 'ANALYZING PREVALENCE OF MCC WITH FOUR CONDITIONS'--bcp "SELECT PC1.CONDITION, PC2.CONDITION, PC3.CONDITION, PC4.CONDITION, COUNT(DISTINCT PC1.PATID) AS CT FROM HCUP.dbo.HCUP_MCC_2006 AS PC1, HCUP.dbo.HCUP_MCC_2006 AS PC2, HCUP.dbo.HCUP_MCC_2006 AS PC3, HCUP.dbo.HCUP_MCC_2006 AS PC4 WHERE PC1.PATID = PC2.PATID AND PC1.PATID = PC3.PATID AND PC1.PATID = PC4.PATID AND PC1.CONDITION < PC2.CONDITION AND PC2.CONDITION < PC3.CONDITION AND PC3.CONDITION < PC4.CONDITION GROUP BY PC1.CONDITION, PC2.CONDITION, PC3.CONDITION, PC4.CONDITION ORDER BY CT DESC" queryout "mcc4_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01-- PREVALENCE OF MCC WITH FOUR CONDITIONS OF MALE--PRINT 'ANALYZING PREVALENCE OF MCC WITH FOUR CONDITIONS OF MALE'--bcp "SELECT PC1.CONDITION, PC2.CONDITION, PC3.CONDITION, PC4.CONDITION, COUNT(DISTINCT PC1.PATID) AS CT FROM HCUP.dbo.HCUP_MCC_2006 AS PC1, HCUP.dbo.HCUP_MCC_2006 AS PC2, HCUP.dbo.HCUP_MCC_2006 AS PC3, HCUP.dbo.HCUP_MCC_2006 AS PC4 WHERE PC1.PATID = PC2.PATID AND PC1.PATID = PC3.PATID AND PC1.PATID = PC4.PATID AND PC1.CONDITION < PC2.CONDITION AND PC2.CONDITION < PC3.CONDITION AND PC3.CONDITION < PC4.CONDITION AND PC1.SEX = '0' GROUP BY PC1.CONDITION, PC2.CONDITION, PC3.CONDITION, PC4.CONDITION ORDER BY CT DESC" queryout "mcc4_male_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01-- PREVALENCE OF MCC WITH FOUR CONDITIONS OF FEMALE--PRINT 'ANALYZING PREVALENCE OF MCC WITH FOUR CONDITIONS OF FEMALE'--bcp "SELECT PC1.CONDITION, PC2.CONDITION, PC3.CONDITION, PC4.CONDITION, COUNT(DISTINCT PC1.PATID) AS CT FROM HCUP.dbo.HCUP_MCC_2006 AS PC1, HCUP.dbo.HCUP_MCC_2006 AS PC2, HCUP.dbo.HCUP_MCC_2006 AS PC3, HCUP.dbo.HCUP_MCC_2006 AS PC4 WHERE PC1.PATID = PC2.PATID AND PC1.PATID = PC3.PATID AND PC1.PATID = PC4.PATID AND PC1.CONDITION < PC2.CONDITION AND PC2.CONDITION < PC3.CONDITION AND PC3.CONDITION < PC4.CONDITION AND PC1.SEX = '1' GROUP BY PC1.CONDITION, PC2.CONDITION, PC3.CONDITION, PC4.CONDITION ORDER BY CT DESC" queryout "mcc4_female_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01-- PREVALENCE OF MCC WITH FIVE CONDITIONS--bcp "SELECT PC1.CONDITION, PC2.CONDITION, PC3.CONDITION, PC4.CONDITION, PC5.CONDITION, COUNT(DISTINCT PC1.PATID) AS CT FROM HCUP.dbo.HCUP_MCC_2006 AS PC1, HCUP.dbo.HCUP_MCC_2006 AS PC2, HCUP.dbo.HCUP_MCC_2006 AS PC3, HCUP.dbo.HCUP_MCC_2006 AS PC4, HCUP.dbo.HCUP_MCC_2006 AS PC5 WHERE PC1.PATID = PC2.PATID AND PC1.PATID = PC3.PATID AND PC1.PATID = PC4.PATID AND PC1.PATID = PC5.PATID AND PC1.CONDITION < PC2.CONDITION AND PC2.CONDITION < PC3.CONDITION AND PC3.CONDITION < PC4.CONDITION AND PC4.CONDITION < PC5.CONDITION GROUP BY PC1.CONDITION, PC2.CONDITION, PC3.CONDITION, PC4.CONDITION, PC5.CONDITION ORDER BY CT DESC" queryout "mcc5_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01-- PREVALENCE OF MCC WITH FIVE CONDITIONS OF MALE--PRINT 'ANALYZING PREVALENCE OF MCC WITH FIVE CONDITIONS OF MALE'--bcp "SELECT PC1.CONDITION, PC2.CONDITION, PC3.CONDITION, PC4.CONDITION, PC5.CONDITION, COUNT(DISTINCT PC1.PATID) AS CT FROM HCUP.dbo.HCUP_MCC_2006 AS PC1, HCUP.dbo.HCUP_MCC_2006 AS PC2, HCUP.dbo.HCUP_MCC_2006 AS PC3, HCUP.dbo.HCUP_MCC_2006 AS PC4, HCUP.dbo.HCUP_MCC_2006 AS PC5 WHERE PC1.PATID = PC2.PATID AND PC1.PATID = PC3.PATID AND PC1.PATID = PC4.PATID AND PC1.PATID = PC5.PATID AND PC1.CONDITION < PC2.CONDITION AND PC2.CONDITION < PC3.CONDITION AND PC3.CONDITION < PC4.CONDITION AND PC4.CONDITION < PC5.CONDITION AND PC1.SEX = '0' GROUP BY PC1.CONDITION, PC2.CONDITION, PC3.CONDITION, PC4.CONDITION, PC5.CONDITION ORDER BY CT DESC" queryout "mcc5_male_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01-- PREVALENCE OF MCC WITH FIVE CONDITIONS OF FEMALE--PRINT 'ANALYZING PREVALENCE OF MCC WITH FIVE CONDITIONS OF FEMALE'--bcp "SELECT PC1.CONDITION, PC2.CONDITION, PC3.CONDITION, PC4.CONDITION, PC5.CONDITION, COUNT(DISTINCT PC1.PATID) AS CT FROM HCUP.dbo.HCUP_MCC_2006 AS PC1, HCUP.dbo.HCUP_MCC_2006 AS PC2, HCUP.dbo.HCUP_MCC_2006 AS PC3, HCUP.dbo.HCUP_MCC_2006 AS PC4, HCUP.dbo.HCUP_MCC_2006 AS PC5 WHERE PC1.PATID = PC2.PATID AND PC1.PATID = PC3.PATID AND PC1.PATID = PC4.PATID AND PC1.PATID = PC5.PATID AND PC1.CONDITION < PC2.CONDITION AND PC2.CONDITION < PC3.CONDITION AND PC3.CONDITION < PC4.CONDITION AND PC4.CONDITION < PC5.CONDITION AND PC1.SEX = '1' GROUP BY PC1.CONDITION, PC2.CONDITION, PC3.CONDITION, PC4.CONDITION, PC5.CONDITION ORDER BY CT DESC" queryout "mcc5_female_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01-- PREVALENCE OF MCC WITH SIX CONDITIONS--PRINT 'ANALYZING PREVALENCE OF MCC WITH SIX CONDITIONS'--bcp "SELECT PC1.CONDITION, PC2.CONDITION, PC3.CONDITION, PC4.CONDITION, PC5.CONDITION, PC6.CONDITION, COUNT(DISTINCT PC1.PATID) AS CT FROM HCUP.dbo.HCUP_MCC_2006 AS PC1, HCUP.dbo.HCUP_MCC_2006 AS PC2, HCUP.dbo.HCUP_MCC_2006 AS PC3, HCUP.dbo.HCUP_MCC_2006 AS PC4, HCUP.dbo.HCUP_MCC_2006 AS PC5, HCUP.dbo.HCUP_MCC_2006 AS PC6 WHERE PC1.PATID = PC2.PATID AND PC1.PATID = PC3.PATID AND PC1.PATID = PC4.PATID AND PC1.PATID = PC5.PATID AND PC1.PATID = PC6.PATID AND PC1.CONDITION < PC2.CONDITION AND PC2.CONDITION < PC3.CONDITION AND PC3.CONDITION < PC4.CONDITION AND PC4.CONDITION < PC5.CONDITION AND PC5.CONDITION < PC6.CONDITION GROUP BY PC1.CONDITION, PC2.CONDITION, PC3.CONDITION, PC4.CONDITION, PC5.CONDITION, PC6.CONDITION ORDER BY CT DESC" queryout "mcc6_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01-- PREVALENCE OF MCC WITH SIX CONDITIONS OF MALE--PRINT 'ANALYZING PREVALENCE OF MCC WITH SIX CONDITIONS OF MALE'--bcp "SELECT PC1.CONDITION, PC2.CONDITION, PC3.CONDITION, PC4.CONDITION, PC5.CONDITION, PC6.CONDITION, COUNT(DISTINCT PC1.PATID) AS CT FROM HCUP.dbo.HCUP_MCC_2006 AS PC1, HCUP.dbo.HCUP_MCC_2006 AS PC2, HCUP.dbo.HCUP_MCC_2006 AS PC3, HCUP.dbo.HCUP_MCC_2006 AS PC4, HCUP.dbo.HCUP_MCC_2006 AS PC5, HCUP.dbo.HCUP_MCC_2006 AS PC6 WHERE PC1.PATID = PC2.PATID AND PC1.PATID = PC3.PATID AND PC1.PATID = PC4.PATID AND PC1.PATID = PC5.PATID AND PC1.PATID = PC6.PATID AND PC1.CONDITION < PC2.CONDITION AND PC2.CONDITION < PC3.CONDITION AND PC3.CONDITION < PC4.CONDITION AND PC4.CONDITION < PC5.CONDITION AND PC5.CONDITION < PC6.CONDITION AND PC1.SEX = '0' GROUP BY PC1.CONDITION, PC2.CONDITION, PC3.CONDITION, PC4.CONDITION, PC5.CONDITION, PC6.CONDITION ORDER BY CT DESC" queryout "mcc6_male_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01-- PREVALENCE OF MCC WITH SIX CONDITIONS OF FEMALE--PRINT 'ANALYZING PREVALENCE OF MCC WITH SIX CONDITIONS OF FEMALE'--bcp "SELECT PC1.CONDITION, PC2.CONDITION, PC3.CONDITION, PC4.CONDITION, PC5.CONDITION, PC6.CONDITION, COUNT(DISTINCT PC1.PATID) AS CT FROM HCUP.dbo.HCUP_MCC_2006 AS PC1, HCUP.dbo.HCUP_MCC_2006 AS PC2, HCUP.dbo.HCUP_MCC_2006 AS PC3, HCUP.dbo.HCUP_MCC_2006 AS PC4, HCUP.dbo.HCUP_MCC_2006 AS PC5, HCUP.dbo.HCUP_MCC_2006 AS PC6 WHERE PC1.PATID = PC2.PATID AND PC1.PATID = PC3.PATID AND PC1.PATID = PC4.PATID AND PC1.PATID = PC5.PATID AND PC1.PATID = PC6.PATID AND PC1.CONDITION < PC2.CONDITION AND PC2.CONDITION < PC3.CONDITION AND PC3.CONDITION < PC4.CONDITION AND PC4.CONDITION < PC5.CONDITION AND PC5.CONDITION < PC6.CONDITION AND PC1.SEX = '1' GROUP BY PC1.CONDITION, PC2.CONDITION, PC3.CONDITION, PC4.CONDITION, PC5.CONDITION, PC6.CONDITION ORDER BY CT DESC" queryout "mcc6_female_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01-- PREVALENCE OF MCC WITH SEVEN CONDITIONS--PRINT 'ANALYZING PREVALENCE OF MCC WITH SEVEN CONDITIONS'--bcp "SELECT PC1.CONDITION, PC2.CONDITION, PC3.CONDITION, PC4.CONDITION, PC5.CONDITION, PC6.CONDITION, PC7.CONDITION, COUNT(DISTINCT PC1.PATID) AS CT FROM HCUP.dbo.HCUP_MCC_2006 AS PC1, HCUP.dbo.HCUP_MCC_2006 AS PC2, HCUP.dbo.HCUP_MCC_2006 AS PC3, HCUP.dbo.HCUP_MCC_2006 AS PC4, HCUP.dbo.HCUP_MCC_2006 AS PC5, HCUP.dbo.HCUP_MCC_2006 AS PC6, HCUP.dbo.HCUP_MCC_2006 AS PC7 WHERE PC1.PATID = PC2.PATID AND PC1.PATID = PC3.PATID AND PC1.PATID = PC4.PATID AND PC1.PATID = PC5.PATID AND PC1.PATID = PC6.PATID AND PC1.PATID = PC7.PATID AND PC1.CONDITION < PC2.CONDITION AND PC2.CONDITION < PC3.CONDITION AND PC3.CONDITION < PC4.CONDITION AND PC4.CONDITION < PC5.CONDITION AND PC5.CONDITION < PC6.CONDITION AND PC6.CONDITION < PC7.CONDITION GROUP BY PC1.CONDITION, PC2.CONDITION, PC3.CONDITION, PC4.CONDITION, PC5.CONDITION, PC6.CONDITION, PC7.CONDITION ORDER BY CT DESC" queryout "mcc7_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01-- PREVALENCE OF MCC WITH SEVEN CONDITIONS OF MALE--PRINT 'ANALYZING PREVALENCE OF MCC WITH SEVEN CONDITIONS OF MALE'--bcp "SELECT PC1.CONDITION, PC2.CONDITION, PC3.CONDITION, PC4.CONDITION, PC5.CONDITION, PC6.CONDITION, PC7.CONDITION, COUNT(DISTINCT PC1.PATID) AS CT FROM HCUP.dbo.HCUP_MCC_2006 AS PC1, HCUP.dbo.HCUP_MCC_2006 AS PC2, HCUP.dbo.HCUP_MCC_2006 AS PC3, HCUP.dbo.HCUP_MCC_2006 AS PC4, HCUP.dbo.HCUP_MCC_2006 AS PC5, HCUP.dbo.HCUP_MCC_2006 AS PC6, HCUP.dbo.HCUP_MCC_2006 AS PC7 WHERE PC1.PATID = PC2.PATID AND PC1.PATID = PC3.PATID AND PC1.PATID = PC4.PATID AND PC1.PATID = PC5.PATID AND PC1.PATID = PC6.PATID AND PC1.PATID = PC7.PATID AND PC1.CONDITION < PC2.CONDITION AND PC2.CONDITION < PC3.CONDITION AND PC3.CONDITION < PC4.CONDITION AND PC4.CONDITION < PC5.CONDITION AND PC5.CONDITION < PC6.CONDITION AND PC6.CONDITION < PC7.CONDITION AND PC1.SEX = '0' GROUP BY PC1.CONDITION, PC2.CONDITION, PC3.CONDITION, PC4.CONDITION, PC5.CONDITION, PC6.CONDITION, PC7.CONDITION ORDER BY CT DESC" queryout "mcc7_male_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01-- PREVALENCE OF MCC WITH SEVEN CONDITIONS OF FEMALE--PRINT 'ANALYZING PREVALENCE OF MCC WITH SEVEN CONDITIONS OF FEMALE'--bcp "SELECT PC1.CONDITION, PC2.CONDITION, PC3.CONDITION, PC4.CONDITION, PC5.CONDITION, PC6.CONDITION, PC7.CONDITION, COUNT(DISTINCT PC1.PATID) AS CT FROM HCUP.dbo.HCUP_MCC_2006 AS PC1, HCUP.dbo.HCUP_MCC_2006 AS PC2, HCUP.dbo.HCUP_MCC_2006 AS PC3, HCUP.dbo.HCUP_MCC_2006 AS PC4, HCUP.dbo.HCUP_MCC_2006 AS PC5, HCUP.dbo.HCUP_MCC_2006 AS PC6, HCUP.dbo.HCUP_MCC_2006 AS PC7 WHERE PC1.PATID = PC2.PATID AND PC1.PATID = PC3.PATID AND PC1.PATID = PC4.PATID AND PC1.PATID = PC5.PATID AND PC1.PATID = PC6.PATID AND PC1.PATID = PC7.PATID AND PC1.CONDITION < PC2.CONDITION AND PC2.CONDITION < PC3.CONDITION AND PC3.CONDITION < PC4.CONDITION AND PC4.CONDITION < PC5.CONDITION AND PC5.CONDITION < PC6.CONDITION AND PC6.CONDITION < PC7.CONDITION AND PC1.SEX = '1' GROUP BY PC1.CONDITION, PC2.CONDITION, PC3.CONDITION, PC4.CONDITION, PC5.CONDITION, PC6.CONDITION, PC7.CONDITION ORDER BY CT DESC" queryout "mcc7_female_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01/* NUMBER OF MCCs */PRINT 'ANALYZING NUMBER OF MCCs'bcp "SELECT A.NUMBER_OF_CONDITIONS, COUNT(A.PATID) FROM (SELECT PATID, COUNT(DISTINCT CONDITION) AS NUMBER_OF_CONDITIONS FROM HCUP.dbo.HCUP_MCC_2006 GROUP BY PATID) AS A GROUP BY A.NUMBER_OF_CONDITIONS ORDER BY A.NUMBER_OF_CONDITIONS ASC" queryout "number_of_mccs_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01/* NUMBER OF MCCs BY SEX */PRINT 'ANALYZING NUMBER OF MCCs OF MALE PATIENTS'bcp "SELECT A.NUMBER_OF_CONDITIONS, COUNT(A.PATID) FROM (SELECT PATID, COUNT(DISTINCT CONDITION) AS NUMBER_OF_CONDITIONS FROM HCUP.dbo.HCUP_MCC_2006 WHERE SEX = '0' GROUP BY PATID) AS A GROUP BY A.NUMBER_OF_CONDITIONS ORDER BY A.NUMBER_OF_CONDITIONS ASC" queryout "number_of_mccs_male_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01PRINT 'ANALYZING NUMBER OF MCCs OF FEMALE PATIENTS'bcp "SELECT A.NUMBER_OF_CONDITIONS, COUNT(A.PATID) FROM (SELECT PATID, COUNT(DISTINCT CONDITION) AS NUMBER_OF_CONDITIONS FROM HCUP.dbo.HCUP_MCC_2006 WHERE SEX = '1' GROUP BY PATID) AS A GROUP BY A.NUMBER_OF_CONDITIONS ORDER BY A.NUMBER_OF_CONDITIONS ASC" queryout "number_of_mccs_female_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01/* NUMBER OF MCCs BY AGE */PRINT 'ANALYZING NUMBER OF MCCs OF PATIENTS < 65 YEARS OLD'bcp "SELECT A.NUMBER_OF_CONDITIONS, COUNT(A.PATID) FROM (SELECT PATID, COUNT(DISTINCT CONDITION) AS NUMBER_OF_CONDITIONS FROM HCUP.dbo.HCUP_MCC_2006 WHERE AGE < 65 GROUP BY PATID) AS A GROUP BY A.NUMBER_OF_CONDITIONS ORDER BY A.NUMBER_OF_CONDITIONS ASC" queryout "number_of_mccs_smaller_than_65_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01PRINT 'ANALYZING NUMBER OF MCCs OF PATIENTS 65 - 74 YEARS OLD'bcp "SELECT A.NUMBER_OF_CONDITIONS, COUNT(A.PATID) FROM (SELECT PATID, COUNT(DISTINCT CONDITION) AS NUMBER_OF_CONDITIONS FROM HCUP.dbo.HCUP_MCC_2006 WHERE AGE >= 65 AND AGE <= 74 GROUP BY PATID) AS A GROUP BY A.NUMBER_OF_CONDITIONS ORDER BY A.NUMBER_OF_CONDITIONS ASC" queryout "number_of_mccs_65_74_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01PRINT 'ANALYZING NUMBER OF MCCs OF PATIENTS 75 - 84 YEARS OLD'bcp "SELECT A.NUMBER_OF_CONDITIONS, COUNT(A.PATID) FROM (SELECT PATID, COUNT(DISTINCT CONDITION) AS NUMBER_OF_CONDITIONS FROM HCUP.dbo.HCUP_MCC_2006 WHERE AGE >= 75 AND AGE <= 84 GROUP BY PATID) AS A GROUP BY A.NUMBER_OF_CONDITIONS ORDER BY A.NUMBER_OF_CONDITIONS ASC" queryout "number_of_mccs_75_84_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01PRINT 'ANALYZING NUMBER OF MCCs OF PATIENTS >= 85 OLD'bcp "SELECT A.NUMBER_OF_CONDITIONS, COUNT(A.PATID) FROM (SELECT PATID, COUNT(DISTINCT CONDITION) AS NUMBER_OF_CONDITIONS FROM HCUP.dbo.HCUP_MCC_2006 WHERE AGE >= 85 GROUP BY PATID) AS A GROUP BY A.NUMBER_OF_CONDITIONS ORDER BY A.NUMBER_OF_CONDITIONS ASC" queryout "number_of_mccs_larger_than_85_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01/* NUMBER OF MCCs BY RACE: NON-HISPANIC WHITE, NON-HISPANIC BLACK, ASIAN/PI, HISPANIC */PRINT 'ANALYZING NUMBER OF MCCs OF NON-HISPANIC WHITE'bcp "SELECT A.NUMBER_OF_CONDITIONS, COUNT(A.PATID) FROM (SELECT PATID, COUNT(DISTINCT CONDITION) AS NUMBER_OF_CONDITIONS FROM HCUP.dbo.HCUP_MCC_2006 WHERE RACE = '1' AND HISPANIC = '0'  GROUP BY PATID) AS A GROUP BY A.NUMBER_OF_CONDITIONS ORDER BY A.NUMBER_OF_CONDITIONS ASC" queryout "number_of_mccs_non_hispanic_white_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01PRINT 'ANALYZING NUMBER OF MCCs OF NON-HISPANIC BLACK'bcp "SELECT A.NUMBER_OF_CONDITIONS, COUNT(A.PATID) FROM (SELECT PATID, COUNT(DISTINCT CONDITION) AS NUMBER_OF_CONDITIONS FROM HCUP.dbo.HCUP_MCC_2006 WHERE RACE = '2' AND HISPANIC = '0'  GROUP BY PATID) AS A GROUP BY A.NUMBER_OF_CONDITIONS ORDER BY A.NUMBER_OF_CONDITIONS ASC" queryout "number_of_mccs_non_hispanic_black_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01PRINT 'ANALYZING NUMBER OF MCCs OF ASIAN/PI'bcp "SELECT A.NUMBER_OF_CONDITIONS, COUNT(A.PATID) FROM (SELECT PATID, COUNT(DISTINCT CONDITION) AS NUMBER_OF_CONDITIONS FROM HCUP.dbo.HCUP_MCC_2006 WHERE HISPANIC = '0' AND RACE = '4' GROUP BY PATID) AS A GROUP BY A.NUMBER_OF_CONDITIONS ORDER BY A.NUMBER_OF_CONDITIONS ASC" queryout "number_of_mccs_asian_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01PRINT 'ANALYZING NUMBER OF MCCs OF HISPANIC'bcp "SELECT A.NUMBER_OF_CONDITIONS, COUNT(A.PATID) FROM (SELECT PATID, COUNT(DISTINCT CONDITION) AS NUMBER_OF_CONDITIONS FROM HCUP.dbo.HCUP_MCC_2006 WHERE HISPANIC = '1' GROUP BY PATID) AS A GROUP BY A.NUMBER_OF_CONDITIONS ORDER BY A.NUMBER_OF_CONDITIONS ASC" queryout "number_of_mccs_hispanic_hcup2006.csv" -c -t "," -T -S AHC-ONEFL01PRINT 'ANALYZING NUMBER OF PATIENTS STRATIFIED BY AGE GROUP, GENDER, RACE/ETHNICITY'bcp "SELECT CONDITION, SEX, AGE_GROUP, ETHNICITY, COUNT(DISTINCT PATID) FROM HCUP.dbo.HCUP_MCC_2006 GROUP BY CONDITION, SEX, AGE_GROUP, ETHNICITY ORDER BY CONDITION, SEX, AGE_GROUP, ETHNICITY ASC" queryout "number_of_patients_condition_sex_age_group_ethnicity_HCUP_2006.csv" -c -t "," -T -S AHC-ONEFL01