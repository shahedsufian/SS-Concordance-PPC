/* Define the library reference path within "" for the data sets */
libname pldf v8 "";

/* Define the filename for the data set and insert the file path of the data set within ''. 
h217, h210, h202, h193, and h183 represent MEPS Panel 23, 22, 21, 20, and 19 Longitudinal 
Data Files respectively*/
%let files = h217 h210 h202 h193 h183;
%macro import_files;
    %do i = 1 %to 5;
        %let file = %scan(&files, &i);
        filename pldf&i "\&file..ssp";
        %if &i = 1 or &i = 2 %then %do;
            proc cimport file=pldf&i lib=pldf compress=char;
            run;
        %end;
        %else %do;
            proc xcopy in=pldf&i out=pldf import;
            run;
        %end;
    %end;
%mend;
%import_files;

/* Create a new data set for panel 23 with selected variables */
data p23; set pldf.h217 (keep=DUPERSID PANEL YEARIND LONGWT LSAQWT VARSTR VARPSU ADLIST4 
ADEXPL4 ADRESP4 ADPRTM4 RACETHX HSPLAP4 WHITPR4 BLCKPR4 ASIANP4 NATAMP4 PACISP4 
OTHRCP4 SEX GENDRP4 OTHLGSPK WHTLGSPK HWELLSPK PRVSPK4 AGE1X REGION1 EDUCYR 
POVCATY1 POVLEVY1 INSCOVY1 INSURCY1 MARRY1X HAVEUS4 PROVTY4_M18 PLCTYP4 TYPEPE4 
LOCATN4 EMPST1 RTHLTH1 MNHLTH1 BORNUSA YRSINUS ADAPPT4 TREATM4 DECIDE4 EXPLOP4);
run;

/* Create a new data set for panel 22 with selected variables */
data p22; set pldf.h210 (keep=DUPERSID PANEL YEARIND LONGWT LSAQWT VARSTR VARPSU ADLIST2 
ADEXPL2 ADRESP2 ADPRTM2 RACETHX HSPLAP2 WHITPR2 BLCKPR2 ASIANP2 NATAMP2 PACISP2 
OTHRCP2 SEX GENDRP2 OTHLGSPK WHTLGSPK HWELLSPK PRVSPK2 AGE1X REGION1 EDUCYR POVCATY1 
POVLEVY1 INSCOVY1 INSURCY1 MARRY1X HAVEUS2 PROVTY2 PLCTYP2 TYPEPE2 LOCATN2 EMPST1 RTHLTH1 
MNHLTH1 BORNUSA YRSINUS ADAPPT2 TREATM2 DECIDE2 EXPLOP2);
run;

/* Create a new data set for panel 21 with selected variables */
data p21; set pldf.h202 (keep=DUPERSID PANEL YEARIND LONGWT LSAQWT VARSTR VARPSU ADLIST2 
ADEXPL2 ADRESP2 ADPRTM2 RACETHX HSPLAP2 WHITPR2 BLCKPR2 ASIANP2 NATAMP2 PACISP2 
OTHRCP2 SEX GENDRP2 OTHLANG LANGSPK HWELLSPE PRVSPK2 AGE1X REGION1 EDUCYR POVCATY1 
POVLEVY1 INSCOVY1 INSURCY1 MARRY1X HAVEUS2 PROVTY2 PLCTYP2 TYPEPE2 LOCATN2 EMPST1 RTHLTH1 
MNHLTH1 BORNUSA YRSINUS ADAPPT2 TREATM2 DECIDE2 EXPLOP2);
run;

/* Create a new data set for panel 20 with selected variables */
data p20; set pldf.h193 (keep=DUPERSID PANEL YEARIND LONGWT LSAQWT VARSTR VARPSU ADLIST2 
ADEXPL2 ADRESP2 ADPRTM2 RACETHX HSPLAP2 WHITPR2 BLCKPR2 ASIANP2 NATAMP2 PACISP2 
OTHRCP2 SEX GENDRP2 OTHLANG LANGSPK HWELLSPE PRVSPK2 AGE1X REGION1 EDUCYR POVCATY1 
POVLEVY1 INSCOVY1 INSURCY1 MARRY1X HAVEUS2 PROVTY2 PLCTYP2 TYPEPE2 LOCATN2 EMPST1 RTHLTH1 
MNHLTH1 BORNUSA YRSINUS ADAPPT2 TREATM2 DECIDE2 EXPLOP2);
run;

