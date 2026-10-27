/* Synthetic implementation of requirement AE-3. */

/* Read all columns as character so USUBJID keeps leading zeros. */
data synthetic_adae;
  infile "data/synthetic_adae.csv" dsd firstobs=2 truncover;
  length USUBJID $ 8 AETERM $ 200 AESEV $ 20;
  input USUBJID $ AETERM $ AESEV $;
run;

proc sql;
  create table ae_summary as
  select USUBJID, AETERM, AESEV
  from synthetic_adae
  where AESEV = "SEVERE";
quit;
