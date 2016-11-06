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

/* 1 White 
2 Black 
3 Hispanic 
4 Asian or Pacific Islander 
5 Native American 
6 Other 
. Missing 
.A Invalid 
.B Unavailable from source (coded in 1988-1997 data only) */