/* Create a new data set for panel 19 with selected variables */
data p19; set pldf.h183 (keep=DUPERSID PANEL YEARIND LONGWT LSAQWT VARSTR VARPSU ADLIST2 
ADEXPL2 ADRESP2 ADPRTM2 RACETHX HSPLAP2 WHITPR2 BLCKPR2 ASIANP2 NATAMP2 PACISP2 
OTHRCP2 SEX GENDRP2 OTHLANG LANGSPK HWELLSPE PRVSPK2 AGE1X REGION1 EDUCYR POVCATY1 
POVLEVY1 INSCOVY1 INSURCY1 MARRY1X HAVEUS2 PROVTY2 PLCTYP2 TYPEPE2 LOCATN2 EMPST1 RTHLTH1 
MNHLTH1 BORNUSA YRSINUS ADAPPT2 TREATM2 DECIDE2 EXPLOP2);
run;

/* Rename variables for consistency across years */
data p23a;
set p23;
rename ADLIST4 = ADLIST ADEXPL4 = ADEXPL ADRESP4 = ADRESP ADPRTM4 = ADPRTM RACETHX = RACE 
HSPLAP4 = HSPLAP WHITPR4 = WHITPR BLCKPR4 = BLCKPR ASIANP4 = ASIANP NATAMP4 = NATAMP
PACISP4 = PACISP OTHRCP4 = OTHRCP GENDRP4 = GENDRP PRVSPK4 = PRVSPK AGE1X = AGE
REGION1 = REGION POVCATY1 = POVCATY POVLEVY1 = POVLEVY INSCOVY1 = INSCOVY INSURCY1 = INSURCY
MARRY1X = MARRY HAVEUS4 = HAVEUS PROVTY4_M18 = PROVTY PLCTYP4 = PLCTYP TYPEPE4 = TYPEPE
LOCATN4 = LOCATN EMPST1 = EMPST RTHLTH1 = RTHLTH MNHLTH1 = MNHLTH ADAPPT4 = ADAPPT
TREATM4 = TREATM DECIDE4 = DECIDE EXPLOP4 = EXPLOP
;
run;

/* Rename variables for consistency across years */
data p22a;
set p22;
rename ADLIST2 = ADLIST
ADEXPL2 = ADEXPL
ADRESP2 = ADRESP
ADPRTM2 = ADPRTM
RACETHX = RACE
HSPLAP2 = HSPLAP
WHITPR2 = WHITPR
BLCKPR2 = BLCKPR
ASIANP2 = ASIANP
NATAMP2 = NATAMP
PACISP2 = PACISP
OTHRCP2 = OTHRCP
GENDRP2 = GENDRP
OTHLGSPK = OTHLGSPK
WHTLGSPK = WHTLGSPK
HWELLSPK = HWELLSPK
PRVSPK2 = PRVSPK
AGE1X = AGE
REGION1 = REGION
POVCATY1 = POVCATY
POVLEVY1 = POVLEVY
INSCOVY1 = INSCOVY
INSURCY1 = INSURCY
MARRY1X = MARRY
HAVEUS2 = HAVEUS
PROVTY2 = PROVTY
PLCTYP2 = PLCTYP
TYPEPE2 = TYPEPE
LOCATN2 = LOCATN
EMPST1 = EMPST
RTHLTH1 = RTHLTH
MNHLTH1 = MNHLTH
ADAPPT2 = ADAPPT
TREATM2 = TREATM
DECIDE2 = DECIDE
EXPLOP2 = EXPLOP
;
run;

