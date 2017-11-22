ALTER TABLE HCUP.dbo.HCUP_MCC_2013 ADD AGE_GROUP varchar(50)
ALTER TABLE HCUP.dbo.HCUP_MCC_2013 ADD ETHNICITY varchar(50)

ALTER TABLE HCUP.dbo.HCUP_MCC_2012 ADD AGE_GROUP varchar(50)
ALTER TABLE HCUP.dbo.HCUP_MCC_2012 ADD ETHNICITY varchar(50)

ALTER TABLE HCUP.dbo.HCUP_MCC_2011 ADD AGE_GROUP varchar(50)
ALTER TABLE HCUP.dbo.HCUP_MCC_2011 ADD ETHNICITY varchar(50)

ALTER TABLE HCUP.dbo.HCUP_MCC_2010 ADD AGE_GROUP varchar(50)
ALTER TABLE HCUP.dbo.HCUP_MCC_2010 ADD ETHNICITY varchar(50)

ALTER TABLE HCUP.dbo.HCUP_MCC_2009 ADD AGE_GROUP varchar(50)
ALTER TABLE HCUP.dbo.HCUP_MCC_2009 ADD ETHNICITY varchar(50)

ALTER TABLE HCUP.dbo.HCUP_MCC_2008 ADD AGE_GROUP varchar(50)
ALTER TABLE HCUP.dbo.HCUP_MCC_2008 ADD ETHNICITY varchar(50)

ALTER TABLE HCUP.dbo.HCUP_MCC_2007 ADD AGE_GROUP varchar(50)
ALTER TABLE HCUP.dbo.HCUP_MCC_2007 ADD ETHNICITY varchar(50)

ALTER TABLE HCUP.dbo.HCUP_MCC_2006 ADD AGE_GROUP varchar(50)
ALTER TABLE HCUP.dbo.HCUP_MCC_2006 ADD ETHNICITY varchar(50)

ALTER TABLE HCUP.dbo.HCUP_MCC_2005 ADD AGE_GROUP varchar(50)
ALTER TABLE HCUP.dbo.HCUP_MCC_2005 ADD ETHNICITY varchar(50)

ALTER TABLE HCUP.dbo.HCUP_MCC_2004 ADD AGE_GROUP varchar(50)
ALTER TABLE HCUP.dbo.HCUP_MCC_2004 ADD ETHNICITY varchar(50)

ALTER TABLE HCUP.dbo.HCUP_MCC_2003 ADD AGE_GROUP varchar(50)
ALTER TABLE HCUP.dbo.HCUP_MCC_2003 ADD ETHNICITY varchar(50)

UPDATE HCUP.dbo.HCUP_MCC_2013 SET AGE_GROUP ='65_74' WHERE AGE >= 65 AND AGE <= 74
UPDATE HCUP.dbo.HCUP_MCC_2013 SET AGE_GROUP ='75_84' WHERE AGE >= 75 AND AGE <= 84
UPDATE HCUP.dbo.HCUP_MCC_2013 SET AGE_GROUP ='ABOVE_85' WHERE AGE >= 85
UPDATE HCUP.dbo.HCUP_MCC_2013 SET ETHNICITY='NON_HISPANIC_WHITE' WHERE RACE = '1' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2013 SET ETHNICITY='NON_HISPANIC_BLACK' WHERE RACE = '2' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2013 SET ETHNICITY='ASIAN_PI' WHERE RACE = '4' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2013 SET ETHNICITY='HISPANIC' WHERE HISPANIC = '1'

UPDATE HCUP.dbo.HCUP_MCC_2012 SET AGE_GROUP ='65_74' WHERE AGE >= 65 AND AGE <= 74
UPDATE HCUP.dbo.HCUP_MCC_2012 SET AGE_GROUP ='75_84' WHERE AGE >= 75 AND AGE <= 84
UPDATE HCUP.dbo.HCUP_MCC_2012 SET AGE_GROUP ='ABOVE_85' WHERE AGE >= 85
UPDATE HCUP.dbo.HCUP_MCC_2012 SET ETHNICITY='NON_HISPANIC_WHITE' WHERE RACE = '1' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2012 SET ETHNICITY='NON_HISPANIC_BLACK' WHERE RACE = '2' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2012 SET ETHNICITY='ASIAN_PI' WHERE RACE = '4' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2012 SET ETHNICITY='HISPANIC' WHERE HISPANIC = '1'

