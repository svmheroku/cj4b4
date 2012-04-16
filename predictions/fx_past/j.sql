ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
SELECT
'@fx_past_week.sql '||MIN(ydate) cmd
FROM fxpst12
WHERE price_6hr > 0
-- I only want recent data
AND ydate >= '2011-12-25'
GROUP BY TO_CHAR(ydate,'WW')
ORDER BY MIN(ydate)
/

exit
