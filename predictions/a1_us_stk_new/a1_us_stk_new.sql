--
-- a1_us_stk_new.sql
--

SET TIME off TIMING off ECHO off PAGESIZE 9999 LINESIZE 188
SET MARKUP HTML ON TABLE "class='table_a1_us_stk_new'"
SPOOL /tmp/_a1_us_stk_new_spool.html.erb

COLUMN tkr FORMAT A12  HEADING  'Stock|Ticker'
COLUMN gmt_time_at_hr0 FORMAT A19  HEADING 'GMT Time|at hour 0' 
COLUMN price_at_hr0 FORMAT 9999.99 HEADING 'Price|at|Hour 0'
COLUMN danbot_score FORMAT 9.99    HEADING 'DanBot|Score at|Hour 0'
COLUMN score_type FORMAT A5        HEADING 'Score|Type'
COLUMN gain_at_hr1  FORMAT 9999.99 HEADING 'Gain|at|Hour 1'
COLUMN gmt_time_at_hr24 FORMAT A25  HEADING 'GMT Time|at hour 24|(Time to Close Position)' 

SELECT
'tkr: '||tkr tkr
,ydate gmt_time_at_hr0
,ROUND(price_0hr,2)  price_at_hr0           
,ROUND(score_diff,2) danbot_score
,CASE WHEN score_diff<0 THEN'Sell'ELSE'Buy'END score_type
,ROUND(g1hr,2)       gain_at_hr1            
,CASE WHEN TO_CHAR(ydate,'Dy')='Fri'THEN
 TO_CHAR(ydate+3,'Dy: YYYY-MM-DD HH24:MI')
 ELSE 
 TO_CHAR(ydate+1,'Dy: YYYY-MM-DD HH24:MI')
 END gmt_time_at_hr24
-- Assume  us_stk_pst13n was build a few minutes ago by ../us_stk_new/us_stk_pst13.sql: 
FROM us_stk_pst13n
WHERE rnng_crr1 > 0
AND ABS(score_diff) > 0.55
AND price_24hr IS NULL
AND ydate > (SELECT MAX(ydate)FROM us_stk_pst13n) - 6/24
ORDER BY SIGN(score_diff),tkr,ydate
/

SPOOL OFF
SET MARKUP HTML OFF

exit
