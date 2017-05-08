SELECT cov.PEFROMDT, Trim(med.G7USEDF7) AS G7USEDF7, par.GPLAST, par.GPFIRST, par.GPMI, Trim(Left(cov.PECOVCAT,3)) AS COV1, Trim(Mid(cov.PECOVCAT,4,3)) AS COV2, Trim(Mid(cov.PECOVCAT,7,3)) AS COV3, 
Trim(Mid(cov.PECOVCAT,10,3)) AS COV4, Trim(Left(cov.PEPLAN,20)) AS PLAN1, Trim(Mid(cov.PEPLAN,21,20)) AS PLAN2, Trim(Mid(cov.PEPLAN,41,20)) AS PLAN3, 
Trim(Mid(cov.PEPLAN,61,20)) AS PLAN4, Left(cov.PEENRLEV,3) AS ENR1, Mid(cov.PEENRLEV,4,3) AS ENR2, Mid(cov.PEENRLEV,7,3) AS ENR3, Mid(cov.PEENRLEV,10,3) AS ENR4, Trim(med.G7USEDF1) AS SPOUSE, cov.PETODATE INTO RHTPayrDedFile
FROM (PARTICIP par INNER JOIN PARTCOVG cov ON (par.GPGROUP = cov.PEGROUP) AND (par.GPPARTIC = cov.PEPARTIC)) 
INNER JOIN PARTMEDC med ON (cov.PEPARTIC = med.G7PARTIC) AND (cov.PEGROUP = med.G7GROUP)
WHERE (((cov.PEFROMDT)<=Format(DateSerial(Year(Now()),Month(Now())+1,1),"yyyymmdd")) 
AND ((cov.PETODATE)>=Format(DateSerial(Year(Now()),Month(Now())+1,1),"yyyymmdd")) 
AND ((par.GPGROUP)="RHT") 
AND ((Len(Trim(cov.PECOVCAT)))>0) 
AND ((cov.PEGROUP)="RHT") 
AND ((med.G7GROUP)="RHT") 
AND ((par.GPDIV)<>"0501"))
ORDER BY cov.PETODATE DESC;