UPDATE HCUP.dbo.HCUP_MCC_2011 SET AGE_GROUP ='65_74' WHERE AGE >= 65 AND AGE <= 74
UPDATE HCUP.dbo.HCUP_MCC_2011 SET AGE_GROUP ='75_84' WHERE AGE >= 75 AND AGE <= 84
UPDATE HCUP.dbo.HCUP_MCC_2011 SET AGE_GROUP ='ABOVE_85' WHERE AGE >= 85
UPDATE HCUP.dbo.HCUP_MCC_2011 SET ETHNICITY='NON_HISPANIC_WHITE' WHERE RACE = '1' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2011 SET ETHNICITY='NON_HISPANIC_BLACK' WHERE RACE = '2' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2011 SET ETHNICITY='ASIAN_PI' WHERE RACE = '4' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2011 SET ETHNICITY='HISPANIC' WHERE HISPANIC = '1'

UPDATE HCUP.dbo.HCUP_MCC_2010 SET AGE_GROUP ='65_74' WHERE AGE >= 65 AND AGE <= 74
UPDATE HCUP.dbo.HCUP_MCC_2010 SET AGE_GROUP ='75_84' WHERE AGE >= 75 AND AGE <= 84
UPDATE HCUP.dbo.HCUP_MCC_2010 SET AGE_GROUP ='ABOVE_85' WHERE AGE >= 85
UPDATE HCUP.dbo.HCUP_MCC_2010 SET ETHNICITY='NON_HISPANIC_WHITE' WHERE RACE = '1' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2010 SET ETHNICITY='NON_HISPANIC_BLACK' WHERE RACE = '2' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2010 SET ETHNICITY='ASIAN_PI' WHERE RACE = '4' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2010 SET ETHNICITY='HISPANIC' WHERE HISPANIC = '1'

UPDATE HCUP.dbo.HCUP_MCC_2009 SET AGE_GROUP ='65_74' WHERE AGE >= 65 AND AGE <= 74
UPDATE HCUP.dbo.HCUP_MCC_2009 SET AGE_GROUP ='75_84' WHERE AGE >= 75 AND AGE <= 84
UPDATE HCUP.dbo.HCUP_MCC_2009 SET AGE_GROUP ='ABOVE_85' WHERE AGE >= 85
UPDATE HCUP.dbo.HCUP_MCC_2009 SET ETHNICITY='NON_HISPANIC_WHITE' WHERE RACE = '1' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2009 SET ETHNICITY='NON_HISPANIC_BLACK' WHERE RACE = '2' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2009 SET ETHNICITY='ASIAN_PI' WHERE RACE = '4' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2009 SET ETHNICITY='HISPANIC' WHERE HISPANIC = '1'

UPDATE HCUP.dbo.HCUP_MCC_2008 SET AGE_GROUP ='65_74' WHERE AGE >= 65 AND AGE <= 74
UPDATE HCUP.dbo.HCUP_MCC_2008 SET AGE_GROUP ='75_84' WHERE AGE >= 75 AND AGE <= 84
UPDATE HCUP.dbo.HCUP_MCC_2008 SET AGE_GROUP ='ABOVE_85' WHERE AGE >= 85
UPDATE HCUP.dbo.HCUP_MCC_2008 SET ETHNICITY='NON_HISPANIC_WHITE' WHERE RACE = '1' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2008 SET ETHNICITY='NON_HISPANIC_BLACK' WHERE RACE = '2' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2008 SET ETHNICITY='ASIAN_PI' WHERE RACE = '4' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2008 SET ETHNICITY='HISPANIC' WHERE HISPANIC = '1'