/* Rename variables for consistency across years */
data p21a;
set p21;
rename ADLIST2 = ADLIST
ADEXPL2 = ADEXPL
ADRESP2 = ADRESP
ADPRTM2 = ADPRTM
RACETHX = RACE
HSPLAP2 = HSPLAP
WHITPR2 = WHITPR
BLCKPR2 = BLCKPR
ASIANP2 = ASIANP
NATAMP2 = NATAMP
PACISP2 = PACISP
OTHRCP2 = OTHRCP
GENDRP2 = GENDRP
OTHLANG = OTHLGSPK
LANGSPK = WHTLGSPK
HWELLSPE = HWELLSPK
PRVSPK2 = PRVSPK
AGE1X = AGE
REGION1 = REGION
POVCATY1 = POVCATY
POVLEVY1 = POVLEVY
INSCOVY1 = INSCOVY
INSURCY1 = INSURCY
MARRY1X = MARRY
HAVEUS2 = HAVEUS
PROVTY2 = PROVTY
PLCTYP2 = PLCTYP
TYPEPE2 = TYPEPE
LOCATN2 = LOCATN
EMPST1 = EMPST
RTHLTH1 = RTHLTH
MNHLTH1 = MNHLTH
ADAPPT2 = ADAPPT
TREATM2 = TREATM
DECIDE2 = DECIDE
EXPLOP2 = EXPLOP
;
run;

/* Rename variables for consistency across years */
data p20a;
set p20;
rename ADLIST2 = ADLIST
ADEXPL2 = ADEXPL
ADRESP2 = ADRESP
ADPRTM2 = ADPRTM
RACETHX = RACE
HSPLAP2 = HSPLAP
WHITPR2 = WHITPR
BLCKPR2 = BLCKPR
ASIANP2 = ASIANP
NATAMP2 = NATAMP
PACISP2 = PACISP
OTHRCP2 = OTHRCP
GENDRP2 = GENDRP
OTHLANG = OTHLGSPK
LANGSPK = WHTLGSPK
HWELLSPE = HWELLSPK
PRVSPK2 = PRVSPK
AGE1X = AGE
REGION1 = REGION
POVCATY1 = POVCATY
POVLEVY1 = POVLEVY
INSCOVY1 = INSCOVY
INSURCY1 = INSURCY
MARRY1X = MARRY
HAVEUS2 = HAVEUS
PROVTY2 = PROVTY
PLCTYP2 = PLCTYP
TYPEPE2 = TYPEPE
LOCATN2 = LOCATN
EMPST1 = EMPST
RTHLTH1 = RTHLTH
MNHLTH1 = MNHLTH
ADAPPT2 = ADAPPT
TREATM2 = TREATM
DECIDE2 = DECIDE
EXPLOP2 = EXPLOP
;
run;

/* Rename variables for consistency across years */
data p19a;
set p19;
rename ADLIST2 = ADLIST
ADEXPL2 = ADEXPL
ADRESP2 = ADRESP
ADPRTM2 = ADPRTM
RACETHX = RACE
HSPLAP2 = HSPLAP
WHITPR2 = WHITPR
BLCKPR2 = BLCKPR
ASIANP2 = ASIANP
NATAMP2 = NATAMP
PACISP2 = PACISP
OTHRCP2 = OTHRCP
GENDRP2 = GENDRP
OTHLANG = OTHLGSPK
LANGSPK = WHTLGSPK
HWELLSPE = HWELLSPK
PRVSPK2 = PRVSPK
AGE1X = AGE
REGION1 = REGION
POVCATY1 = POVCATY
POVLEVY1 = POVLEVY
INSCOVY1 = INSCOVY
INSURCY1 = INSURCY
MARRY1X = MARRY
HAVEUS2 = HAVEUS
PROVTY2 = PROVTY
PLCTYP2 = PLCTYP
TYPEPE2 = TYPEPE
LOCATN2 = LOCATN
EMPST1 = EMPST
RTHLTH1 = RTHLTH
MNHLTH1 = MNHLTH
ADAPPT2 = ADAPPT
TREATM2 = TREATM
DECIDE2 = DECIDE
EXPLOP2 = EXPLOP
;
run;

/* Retain variables in the specified order */
%macro retain_vars;
    %do i = 1 %to 5;
        %let panel = %eval(23 - &i + 1);
        data p&panel.a;
            retain DUPERSID PANEL YEARIND LONGWT LSAQWT VARSTR VARPSU ADLIST ADEXPL 
                ADRESP ADPRTM RACETHX HSPLAP WHITPR BLCKPR ASIANP NATAMP PACISP OTHRCP 
                SEX GENDRP OTHLGSPK WHTLGSPK HWELLSPK PRVSPK AGE1X REGION1 EDUCYR 
                POVCATY1 POVLEVY1 INSCOVY1 INSURCY1 MARRY1X HAVEUS PROVTY4_M18 PLCTYP 
                TYPEPE LOCATN EMPST1 RTHLTH1 MNHLTH1 BORNUSA YRSINUS ADAPPT TREATM 
                DECIDE EXPLOP;
            set p&panel.a;
        run;
    %end;
