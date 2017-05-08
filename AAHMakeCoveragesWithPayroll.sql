SELECT coverages_tobump.Id, coverages_tobump.Group_Number, coverages_tobump.Division, divisions.Division_Description, coverages_tobump.Effective_From, coverages_tobump.Effective_To, coverages_tobump.Added, 
coverages_tobump.Added_By, coverages_tobump.Changed, coverages_tobump.Changed_By, coverages_tobump.Change_Type, coverages_tobump.Change_Reason, coverages_tobump.Participant, coverages_tobump.Product, products.Product_Description, 
coverages_tobump.Plan, plans.Plan_Description, coverages_tobump.Enrollment, coverages_tobump.Volume, PayrollReport.Premium, (PayrollReport.Premium - PayrollReport.Employee) AS Employer, PayrollReport.Employee, PayrollReport.Payroll INTO coverages_wpayroll
FROM (((coverages_tobump INNER JOIN PayrollReport ON (coverages_tobump.Plan = PayrollReport.Plan) 
AND (coverages_tobump.Product = PayrollReport.Product) 
AND (coverages_tobump.Participant = PayrollReport.Id)) 
INNER JOIN divisions ON coverages_tobump.Division = divisions.Division) 
INNER JOIN plans ON coverages_tobump.Plan = plans.Plan) 
INNER JOIN products ON coverages_tobump.Product = products.Product;