UPDATE HCUP.dbo.HCUP_MCC_2007 SET AGE_GROUP ='65_74' WHERE AGE >= 65 AND AGE <= 74
UPDATE HCUP.dbo.HCUP_MCC_2007 SET AGE_GROUP ='75_84' WHERE AGE >= 75 AND AGE <= 84
UPDATE HCUP.dbo.HCUP_MCC_2007 SET AGE_GROUP ='ABOVE_85' WHERE AGE >= 85
UPDATE HCUP.dbo.HCUP_MCC_2007 SET ETHNICITY='NON_HISPANIC_WHITE' WHERE RACE = '1' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2007 SET ETHNICITY='NON_HISPANIC_BLACK' WHERE RACE = '2' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2007 SET ETHNICITY='ASIAN_PI' WHERE RACE = '4' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2007 SET ETHNICITY='HISPANIC' WHERE HISPANIC = '1'

UPDATE HCUP.dbo.HCUP_MCC_2006 SET AGE_GROUP ='65_74' WHERE AGE >= 65 AND AGE <= 74
UPDATE HCUP.dbo.HCUP_MCC_2006 SET AGE_GROUP ='75_84' WHERE AGE >= 75 AND AGE <= 84
UPDATE HCUP.dbo.HCUP_MCC_2006 SET AGE_GROUP ='ABOVE_85' WHERE AGE >= 85
UPDATE HCUP.dbo.HCUP_MCC_2006 SET ETHNICITY='NON_HISPANIC_WHITE' WHERE RACE = '1' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2006 SET ETHNICITY='NON_HISPANIC_BLACK' WHERE RACE = '2' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2006 SET ETHNICITY='ASIAN_PI' WHERE RACE = '4' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2006 SET ETHNICITY='HISPANIC' WHERE HISPANIC = '1'

UPDATE HCUP.dbo.HCUP_MCC_2005 SET AGE_GROUP ='65_74' WHERE AGE >= 65 AND AGE <= 74
UPDATE HCUP.dbo.HCUP_MCC_2005 SET AGE_GROUP ='75_84' WHERE AGE >= 75 AND AGE <= 84
UPDATE HCUP.dbo.HCUP_MCC_2005 SET AGE_GROUP ='ABOVE_85' WHERE AGE >= 85
UPDATE HCUP.dbo.HCUP_MCC_2005 SET ETHNICITY='NON_HISPANIC_WHITE' WHERE RACE = '1' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2005 SET ETHNICITY='NON_HISPANIC_BLACK' WHERE RACE = '2' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2005 SET ETHNICITY='ASIAN_PI' WHERE RACE = '4' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2005 SET ETHNICITY='HISPANIC' WHERE HISPANIC = '1'

UPDATE HCUP.dbo.HCUP_MCC_2004 SET AGE_GROUP ='65_74' WHERE AGE >= 65 AND AGE <= 74
UPDATE HCUP.dbo.HCUP_MCC_2004 SET AGE_GROUP ='75_84' WHERE AGE >= 75 AND AGE <= 84
UPDATE HCUP.dbo.HCUP_MCC_2004 SET AGE_GROUP ='ABOVE_85' WHERE AGE >= 85
UPDATE HCUP.dbo.HCUP_MCC_2004 SET ETHNICITY='NON_HISPANIC_WHITE' WHERE RACE = '1' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2004 SET ETHNICITY='NON_HISPANIC_BLACK' WHERE RACE = '2' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2004 SET ETHNICITY='ASIAN_PI' WHERE RACE = '4' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2004 SET ETHNICITY='HISPANIC' WHERE HISPANIC = '1'

UPDATE HCUP.dbo.HCUP_MCC_2003 SET AGE_GROUP ='65_74' WHERE AGE >= 65 AND AGE <= 74
UPDATE HCUP.dbo.HCUP_MCC_2003 SET AGE_GROUP ='75_84' WHERE AGE >= 75 AND AGE <= 84
UPDATE HCUP.dbo.HCUP_MCC_2003 SET AGE_GROUP ='ABOVE_85' WHERE AGE >= 85
UPDATE HCUP.dbo.HCUP_MCC_2003 SET ETHNICITY='NON_HISPANIC_WHITE' WHERE RACE = '1' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2003 SET ETHNICITY='NON_HISPANIC_BLACK' WHERE RACE = '2' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2003 SET ETHNICITY='ASIAN_PI' WHERE RACE = '4' AND HISPANIC = '0'
UPDATE HCUP.dbo.HCUP_MCC_2003 SET ETHNICITY='HISPANIC' WHERE HISPANIC = '1'