%mend;
%retain_vars;

/* Sort the data sets by DUPERSID */
%macro sort_data;
    %do i = 1 %to 5;
        %let panel = %eval(23 - &i + 1);
        proc sort data=p&panel.a;
            by DUPERSID;
        run;
    %end;
%mend;
%sort_data;

/* Merge data sets from the 5 different years and create weights */
data pmerge;
    set p23a p22a p21a p20a p19a;
    lwt1923 = longwt / 5;
    lsaqwt1923 = LSAQWT / 5;
run;
/*n=77140*/

/* Filter data for individuals aged 18-64 */
data ipmerge;
set pmerge;
if (AGE >=18 and AGE<65) then output;
run;
/*n=44410*/

/* Filter data for individuals with complete responses on key variables. Refer to the 
codebook folder for details on the variables*/
data ipmerge;
set ipmerge;
if (ADLIST > 0 and ADEXPL > 0 and ADRESP > 0 and ADPRTM > 0 and RTHLTH > 0 and MNHLTH > 0) then output;
run;
/*n=23478*/

/* Create a variable for provider race/ethnicity */
data ipmerge1;
set ipmerge;
if HSPLAP = 1 then PRVRACE = 1;
else if WHITPR = 1 then PRVRACE = 2;
else if BLCKPR = 1 then PRVRACE = 3;
else if ASIANP = 1 then PRVRACE = 4;
else if NATAMP = 1 then PRVRACE = 5;
else if PACISP = 1 then PRVRACE = 5;
else if OTHRCP = 1 then PRVRACE = 5;
else PRVRACE = 0;
run;
/*n=23478*/

/* Filter data for individuals with complete responses on provider race/ethnicity, 
12 MOS: # VISITS MED OFF FOR CARE, and gender */
data ipmerge1;
set ipmerge1;
if (PRVRACE > 0 and ADAPPT > 0 and GENDRP > 0) then output;
run;
/*n=8950*/

data ipmerge1;
    set ipmerge1;

    /* Create age categories */
    if 18 <= AGE < 25 then agecat = 1; 
    else if 25 <= AGE < 45 then agecat = 2; 
    else if 45 <= AGE < 65 then agecat = 3;

    /* Create education categories */
    if EDUCYR <= 11 then educat = 1; 
    else if EDUCYR = 12 then educat = 2; 
    else if 13 <= EDUCYR <= 16 then educat = 3;
    else if EDUCYR >= 17 then educat = 4;

    /* Create marital status categories */
    if MARRY in (1, 7) then marrycat = 1; 
    else if MARRY in (2, 3, 4, 8, 9, 10) then marrycat = 2;
    else if MARRY = 5 then marrycat = 3;

    /* Create poverty level categories */
    if POVLEVY < 100 then povcat2 = 1; 
    else if 100 <= POVLEVY < 200 then povcat2 = 2; 
    else if 200 <= POVLEVY < 400 then povcat2 = 3;
    else if POVLEVY >= 400 then povcat2 = 4;

    /* Create visit frequency categories */
    if ADAPPT in (1, 2) then visitcat = 0;
    else if ADAPPT in (3, 4, 5, 6) then visitcat = 1;

    /* Create provider type categories */
    if TYPEPE in (1, 2) then prvcat = "MD-general or internal med";
    else if TYPEPE in (3, 4, 6, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23) then prvcat = "Other MD";
    else if TYPEPE in (8, 9, 10) then prvcat = "Nurse and phy's assistant";
    else if TYPEPE in (7, 11, 12, 24) then prvcat = "Other non MD";

    /* Categorize response variables (always+usually=1, sometimes+never=0) */
    if ADLIST in (1, 2) then listyn2 = 0; 
    else if ADLIST in (3, 4) then listyn2 = 1;

    if ADEXPL in (1, 2) then explyn2 = 0; 
    else if ADEXPL in (3, 4) then explyn2 = 1;

    if ADRESP in (1, 2) then respyn2 = 0; 
    else if ADRESP in (3, 4) then respyn2 = 1;

    if ADPRTM in (1, 2) then prtmyn2 = 0; 
    else if ADPRTM in (3, 4) then prtmyn2 = 1;

    /* Create the race concordance variable */
    if (RACE = PRVRACE) then RACECDN = 1;
    else RACECDN = 0;
run;

/* Plot histogram and density of whether the provider listened carefully */
proc sgplot data=ipmerge1;
 	histogram ADLIST;
  	density ADLIST;
  	title 'Histogram and density plot of whether the provider listened carefully';
	label ADLIST = 'Listened carefully';
run;

/* Frequency analysis of key variables */
proc freq data=ipmerge1; 
tables listyn2 RACECDN agecat sex marrycat race educat region povcat2 inscovy rthlth 
mnhlth visitcat EMPST BORNUSA YRSINUS prvcat PROVTY PANEL TREATM DECIDE EXPLOP PRVSPK 
OTHLGSPK WHTLGSPK HWELLSPK;
run;

/* Survey frequency analysis with weights, strata, and clusters */
proc surveyfreq data=ipmerge1; 
tables listyn2 RACECDN agecat sex marrycat race educat region povcat2 inscovy rthlth 
mnhlth visitcat EMPST BORNUSA YRSINUS prvcat PROVTY PANEL TREATM DECIDE EXPLOP PRVSPK 
OTHLGSPK WHTLGSPK HWELLSPK visitcat;
	stratum varstr;
	cluster varpsu;
	weight lsaqwt1923;
run;

/* Frequency analysis with chi-square test */
proc freq data=ipmerge1;
  tables RACECDN*agecat / chisq;
run;

/* Evaluating association of each of the outcome variable and control variables with the predictor variable-race concordance*/
proc surveyfreq data = ipmerge1; 
table RACECDN*(agecat sex marrycat race PRVRACE educat region povcat2 inscovy rthlth 
mnhlth visitcat prvcat PROVTY BORNUSA listyn2 explyn2 respyn2 prtmyn2 visitcat) / row col chisq plots = none;
	stratum varstr;
	cluster varpsu;
	weight lsaqwt1923;
run;

/* Influence of race concordant visits on each of the four quality of PPC measures */
%macro survey_logistic(outcome);
    proc surveylogistic data=ipmerge1;
        stratum varstr;
        cluster varpsu;
        weight lsaqwt1923;
        class agecat (ref="1") sex (ref="1") marrycat (ref="3") race (ref="2") educat (ref="4") 
		region (ref="1") povcat2 (ref="4") inscovy (ref="1") rthlth (ref="1") mnhlth (ref="1") visitcat (ref="1") 
		prvcat (ref="MD-general or internal med") PROVTY (ref="2") BORNUSA (ref="1") PANEL (ref="19");
     	model &outcome (descending) = RACECDN agecat sex marrycat race educat region povcat2 inscovy 
		rthlth mnhlth visitcat prvcat PROVTY BORNUSA PANEL;
    run;
%mend;

%survey_logistic(listyn2);
%survey_logistic(explyn2);
%survey_logistic(respyn2);
%survey_logistic(prtmyn2);

/* Filter data for race concordant visits */
data ipmerge2;
    set ipmerge1;
    if (RACECDN > 0) then output;
run;

/* Frequency analysis of race variable */
proc freq data=ipmerge2; 
    tables race;
run;

/* Multivariable logistic regression to present disparity in the quality measures of PPC by patient's race/ethnicity among those who had race concordant visits */
%macro survey_logistic_race(outcome);
    proc surveylogistic data=ipmerge2;
        stratum varstr;
        cluster varpsu;
        weight lsaqwt1923;
        class agecat (ref="1") sex (ref="1") marrycat (ref="3") race (ref="2") educat (ref="4") region (ref="1") 
		povcat2 (ref="4") inscovy (ref="1") rthlth (ref="1") mnhlth (ref="1") visitcat (ref="1") prvcat (ref="MD-general or internal med") 
		PROVTY (ref="2") BORNUSA (ref="1") PANEL (ref="19");
        model &outcome (descending) = race agecat sex marrycat educat region povcat2 inscovy rthlth mnhlth visitcat prvcat PROVTY BORNUSA PANEL;
    run;
%mend;

%survey_logistic_race(listyn2);
%survey_logistic_race(explyn2);
%survey_logistic_race(respyn2);
%survey_logistic_race(prtmyn2);
