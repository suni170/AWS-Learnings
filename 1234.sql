let
    Source = Sql.Database("logicreporting.database.windows.net", "LogicBIReportingPROD", [Query="

select distinct * from (


SELECT *, CAST(0 AS BIT) [HighConfidence] 
FROM 
(
	SELECT " & TodayVar & " [AsOfDate]
	--SELECT GETDATE() [AsOfDate]
			, ProjectKey
			, AccountKey
			, SegmentKey
			, SalesPersonKey
			, ClientDirectorPersonKey
			, PracticeKey
			, SalesStage
			, ProjectStatus
			, OpportunityKey
			, WinProbability
			, AccountType
			, AssignedOffice
			, SalesPerson
			, [DimPerson(ClientDirectorPersonKey).FirstName]
			, [DimPerson(ClientDirectorPersonKey).LastName]
			, [DimProject.ProjectType]
			, [DimProject.ProjectNumber]
			, [DimProject.ProjectName]
			, [DimProject.BusinessType]
			, [DimProject.ProjectStartDate]
			, [DimProject.ProjectEndDate]
			, [DimProject.WorkdayObjectID]
			, [DimProject.Commission]
			, [DimProject.DealType]
			, [DimSegment.SegmentName]
			, [DimAccount.AccountType]
			, [DimAccount.AccountName]
			, [DimPractice.PracticeName]
			, [WorkdayURL]
			, [Project Owner]
			, [EIC]
			, FinancialType
			, SUM([Jan-26]) [Jan-26]
			, SUM([Feb-26]) [Feb-26]
			, SUM([Mar-26]) [Mar-26]
			, SUM([Apr-26]) [Apr-26]
			, SUM([May-26]) [May-26]
			, SUM([Jun-26]) [Jun-26]
			, SUM([Jul-26]) [Jul-26]
			, SUM([Aug-26]) [Aug-26]
			, SUM([Sep-26]) [Sep-26]
			, SUM([Oct-26]) [Oct-26]
			, SUM([Nov-26]) [Nov-26]
			, SUM([Dec-26]) [Dec-26]
			, SUM([Jan-27]) [Jan-27]
			, SUM([Feb-27]) [Feb-27]
			, SUM([Mar-27]) [Mar-27]
			, SUM([Apr-27]) [Apr-27]
			, SUM([May-27]) [May-27]
			, SUM([Jun-27]) [Jun-27]
			, SUM([Jul-27]) [Jul-27]
			, SUM([Aug-27]) [Aug-27]
			, SUM([Sep-27]) [Sep-27]
			, SUM([Oct-27]) [Oct-27]
			, SUM([Nov-27]) [Nov-27]
			, SUM([Dec-27]) [Dec-27]
		FROM
			(SELECT FactProjectSummaryKey
						, ProjectKey
						, AccountKey
						, SegmentKey
						, SalesPersonKey
						, ClientDirectorPersonKey
						, PracticeKey
						, SalesStage
						, ProjectStatus
						, OpportunityKey
						, WinProbability
						, AccountType
						, AssignedOffice
						, SalesPerson
						, ValidFrom
						, ValidTo
						, [DimPerson(ClientDirectorPersonKey).FirstName]
						, [DimPerson(ClientDirectorPersonKey).LastName]
						, [DimProject.ProjectType]
						, [DimProject.ProjectNumber]
						, [DimProject.ProjectName]
						, [DimProject.BusinessType]
						, [DimProject.ProjectStartDate]
						, [DimProject.ProjectEndDate]
						, [DimProject.WorkdayObjectID]
						, [DimProject.Commission]
						, [DimProject.DealType]
						, [DimSegment.SegmentName]
						, [DimAccount.AccountType]
						, [DimAccount.AccountName]
						, [DimPractice.PracticeName]
						, [WorkdayURL]
						, [Project Owner]
						, [EIC] 
						, FinancialType
						, CASE WHEN [MonthStart] = 'Jan  1 2026 12:00AM' THEN SUM(Revenue) END [Jan-26]
						, CASE WHEN [MonthStart] = 'Feb  1 2026 12:00AM' THEN SUM(Revenue) END [Feb-26]
						, CASE WHEN [MonthStart] = 'Mar  1 2026 12:00AM' THEN SUM(Revenue) END [Mar-26]
						, CASE WHEN [MonthStart] = 'Apr  1 2026 12:00AM' THEN SUM(Revenue) END [Apr-26]
						, CASE WHEN [MonthStart] = 'May  1 2026 12:00AM' THEN SUM(Revenue) END [May-26]
						, CASE WHEN [MonthStart] = 'Jun  1 2026 12:00AM' THEN SUM(Revenue) END [Jun-26]
						, CASE WHEN [MonthStart] = 'Jul  1 2026 12:00AM' THEN SUM(Revenue) END [Jul-26]
						, CASE WHEN [MonthStart] = 'Aug  1 2026 12:00AM' THEN SUM(Revenue) END [Aug-26]
						, CASE WHEN [MonthStart] = 'Sep  1 2026 12:00AM' THEN SUM(Revenue) END [Sep-26]
						, CASE WHEN [MonthStart] = 'Oct  1 2026 12:00AM' THEN SUM(Revenue) END [Oct-26]
						, CASE WHEN [MonthStart] = 'Nov  1 2026 12:00AM' THEN SUM(Revenue) END [Nov-26]
						, CASE WHEN [MonthStart] = 'Dec  1 2026 12:00AM' THEN SUM(Revenue) END [Dec-26]
						, CASE WHEN [MonthStart] = 'Jan  1 2027 12:00AM' THEN SUM(Revenue) END [Jan-27]
						, CASE WHEN [MonthStart] = 'Feb  1 2027 12:00AM' THEN SUM(Revenue) END [Feb-27]
						, CASE WHEN [MonthStart] = 'Mar  1 2027 12:00AM' THEN SUM(Revenue) END [Mar-27]
						, CASE WHEN [MonthStart] = 'Apr  1 2027 12:00AM' THEN SUM(Revenue) END [Apr-27]
						, CASE WHEN [MonthStart] = 'May  1 2027 12:00AM' THEN SUM(Revenue) END [May-27]
						, CASE WHEN [MonthStart] = 'Jun  1 2027 12:00AM' THEN SUM(Revenue) END [Jun-27]
						, CASE WHEN [MonthStart] = 'Jul  1 2027 12:00AM' THEN SUM(Revenue) END [Jul-27]
						, CASE WHEN [MonthStart] = 'Aug  1 2027 12:00AM' THEN SUM(Revenue) END [Aug-27]
						, CASE WHEN [MonthStart] = 'Sep  1 2027 12:00AM' THEN SUM(Revenue) END [Sep-27]
						, CASE WHEN [MonthStart] = 'Oct  1 2027 12:00AM' THEN SUM(Revenue) END [Oct-27]
						, CASE WHEN [MonthStart] = 'Nov  1 2027 12:00AM' THEN SUM(Revenue) END [Nov-27]
						, CASE WHEN [MonthStart] = 'Dec  1 2027 12:00AM' THEN SUM(Revenue) END [Dec-27]

			FROM (
					SELECT F.FactProjectSummaryKey
						, F.ProjectKey
						, F.AccountKey
						, F.SegmentKey
						, F.SalesPersonKey
						, F.ClientDirectorPersonKey
						, F.PracticeKey
						, F.SalesStage
						, F.ProjectStatus
						, F.MonthStart
						, F.DollarAmount
						, F.TargetDollarAmount
						, F.FinancialType
						, F.OpportunityKey
						, F.WinProbability
						, F.AccountType
						, F.AssignedOffice
						, F.SalesPerson
						, F.ValidFrom
						, F.ValidTo
						, CDP.FirstName [DimPerson(ClientDirectorPersonKey).FirstName]
						, CDP.LastName [DimPerson(ClientDirectorPersonKey).LastName]
						, PR.ProjectType [DimProject.ProjectType]
						, PR.ProjectNumber [DimProject.ProjectNumber]
						, CASE WHEN PR.ProjectName = '' THEN O.OpportunityName ELSE PR.ProjectName END [DimProject.ProjectName]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN O.DealType ELSE PR.BusinessType END [DimProject.BusinessType]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN O.StartDate ELSE PR.ProjectStartDate END [DimProject.ProjectStartDate]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN O.EndDate ELSE PR.ProjectEndDate END [DimProject.ProjectEndDate]
						, PR.WorkdayObjectID [DimProject.WorkdayObjectID]
						, PR.Commission [DimProject.Commission]
						, PR.DealType [DimProject.DealType]
						, S.SegmentName [DimSegment.SegmentName]
						, A.AccountType [DimAccount.AccountType]
						, A.AccountName [DimAccount.AccountName]
						, PRAC.PracticeName [DimPractice.PracticeName]
						, CASE WHEN F.FinancialType = 'Margin' THEN F.DollarAmount ELSE 0.00 END [Margin]
						, CASE WHEN F.FinancialType = 'Revenue' THEN F.DollarAmount ELSE 0.00 END [Revenue]
						, CASE WHEN PR.ProjectEndDate > '20250701' THEN 'https://wd12.myworkday.com/logic/d/inst/deeplink/' + PR.WorkdayObjectID + '.htmld' ELSE '' END [WorkdayURL]
						, CDP.FirstName + ' ' + CDP.LastName [Project Owner]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN DEIC.FirstName + ' ' + DEIC.LastName WHEN EIC.FirstName = 'Unknown' THEN 'Unknown' ELSE EIC.FirstName + ' ' + EIC.LastName END [EIC]
					FROM dbo.FactProjectSummary " & SystemTimeVar & " F
					--FROM dbo.FactProjectSummary F
					JOIN dbo.DimPerson CDP ON F.ClientDirectorPersonKey = CDP.PersonKey AND F.MonthStart BETWEEN '20250101' AND '20281231'
					JOIN dbo.DimPerson EIC ON F.EICPersonKey = EIC.PersonKey AND F.MonthStart BETWEEN '20250101' AND '20281231'
					JOIN dbo.DimProject PR ON F.ProjectKey = PR.ProjectKey
					JOIN dbo.DimSegment S ON F.SegmentKey = S.SegmentKey --AND S.SegmentName NOT IN ('National Communication & High Tech','Unknown')
					JOIN dbo.DimAccount A ON F.AccountKey = A.AccountKey
					JOIN dbo.DimPractice PRAC ON F.PracticeKey = PRAC.PracticeKey
					JOIN dbo.DimOpportunity O ON F.OpportunityKey = O.OpportunityKey 
					OUTER APPLY (SELECT TOP 1 OPPTY.* FROM dbo.FactOpportunity OPPTY WHERE O.OpportunityKey = OPPTY.OpportunityKey AND OPPTY.ProjectKey = F.ProjectKey ORDER BY OPPTY.ValidFrom DESC) FO
					LEFT JOIN dbo.DimPerson DEIC ON FO.SalesExecutiveInChargePersonKey = DEIC.PersonKey
					WHERE F.ProjectStatus NOT IN ('Inactive', 'Unknown')
						AND F.FinancialType = 'Revenue'
						AND ((F.ProjectStatus = 'CRM Weighted' AND O.YearEndTargetingOnly != 'Yes' AND O.UnknownRevenue != 'Yes') OR F.ProjectStatus != 'cRM weighted')
				) Summary
			GROUP BY FactProjectSummaryKey
						, ProjectKey
						, AccountKey
						, SegmentKey
						, SalesPersonKey
						, ClientDirectorPersonKey
						, PracticeKey
						, SalesStage
						, ProjectStatus
						, FinancialType
						, OpportunityKey
						, WinProbability
						, AccountType
						, AssignedOffice
						, SalesPerson
						, ValidFrom
						, ValidTo
						, [DimPerson(ClientDirectorPersonKey).FirstName]
						, [DimPerson(ClientDirectorPersonKey).LastName]
						, [DimProject.ProjectType]
						, [DimProject.ProjectNumber]
						, [DimProject.ProjectName]
						, [DimProject.BusinessType]
						, [DimProject.ProjectStartDate]
						, [DimProject.ProjectEndDate]
						, [DimProject.WorkdayObjectID]
						, [DimProject.Commission]
						, [DimProject.DealType]
						, [DimSegment.SegmentName]
						, [DimAccount.AccountType]
						, [DimAccount.AccountName]
						, [DimPractice.PracticeName]
						, [WorkdayURL]
						, [Project Owner]
						, [EIC]
						, [MonthStart]
			UNION ALL
			SELECT FactProjectSummaryKey
						, ProjectKey
						, AccountKey
						, SegmentKey
						, SalesPersonKey
						, ClientDirectorPersonKey
						, PracticeKey
						, SalesStage
						, ProjectStatus
						, OpportunityKey
						, WinProbability
						, AccountType
						, AssignedOffice
						, SalesPerson
						, ValidFrom
						, ValidTo
						, [DimPerson(ClientDirectorPersonKey).FirstName]
						, [DimPerson(ClientDirectorPersonKey).LastName]
						, [DimProject.ProjectType]
						, [DimProject.ProjectNumber]
						, [DimProject.ProjectName]
						, [DimProject.BusinessType]
						, [DimProject.ProjectStartDate]
						, [DimProject.ProjectEndDate]
						, [DimProject.WorkdayObjectID]
						, [DimProject.Commission]
						, [DimProject.DealType]
						, [DimSegment.SegmentName]
						, [DimAccount.AccountType]
						, [DimAccount.AccountName]
						, [DimPractice.PracticeName]
						, [WorkdayURL]
						, [Project Owner]
						, [EIC] 
						, FinancialType
						, CASE WHEN [MonthStart] = 'Jan  1 2026 12:00AM' THEN SUM(Margin) END [Jan-26]
						, CASE WHEN [MonthStart] = 'Feb  1 2026 12:00AM' THEN SUM(Margin) END [Feb-26]
						, CASE WHEN [MonthStart] = 'Mar  1 2026 12:00AM' THEN SUM(Margin) END [Mar-26]
						, CASE WHEN [MonthStart] = 'Apr  1 2026 12:00AM' THEN SUM(Margin) END [Apr-26]
						, CASE WHEN [MonthStart] = 'May  1 2026 12:00AM' THEN SUM(Margin) END [May-26]
						, CASE WHEN [MonthStart] = 'Jun  1 2026 12:00AM' THEN SUM(Margin) END [Jun-26]
						, CASE WHEN [MonthStart] = 'Jul  1 2026 12:00AM' THEN SUM(Margin) END [Jul-26]
						, CASE WHEN [MonthStart] = 'Aug  1 2026 12:00AM' THEN SUM(Margin) END [Aug-26]
						, CASE WHEN [MonthStart] = 'Sep  1 2026 12:00AM' THEN SUM(Margin) END [Sep-26]
						, CASE WHEN [MonthStart] = 'Oct  1 2026 12:00AM' THEN SUM(Margin) END [Oct-26]
						, CASE WHEN [MonthStart] = 'Nov  1 2026 12:00AM' THEN SUM(Margin) END [Nov-26]
						, CASE WHEN [MonthStart] = 'Dec  1 2026 12:00AM' THEN SUM(Margin) END [Dec-26]
						, CASE WHEN [MonthStart] = 'Jan  1 2027 12:00AM' THEN SUM(Margin) END [Jan-27]
						, CASE WHEN [MonthStart] = 'Feb  1 2027 12:00AM' THEN SUM(Margin) END [Feb-27]
						, CASE WHEN [MonthStart] = 'Mar  1 2027 12:00AM' THEN SUM(Margin) END [Mar-27]
						, CASE WHEN [MonthStart] = 'Apr  1 2027 12:00AM' THEN SUM(Margin) END [Apr-27]
						, CASE WHEN [MonthStart] = 'May  1 2027 12:00AM' THEN SUM(Margin) END [May-27]
						, CASE WHEN [MonthStart] = 'Jun  1 2027 12:00AM' THEN SUM(Margin) END [Jun-27]
						, CASE WHEN [MonthStart] = 'Jul  1 2027 12:00AM' THEN SUM(Margin) END [Jul-27]
						, CASE WHEN [MonthStart] = 'Aug  1 2027 12:00AM' THEN SUM(Margin) END [Aug-27]
						, CASE WHEN [MonthStart] = 'Sep  1 2027 12:00AM' THEN SUM(Margin) END [Sep-27]
						, CASE WHEN [MonthStart] = 'Oct  1 2027 12:00AM' THEN SUM(Margin) END [Oct-27]
						, CASE WHEN [MonthStart] = 'Nov  1 2027 12:00AM' THEN SUM(Margin) END [Nov-27]
						, CASE WHEN [MonthStart] = 'Dec  1 2027 12:00AM' THEN SUM(Margin) END [Dec-27]
			FROM (
					SELECT F.FactProjectSummaryKey
						, F.ProjectKey
						, F.AccountKey
						, F.SegmentKey
						, F.SalesPersonKey
						, F.ClientDirectorPersonKey
						, F.PracticeKey
						, F.SalesStage
						, F.ProjectStatus
						, F.MonthStart
						, F.DollarAmount
						, F.TargetDollarAmount
						, F.FinancialType
						, F.OpportunityKey
						, F.WinProbability
						, F.AccountType
						, F.AssignedOffice
						, F.SalesPerson
						, F.ValidFrom
						, F.ValidTo
						, CDP.FirstName [DimPerson(ClientDirectorPersonKey).FirstName]
						, CDP.LastName [DimPerson(ClientDirectorPersonKey).LastName]
						, PR.ProjectType [DimProject.ProjectType]
						, PR.ProjectNumber [DimProject.ProjectNumber]
						, CASE WHEN PR.ProjectName = '' THEN O.OpportunityName ELSE PR.ProjectName END [DimProject.ProjectName]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN O.DealType ELSE PR.BusinessType END [DimProject.BusinessType]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN O.StartDate ELSE PR.ProjectStartDate END [DimProject.ProjectStartDate]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN O.EndDate ELSE PR.ProjectEndDate END [DimProject.ProjectEndDate]
						, PR.WorkdayObjectID [DimProject.WorkdayObjectID]
						, PR.Commission [DimProject.Commission]
						, PR.DealType [DimProject.DealType]
						, S.SegmentName [DimSegment.SegmentName]
						, A.AccountType [DimAccount.AccountType]
						, A.AccountName [DimAccount.AccountName]
						, PRAC.PracticeName [DimPractice.PracticeName]
						, CASE WHEN F.FinancialType = 'Margin' THEN F.DollarAmount ELSE 0.00 END [Margin]
						, CASE WHEN F.FinancialType = 'Revenue' THEN F.DollarAmount ELSE 0.00 END [Revenue]
						, CASE WHEN PR.ProjectEndDate > '20240701' THEN 'https://wd12.myworkday.com/logic/d/inst/deeplink/' + PR.WorkdayObjectID + '.htmld' ELSE '' END [WorkdayURL]
						, CDP.FirstName + ' ' + CDP.LastName [Project Owner]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN DEIC.FirstName + ' ' + DEIC.LastName WHEN EIC.FirstName = 'Unknown' THEN 'Unknown' ELSE EIC.FirstName + ' ' + EIC.LastName END [EIC]
					FROM dbo.FactProjectSummary " & SystemTimeVar & " F
					--FROM dbo.FactProjectSummary F
					JOIN dbo.DimPerson CDP ON F.ClientDirectorPersonKey = CDP.PersonKey AND F.MonthStart BETWEEN '20250101' AND '20281231'
					JOIN dbo.DimPerson EIC ON F.EICPersonKey = EIC.PersonKey AND F.MonthStart BETWEEN '20250101' AND '20281231'
					JOIN dbo.DimProject PR ON F.ProjectKey = PR.ProjectKey
					JOIN dbo.DimSegment S ON F.SegmentKey = S.SegmentKey --AND S.SegmentName NOT IN ('National Communication & High Tech','Unknown')
					JOIN dbo.DimAccount A ON F.AccountKey = A.AccountKey
					JOIN dbo.DimPractice PRAC ON F.PracticeKey = PRAC.PracticeKey
					JOIN dbo.DimOpportunity O ON F.OpportunityKey = O.OpportunityKey 
					OUTER APPLY (SELECT TOP 1 OPPTY.* FROM dbo.FactOpportunity OPPTY WHERE O.OpportunityKey = OPPTY.OpportunityKey AND OPPTY.ProjectKey = F.ProjectKey ORDER BY OPPTY.ValidFrom DESC) FO
					LEFT JOIN dbo.DimPerson DEIC ON FO.SalesExecutiveInChargePersonKey = DEIC.PersonKey
					WHERE F.ProjectStatus NOT IN ('Inactive', 'Unknown')
						AND F.FinancialType = 'Margin'
						AND ((F.ProjectStatus = 'CRM Weighted' AND O.YearEndTargetingOnly != 'Yes' AND O.UnknownRevenue != 'Yes') OR F.ProjectStatus != 'cRM weighted')
				) Summary
			GROUP BY FactProjectSummaryKey
						, ProjectKey
						, AccountKey
						, SegmentKey
						, SalesPersonKey
						, ClientDirectorPersonKey
						, PracticeKey
						, SalesStage
						, ProjectStatus
						, FinancialType
						, OpportunityKey
						, WinProbability
						, AccountType
						, AssignedOffice
						, SalesPerson
						, ValidFrom
						, ValidTo
						, [DimPerson(ClientDirectorPersonKey).FirstName]
						, [DimPerson(ClientDirectorPersonKey).LastName]
						, [DimProject.ProjectType]
						, [DimProject.ProjectNumber]
						, [DimProject.ProjectName]
						, [DimProject.BusinessType]
						, [DimProject.ProjectStartDate]
						, [DimProject.ProjectEndDate]
						, [DimProject.WorkdayObjectID]
						, [DimProject.Commission]
						, [DimProject.DealType]
						, [DimSegment.SegmentName]
						, [DimAccount.AccountType]
						, [DimAccount.AccountName]
						, [DimPractice.PracticeName]
						, [WorkdayURL]
						, [Project Owner]
						, [EIC]
						, [MonthStart]
			) Result
		WHERE [Jan-26] IS NOT NULL OR
				[Feb-26] IS NOT NULL OR
				[Mar-26] IS NOT NULL OR
				[Apr-26] IS NOT NULL OR
				[May-26] IS NOT NULL OR
				[Jun-26] IS NOT NULL OR
				[Jul-26] IS NOT NULL OR
				[Aug-26] IS NOT NULL OR
				[Sep-26] IS NOT NULL OR
				[Oct-26] IS NOT NULL OR
				[Nov-26] IS NOT NULL OR
				[Dec-26] IS NOT NULL OR
				[Jan-27] IS NOT NULL OR
				[Feb-27] IS NOT NULL OR
				[Mar-27] IS NOT NULL OR
				[Apr-27] IS NOT NULL OR
				[May-27] IS NOT NULL OR
				[Jun-27] IS NOT NULL OR
				[Jul-27] IS NOT NULL OR
				[Aug-27] IS NOT NULL OR
				[Sep-27] IS NOT NULL OR
				[Oct-27] IS NOT NULL OR
				[Nov-27] IS NOT NULL OR
				[Dec-27] IS NOT NULL 
		GROUP BY
			ProjectKey
			, AccountKey
			, SegmentKey
			, SalesPersonKey
			, ClientDirectorPersonKey
			, PracticeKey
			, SalesStage
			, ProjectStatus
			, FinancialType
			, OpportunityKey
			, WinProbability
			, AccountType
			, AssignedOffice
			, SalesPerson
			, [DimPerson(ClientDirectorPersonKey).FirstName]
			, [DimPerson(ClientDirectorPersonKey).LastName]
			, [DimProject.ProjectType]
			, [DimProject.ProjectNumber]
			, [DimProject.ProjectName]
			, [DimProject.BusinessType]
			, [DimProject.ProjectStartDate]
			, [DimProject.ProjectEndDate]
			, [DimProject.WorkdayObjectID]
			, [DimProject.Commission]
			, [DimProject.DealType]
			, [DimSegment.SegmentName]
			, [DimAccount.AccountType]
			, [DimAccount.AccountName]
			, [DimPractice.PracticeName]
			, [WorkdayURL]
			, [Project Owner]
			, [EIC]

	UNION ALL


		SELECT " & TodayVar2 & " [AsOfDate]
		--SELECT GETDATE() [AsOfDate]
			, ProjectKey
			, AccountKey
			, SegmentKey
			, SalesPersonKey
			, ClientDirectorPersonKey
			, PracticeKey
			, SalesStage
			, ProjectStatus
			, OpportunityKey
			, WinProbability
			, AccountType
			, AssignedOffice
			, SalesPerson
			, [DimPerson(ClientDirectorPersonKey).FirstName]
			, [DimPerson(ClientDirectorPersonKey).LastName]
			, [DimProject.ProjectType]
			, [DimProject.ProjectNumber]
			, [DimProject.ProjectName]
			, [DimProject.BusinessType]
			, [DimProject.ProjectStartDate]
			, [DimProject.ProjectEndDate]
			, [DimProject.WorkdayObjectID]
			, [DimProject.Commission]
			, [DimProject.DealType]
			, [DimSegment.SegmentName]
			, [DimAccount.AccountType]
			, [DimAccount.AccountName]
			, [DimPractice.PracticeName]
			, [WorkdayURL]
			, [Project Owner]
			, [EIC]
			, FinancialType
			, SUM([Jan-26]) [Jan-26]
			, SUM([Feb-26]) [Feb-26]
			, SUM([Mar-26]) [Mar-26]
			, SUM([Apr-26]) [Apr-26]
			, SUM([May-26]) [May-26]
			, SUM([Jun-26]) [Jun-26]
			, SUM([Jul-26]) [Jul-26]
			, SUM([Aug-26]) [Aug-26]
			, SUM([Sep-26]) [Sep-26]
			, SUM([Oct-26]) [Oct-26]
			, SUM([Nov-26]) [Nov-26]
			, SUM([Dec-26]) [Dec-26]
			, SUM([Jan-27]) [Jan-27]
			, SUM([Feb-27]) [Feb-27]
			, SUM([Mar-27]) [Mar-27]
			, SUM([Apr-27]) [Apr-27]
			, SUM([May-27]) [May-27]
			, SUM([Jun-27]) [Jun-27]
			, SUM([Jul-27]) [Jul-27]
			, SUM([Aug-27]) [Aug-27]
			, SUM([Sep-27]) [Sep-27]
			, SUM([Oct-27]) [Oct-27]
			, SUM([Nov-27]) [Nov-27]
			, SUM([Dec-27]) [Dec-27]
		FROM
			(SELECT FactProjectSummaryKey
						, ProjectKey
						, AccountKey
						, SegmentKey
						, SalesPersonKey
						, ClientDirectorPersonKey
						, PracticeKey
						, SalesStage
						, ProjectStatus
						, OpportunityKey
						, WinProbability
						, AccountType
						, AssignedOffice
						, SalesPerson
						, ValidFrom
						, ValidTo
						, [DimPerson(ClientDirectorPersonKey).FirstName]
						, [DimPerson(ClientDirectorPersonKey).LastName]
						, [DimProject.ProjectType]
						, [DimProject.ProjectNumber]
						, [DimProject.ProjectName]
						, [DimProject.BusinessType]
						, [DimProject.ProjectStartDate]
						, [DimProject.ProjectEndDate]
						, [DimProject.WorkdayObjectID]
						, [DimProject.Commission]
						, [DimProject.DealType]
						, [DimSegment.SegmentName]
						, [DimAccount.AccountType]
						, [DimAccount.AccountName]
						, [DimPractice.PracticeName]
						, [WorkdayURL]
						, [Project Owner]
						, [EIC] 
						, FinancialType
						, CASE WHEN [MonthStart] = 'Jan  1 2026 12:00AM' THEN SUM(Revenue) END [Jan-26]
						, CASE WHEN [MonthStart] = 'Feb  1 2026 12:00AM' THEN SUM(Revenue) END [Feb-26]
						, CASE WHEN [MonthStart] = 'Mar  1 2026 12:00AM' THEN SUM(Revenue) END [Mar-26]
						, CASE WHEN [MonthStart] = 'Apr  1 2026 12:00AM' THEN SUM(Revenue) END [Apr-26]
						, CASE WHEN [MonthStart] = 'May  1 2026 12:00AM' THEN SUM(Revenue) END [May-26]
						, CASE WHEN [MonthStart] = 'Jun  1 2026 12:00AM' THEN SUM(Revenue) END [Jun-26]
						, CASE WHEN [MonthStart] = 'Jul  1 2026 12:00AM' THEN SUM(Revenue) END [Jul-26]
						, CASE WHEN [MonthStart] = 'Aug  1 2026 12:00AM' THEN SUM(Revenue) END [Aug-26]
						, CASE WHEN [MonthStart] = 'Sep  1 2026 12:00AM' THEN SUM(Revenue) END [Sep-26]
						, CASE WHEN [MonthStart] = 'Oct  1 2026 12:00AM' THEN SUM(Revenue) END [Oct-26]
						, CASE WHEN [MonthStart] = 'Nov  1 2026 12:00AM' THEN SUM(Revenue) END [Nov-26]
						, CASE WHEN [MonthStart] = 'Dec  1 2026 12:00AM' THEN SUM(Revenue) END [Dec-26]
						, CASE WHEN [MonthStart] = 'Jan  1 2027 12:00AM' THEN SUM(Revenue) END [Jan-27]
						, CASE WHEN [MonthStart] = 'Feb  1 2027 12:00AM' THEN SUM(Revenue) END [Feb-27]
						, CASE WHEN [MonthStart] = 'Mar  1 2027 12:00AM' THEN SUM(Revenue) END [Mar-27]
						, CASE WHEN [MonthStart] = 'Apr  1 2027 12:00AM' THEN SUM(Revenue) END [Apr-27]
						, CASE WHEN [MonthStart] = 'May  1 2027 12:00AM' THEN SUM(Revenue) END [May-27]
						, CASE WHEN [MonthStart] = 'Jun  1 2027 12:00AM' THEN SUM(Revenue) END [Jun-27]
						, CASE WHEN [MonthStart] = 'Jul  1 2027 12:00AM' THEN SUM(Revenue) END [Jul-27]
						, CASE WHEN [MonthStart] = 'Aug  1 2027 12:00AM' THEN SUM(Revenue) END [Aug-27]
						, CASE WHEN [MonthStart] = 'Sep  1 2027 12:00AM' THEN SUM(Revenue) END [Sep-27]
						, CASE WHEN [MonthStart] = 'Oct  1 2027 12:00AM' THEN SUM(Revenue) END [Oct-27]
						, CASE WHEN [MonthStart] = 'Nov  1 2027 12:00AM' THEN SUM(Revenue) END [Nov-27]
						, CASE WHEN [MonthStart] = 'Dec  1 2027 12:00AM' THEN SUM(Revenue) END [Dec-27]
			FROM (
					SELECT F.FactProjectSummaryKey
						, F.ProjectKey
						, F.AccountKey
						, F.SegmentKey
						, F.SalesPersonKey
						, F.ClientDirectorPersonKey
						, F.PracticeKey
						, F.SalesStage
						, F.ProjectStatus
						, F.MonthStart
						, F.DollarAmount
						, F.TargetDollarAmount
						, F.FinancialType
						, F.OpportunityKey
						, F.WinProbability
						, F.AccountType
						, F.AssignedOffice
						, F.SalesPerson
						, F.ValidFrom
						, F.ValidTo
						, CDP.FirstName [DimPerson(ClientDirectorPersonKey).FirstName]
						, CDP.LastName [DimPerson(ClientDirectorPersonKey).LastName]
						, PR.ProjectType [DimProject.ProjectType]
						, PR.ProjectNumber [DimProject.ProjectNumber]
						, CASE WHEN PR.ProjectName = '' THEN O.OpportunityName ELSE PR.ProjectName END [DimProject.ProjectName]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN O.DealType ELSE PR.BusinessType END [DimProject.BusinessType]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN O.StartDate ELSE PR.ProjectStartDate END [DimProject.ProjectStartDate]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN O.EndDate ELSE PR.ProjectEndDate END [DimProject.ProjectEndDate]
						, PR.WorkdayObjectID [DimProject.WorkdayObjectID]
						, PR.Commission [DimProject.Commission]
						, PR.DealType [DimProject.DealType]
						, S.SegmentName [DimSegment.SegmentName]
						, A.AccountType [DimAccount.AccountType]
						, A.AccountName [DimAccount.AccountName]
						, PRAC.PracticeName [DimPractice.PracticeName]
						, CASE WHEN F.FinancialType = 'Margin' THEN F.DollarAmount ELSE 0.00 END [Margin]
						, CASE WHEN F.FinancialType = 'Revenue' THEN F.DollarAmount ELSE 0.00 END [Revenue]
						, CASE WHEN PR.ProjectEndDate > '20240701' THEN 'https://wd12.myworkday.com/logic/d/inst/deeplink/' + PR.WorkdayObjectID + '.htmld' ELSE '' END [WorkdayURL]
						, CDP.FirstName + ' ' + CDP.LastName [Project Owner]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN DEIC.FirstName + ' ' + DEIC.LastName WHEN EIC.FirstName = 'Unknown' THEN 'Unknown' ELSE EIC.FirstName + ' ' + EIC.LastName END [EIC]
					FROM dbo.FactProjectSummary " & SystemTimeVar2 & " F
					--FROM dbo.FactProjectSummary F
					JOIN dbo.DimPerson CDP ON F.ClientDirectorPersonKey = CDP.PersonKey AND F.MonthStart BETWEEN '20250101' AND '20281231'
					JOIN dbo.DimPerson EIC ON F.EICPersonKey = EIC.PersonKey AND F.MonthStart BETWEEN '20250101' AND '20281231'
					JOIN dbo.DimProject PR ON F.ProjectKey = PR.ProjectKey
					JOIN dbo.DimSegment S ON F.SegmentKey = S.SegmentKey --AND S.SegmentName NOT IN ('National Communication & High Tech','Unknown') 
					JOIN dbo.DimAccount A ON F.AccountKey = A.AccountKey
					JOIN dbo.DimPractice PRAC ON F.PracticeKey = PRAC.PracticeKey
					JOIN dbo.DimOpportunity O ON F.OpportunityKey = O.OpportunityKey 
					OUTER APPLY (SELECT TOP 1 OPPTY.* FROM dbo.FactOpportunity OPPTY WHERE O.OpportunityKey = OPPTY.OpportunityKey AND OPPTY.ProjectKey = F.ProjectKey ORDER BY OPPTY.ValidFrom DESC) FO
					LEFT JOIN dbo.DimPerson DEIC ON FO.SalesExecutiveInChargePersonKey = DEIC.PersonKey
					WHERE F.ProjectStatus NOT IN ('Inactive', 'Unknown')
						AND F.FinancialType = 'Revenue'
						AND ((F.ProjectStatus = 'CRM Weighted' AND O.YearEndTargetingOnly != 'Yes' AND O.UnknownRevenue != 'Yes') OR F.ProjectStatus != 'cRM weighted')
				) Summary
			GROUP BY FactProjectSummaryKey
						, ProjectKey
						, AccountKey
						, SegmentKey
						, SalesPersonKey
						, ClientDirectorPersonKey
						, PracticeKey
						, SalesStage
						, ProjectStatus
						, FinancialType
						, OpportunityKey
						, WinProbability
						, AccountType
						, AssignedOffice
						, SalesPerson
						, ValidFrom
						, ValidTo
						, [DimPerson(ClientDirectorPersonKey).FirstName]
						, [DimPerson(ClientDirectorPersonKey).LastName]
						, [DimProject.ProjectType]
						, [DimProject.ProjectNumber]
						, [DimProject.ProjectName]
						, [DimProject.BusinessType]
						, [DimProject.ProjectStartDate]
						, [DimProject.ProjectEndDate]
						, [DimProject.WorkdayObjectID]
						, [DimProject.Commission]
						, [DimProject.DealType]
						, [DimSegment.SegmentName]
						, [DimAccount.AccountType]
						, [DimAccount.AccountName]
						, [DimPractice.PracticeName]
						, [WorkdayURL]
						, [Project Owner]
						, [EIC]
						, [MonthStart]
	UNION ALL
			SELECT FactProjectSummaryKey
						, ProjectKey
						, AccountKey
						, SegmentKey
						, SalesPersonKey
						, ClientDirectorPersonKey
						, PracticeKey
						, SalesStage
						, ProjectStatus
						, OpportunityKey
						, WinProbability
						, AccountType
						, AssignedOffice
						, SalesPerson
						, ValidFrom
						, ValidTo
						, [DimPerson(ClientDirectorPersonKey).FirstName]
						, [DimPerson(ClientDirectorPersonKey).LastName]
						, [DimProject.ProjectType]
						, [DimProject.ProjectNumber]
						, [DimProject.ProjectName]
						, [DimProject.BusinessType]
						, [DimProject.ProjectStartDate]
						, [DimProject.ProjectEndDate]
						, [DimProject.WorkdayObjectID]
						, [DimProject.Commission]
						, [DimProject.DealType]
						, [DimSegment.SegmentName]
						, [DimAccount.AccountType]
						, [DimAccount.AccountName]
						, [DimPractice.PracticeName]
						, [WorkdayURL]
						, [Project Owner]
						, [EIC] 
						, FinancialType
						, CASE WHEN [MonthStart] = 'Jan  1 2026 12:00AM' THEN SUM(Margin) END [Jan-26]
						, CASE WHEN [MonthStart] = 'Feb  1 2026 12:00AM' THEN SUM(Margin) END [Feb-26]
						, CASE WHEN [MonthStart] = 'Mar  1 2026 12:00AM' THEN SUM(Margin) END [Mar-26]
						, CASE WHEN [MonthStart] = 'Apr  1 2026 12:00AM' THEN SUM(Margin) END [Apr-26]
						, CASE WHEN [MonthStart] = 'May  1 2026 12:00AM' THEN SUM(Margin) END [May-26]
						, CASE WHEN [MonthStart] = 'Jun  1 2026 12:00AM' THEN SUM(Margin) END [Jun-26]
						, CASE WHEN [MonthStart] = 'Jul  1 2026 12:00AM' THEN SUM(Margin) END [Jul-26]
						, CASE WHEN [MonthStart] = 'Aug  1 2026 12:00AM' THEN SUM(Margin) END [Aug-26]
						, CASE WHEN [MonthStart] = 'Sep  1 2026 12:00AM' THEN SUM(Margin) END [Sep-26]
						, CASE WHEN [MonthStart] = 'Oct  1 2026 12:00AM' THEN SUM(Margin) END [Oct-26]
						, CASE WHEN [MonthStart] = 'Nov  1 2026 12:00AM' THEN SUM(Margin) END [Nov-26]
						, CASE WHEN [MonthStart] = 'Dec  1 2026 12:00AM' THEN SUM(Margin) END [Dec-26]
						, CASE WHEN [MonthStart] = 'Jan  1 2027 12:00AM' THEN SUM(Margin) END [Jan-27]
						, CASE WHEN [MonthStart] = 'Feb  1 2027 12:00AM' THEN SUM(Margin) END [Feb-27]
						, CASE WHEN [MonthStart] = 'Mar  1 2027 12:00AM' THEN SUM(Margin) END [Mar-27]
						, CASE WHEN [MonthStart] = 'Apr  1 2027 12:00AM' THEN SUM(Margin) END [Apr-27]
						, CASE WHEN [MonthStart] = 'May  1 2027 12:00AM' THEN SUM(Margin) END [May-27]
						, CASE WHEN [MonthStart] = 'Jun  1 2027 12:00AM' THEN SUM(Margin) END [Jun-27]
						, CASE WHEN [MonthStart] = 'Jul  1 2027 12:00AM' THEN SUM(Margin) END [Jul-27]
						, CASE WHEN [MonthStart] = 'Aug  1 2027 12:00AM' THEN SUM(Margin) END [Aug-27]
						, CASE WHEN [MonthStart] = 'Sep  1 2027 12:00AM' THEN SUM(Margin) END [Sep-27]
						, CASE WHEN [MonthStart] = 'Oct  1 2027 12:00AM' THEN SUM(Margin) END [Oct-27]
						, CASE WHEN [MonthStart] = 'Nov  1 2027 12:00AM' THEN SUM(Margin) END [Nov-27]
						, CASE WHEN [MonthStart] = 'Dec  1 2027 12:00AM' THEN SUM(Margin) END [Dec-27]
			FROM (
					SELECT F.FactProjectSummaryKey
						, F.ProjectKey
						, F.AccountKey
						, F.SegmentKey
						, F.SalesPersonKey
						, F.ClientDirectorPersonKey
						, F.PracticeKey
						, F.SalesStage
						, F.ProjectStatus
						, F.MonthStart
						, F.DollarAmount
						, F.TargetDollarAmount
						, F.FinancialType
						, F.OpportunityKey
						, F.WinProbability
						, F.AccountType
						, F.AssignedOffice
						, F.SalesPerson
						, F.ValidFrom
						, F.ValidTo
						, CDP.FirstName [DimPerson(ClientDirectorPersonKey).FirstName]
						, CDP.LastName [DimPerson(ClientDirectorPersonKey).LastName]
						, PR.ProjectType [DimProject.ProjectType]
						, PR.ProjectNumber [DimProject.ProjectNumber]
						, CASE WHEN PR.ProjectName = '' THEN O.OpportunityName ELSE PR.ProjectName END [DimProject.ProjectName]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN O.DealType ELSE PR.BusinessType END [DimProject.BusinessType]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN O.StartDate ELSE PR.ProjectStartDate END [DimProject.ProjectStartDate]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN O.EndDate ELSE PR.ProjectEndDate END [DimProject.ProjectEndDate]
						, PR.WorkdayObjectID [DimProject.WorkdayObjectID]
						, PR.Commission [DimProject.Commission]
						, PR.DealType [DimProject.DealType]
						, S.SegmentName [DimSegment.SegmentName]
						, A.AccountType [DimAccount.AccountType]
						, A.AccountName [DimAccount.AccountName]
						, PRAC.PracticeName [DimPractice.PracticeName]
						, CASE WHEN F.FinancialType = 'Margin' THEN F.DollarAmount ELSE 0.00 END [Margin]
						, CASE WHEN F.FinancialType = 'Revenue' THEN F.DollarAmount ELSE 0.00 END [Revenue]
						, CASE WHEN PR.ProjectEndDate > '20240701' THEN 'https://wd12.myworkday.com/logic/d/inst/deeplink/' + PR.WorkdayObjectID + '.htmld' ELSE '' END [WorkdayURL]
						, CDP.FirstName + ' ' + CDP.LastName [Project Owner]
						, CASE WHEN EIC.FirstName = 'Unknown' THEN 'Unknown' ELSE EIC.FirstName + ' ' + EIC.LastName END [EIC]
					FROM dbo.FactProjectSummary " & SystemTimeVar2 & " F
					--FROM dbo.FactProjectSummary F
					JOIN dbo.DimPerson CDP ON F.ClientDirectorPersonKey = CDP.PersonKey AND F.MonthStart BETWEEN '20250101' AND '20281231'
					JOIN dbo.DimPerson EIC ON F.EICPersonKey = EIC.PersonKey AND F.MonthStart BETWEEN '20250101' AND '20281231'
					JOIN dbo.DimProject PR ON F.ProjectKey = PR.ProjectKey
					JOIN dbo.DimSegment S ON F.SegmentKey = S.SegmentKey --AND S.SegmentName NOT IN ('National Communication & High Tech','Unknown')
					JOIN dbo.DimAccount A ON F.AccountKey = A.AccountKey
					JOIN dbo.DimPractice PRAC ON F.PracticeKey = PRAC.PracticeKey
					JOIN dbo.DimOpportunity O ON F.OpportunityKey = O.OpportunityKey 
					OUTER APPLY (SELECT TOP 1 OPPTY.* FROM dbo.FactOpportunity OPPTY WHERE O.OpportunityKey = OPPTY.OpportunityKey AND OPPTY.ProjectKey = F.ProjectKey ORDER BY OPPTY.ValidFrom DESC) FO
					LEFT JOIN dbo.DimPerson DEIC ON FO.SalesExecutiveInChargePersonKey = DEIC.PersonKey
					WHERE F.ProjectStatus NOT IN ('Inactive', 'Unknown')
						AND F.FinancialType = 'Margin'
						AND ((F.ProjectStatus = 'CRM Weighted' AND O.YearEndTargetingOnly != 'Yes' AND O.UnknownRevenue != 'Yes') OR F.ProjectStatus != 'cRM weighted')
				) Summary
			GROUP BY FactProjectSummaryKey
						, ProjectKey
						, AccountKey
						, SegmentKey
						, SalesPersonKey
						, ClientDirectorPersonKey
						, PracticeKey
						, SalesStage
						, ProjectStatus
						, FinancialType
						, OpportunityKey
						, WinProbability
						, AccountType
						, AssignedOffice
						, SalesPerson
						, ValidFrom
						, ValidTo
						, [DimPerson(ClientDirectorPersonKey).FirstName]
						, [DimPerson(ClientDirectorPersonKey).LastName]
						, [DimProject.ProjectType]
						, [DimProject.ProjectNumber]
						, [DimProject.ProjectName]
						, [DimProject.BusinessType]
						, [DimProject.ProjectStartDate]
						, [DimProject.ProjectEndDate]
						, [DimProject.WorkdayObjectID]
						, [DimProject.Commission]
						, [DimProject.DealType]
						, [DimSegment.SegmentName]
						, [DimAccount.AccountType]
						, [DimAccount.AccountName]
						, [DimPractice.PracticeName]
						, [WorkdayURL]
						, [Project Owner]
						, [EIC]
						, [MonthStart]
			) Result
		WHERE [Jan-26] IS NOT NULL OR
				[Feb-26] IS NOT NULL OR
				[Mar-26] IS NOT NULL OR
				[Apr-26] IS NOT NULL OR
				[May-26] IS NOT NULL OR
				[Jun-26] IS NOT NULL OR
				[Jul-26] IS NOT NULL OR
				[Aug-26] IS NOT NULL OR
				[Sep-26] IS NOT NULL OR
				[Oct-26] IS NOT NULL OR
				[Nov-26] IS NOT NULL OR
				[Dec-26] IS NOT NULL OR
				[Jan-27] IS NOT NULL OR
				[Feb-27] IS NOT NULL OR
				[Mar-27] IS NOT NULL OR
				[Apr-27] IS NOT NULL OR
				[May-27] IS NOT NULL OR
				[Jun-27] IS NOT NULL OR
				[Jul-27] IS NOT NULL OR
				[Aug-27] IS NOT NULL OR
				[Sep-27] IS NOT NULL OR
				[Oct-27] IS NOT NULL OR
				[Nov-27] IS NOT NULL OR
				[Dec-27] IS NOT NULL 
		GROUP BY
			ProjectKey
			, AccountKey
			, SegmentKey
			, SalesPersonKey
			, ClientDirectorPersonKey
			, PracticeKey
			, SalesStage
			, ProjectStatus
			, FinancialType
			, OpportunityKey
			, WinProbability
			, AccountType
			, AssignedOffice
			, SalesPerson
			, [DimPerson(ClientDirectorPersonKey).FirstName]
			, [DimPerson(ClientDirectorPersonKey).LastName]
			, [DimProject.ProjectType]
			, [DimProject.ProjectNumber]
			, [DimProject.ProjectName]
			, [DimProject.BusinessType]
			, [DimProject.ProjectStartDate]
			, [DimProject.ProjectEndDate]
			, [DimProject.WorkdayObjectID]
			, [DimProject.Commission]
			, [DimProject.DealType]
			, [DimSegment.SegmentName]
			, [DimAccount.AccountType]
			, [DimAccount.AccountName]
			, [DimPractice.PracticeName]
			, [WorkdayURL]
			, [Project Owner]
			, [EIC]
) D

UNION ALL

SELECT *, CAST(1 AS BIT) [HighConfidence] 
FROM 
(
	SELECT " & TodayVar & " [AsOfDate]
	--SELECT GETDATE() [AsOfDate]
			, ProjectKey
			, AccountKey
			, SegmentKey
			, SalesPersonKey
			, ClientDirectorPersonKey
			, PracticeKey
			, SalesStage
			, ProjectStatus
			, OpportunityKey
			, WinProbability
			, AccountType
			, AssignedOffice
			, SalesPerson
			, [DimPerson(ClientDirectorPersonKey).FirstName]
			, [DimPerson(ClientDirectorPersonKey).LastName]
			, [DimProject.ProjectType]
			, [DimProject.ProjectNumber]
			, [DimProject.ProjectName]
			, [DimProject.BusinessType]
			, [DimProject.ProjectStartDate]
			, [DimProject.ProjectEndDate]
			, [DimProject.WorkdayObjectID]
			, [DimProject.Commission]
			, [DimProject.DealType]
			, [DimSegment.SegmentName]
			, [DimAccount.AccountType]
			, [DimAccount.AccountName]
			, [DimPractice.PracticeName]
			, [WorkdayURL]
			, [Project Owner]
			, [EIC]
			, FinancialType
			, SUM([Jan-26]) [Jan-26]
			, SUM([Feb-26]) [Feb-26]
			, SUM([Mar-26]) [Mar-26]
			, SUM([Apr-26]) [Apr-26]
			, SUM([May-26]) [May-26]
			, SUM([Jun-26]) [Jun-26]
			, SUM([Jul-26]) [Jul-26]
			, SUM([Aug-26]) [Aug-26]
			, SUM([Sep-26]) [Sep-26]
			, SUM([Oct-26]) [Oct-26]
			, SUM([Nov-26]) [Nov-26]
			, SUM([Dec-26]) [Dec-26]
			, SUM([Jan-27]) [Jan-27]
			, SUM([Feb-27]) [Feb-27]
			, SUM([Mar-27]) [Mar-27]
			, SUM([Apr-27]) [Apr-27]
			, SUM([May-27]) [May-27]
			, SUM([Jun-27]) [Jun-27]
			, SUM([Jul-27]) [Jul-27]
			, SUM([Aug-27]) [Aug-27]
			, SUM([Sep-27]) [Sep-27]
			, SUM([Oct-27]) [Oct-27]
			, SUM([Nov-27]) [Nov-27]
			, SUM([Dec-27]) [Dec-27]
		FROM
			(SELECT FactProjectSummaryKey
						, ProjectKey
						, AccountKey
						, SegmentKey
						, SalesPersonKey
						, ClientDirectorPersonKey
						, PracticeKey
						, SalesStage
						, ProjectStatus
						, OpportunityKey
						, WinProbability
						, AccountType
						, AssignedOffice
						, SalesPerson
						, ValidFrom
						, ValidTo
						, [DimPerson(ClientDirectorPersonKey).FirstName]
						, [DimPerson(ClientDirectorPersonKey).LastName]
						, [DimProject.ProjectType]
						, [DimProject.ProjectNumber]
						, [DimProject.ProjectName]
						, [DimProject.BusinessType]
						, [DimProject.ProjectStartDate]
						, [DimProject.ProjectEndDate]
						, [DimProject.WorkdayObjectID]
						, [DimProject.Commission]
						, [DimProject.DealType]
						, [DimSegment.SegmentName]
						, [DimAccount.AccountType]
						, [DimAccount.AccountName]
						, [DimPractice.PracticeName]
						, [WorkdayURL]
						, [Project Owner]
						, [EIC] 
						, FinancialType
						, CASE WHEN [MonthStart] = 'Jan  1 2026 12:00AM' THEN SUM(Revenue) END [Jan-26]
						, CASE WHEN [MonthStart] = 'Feb  1 2026 12:00AM' THEN SUM(Revenue) END [Feb-26]
						, CASE WHEN [MonthStart] = 'Mar  1 2026 12:00AM' THEN SUM(Revenue) END [Mar-26]
						, CASE WHEN [MonthStart] = 'Apr  1 2026 12:00AM' THEN SUM(Revenue) END [Apr-26]
						, CASE WHEN [MonthStart] = 'May  1 2026 12:00AM' THEN SUM(Revenue) END [May-26]
						, CASE WHEN [MonthStart] = 'Jun  1 2026 12:00AM' THEN SUM(Revenue) END [Jun-26]
						, CASE WHEN [MonthStart] = 'Jul  1 2026 12:00AM' THEN SUM(Revenue) END [Jul-26]
						, CASE WHEN [MonthStart] = 'Aug  1 2026 12:00AM' THEN SUM(Revenue) END [Aug-26]
						, CASE WHEN [MonthStart] = 'Sep  1 2026 12:00AM' THEN SUM(Revenue) END [Sep-26]
						, CASE WHEN [MonthStart] = 'Oct  1 2026 12:00AM' THEN SUM(Revenue) END [Oct-26]
						, CASE WHEN [MonthStart] = 'Nov  1 2026 12:00AM' THEN SUM(Revenue) END [Nov-26]
						, CASE WHEN [MonthStart] = 'Dec  1 2026 12:00AM' THEN SUM(Revenue) END [Dec-26]
						, CASE WHEN [MonthStart] = 'Jan  1 2027 12:00AM' THEN SUM(Revenue) END [Jan-27]
						, CASE WHEN [MonthStart] = 'Feb  1 2027 12:00AM' THEN SUM(Revenue) END [Feb-27]
						, CASE WHEN [MonthStart] = 'Mar  1 2027 12:00AM' THEN SUM(Revenue) END [Mar-27]
						, CASE WHEN [MonthStart] = 'Apr  1 2027 12:00AM' THEN SUM(Revenue) END [Apr-27]
						, CASE WHEN [MonthStart] = 'May  1 2027 12:00AM' THEN SUM(Revenue) END [May-27]
						, CASE WHEN [MonthStart] = 'Jun  1 2027 12:00AM' THEN SUM(Revenue) END [Jun-27]
						, CASE WHEN [MonthStart] = 'Jul  1 2027 12:00AM' THEN SUM(Revenue) END [Jul-27]
						, CASE WHEN [MonthStart] = 'Aug  1 2027 12:00AM' THEN SUM(Revenue) END [Aug-27]
						, CASE WHEN [MonthStart] = 'Sep  1 2027 12:00AM' THEN SUM(Revenue) END [Sep-27]
						, CASE WHEN [MonthStart] = 'Oct  1 2027 12:00AM' THEN SUM(Revenue) END [Oct-27]
						, CASE WHEN [MonthStart] = 'Nov  1 2027 12:00AM' THEN SUM(Revenue) END [Nov-27]
						, CASE WHEN [MonthStart] = 'Dec  1 2027 12:00AM' THEN SUM(Revenue) END [Dec-27]

			FROM (
					SELECT F.FactProjectSummaryKey
						, F.ProjectKey
						, F.AccountKey
						, F.SegmentKey
						, F.SalesPersonKey
						, F.ClientDirectorPersonKey
						, F.PracticeKey
						, F.SalesStage
						, F.ProjectStatus
						, F.MonthStart
						, F.DollarAmount
						, F.TargetDollarAmount
						, F.FinancialType
						, F.OpportunityKey
						, F.WinProbability
						, F.AccountType
						, F.AssignedOffice
						, F.SalesPerson
						, F.ValidFrom
						, F.ValidTo
						, CDP.FirstName [DimPerson(ClientDirectorPersonKey).FirstName]
						, CDP.LastName [DimPerson(ClientDirectorPersonKey).LastName]
						, PR.ProjectType [DimProject.ProjectType]
						, PR.ProjectNumber [DimProject.ProjectNumber]
						, CASE WHEN PR.ProjectName = '' THEN O.OpportunityName ELSE PR.ProjectName END [DimProject.ProjectName]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN O.DealType ELSE PR.BusinessType END [DimProject.BusinessType]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN O.StartDate ELSE PR.ProjectStartDate END [DimProject.ProjectStartDate]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN O.EndDate ELSE PR.ProjectEndDate END [DimProject.ProjectEndDate]
						, PR.WorkdayObjectID [DimProject.WorkdayObjectID]
						, PR.Commission [DimProject.Commission]
						, PR.DealType [DimProject.DealType]
						, S.SegmentName [DimSegment.SegmentName]
						, A.AccountType [DimAccount.AccountType]
						, A.AccountName [DimAccount.AccountName]
						, PRAC.PracticeName [DimPractice.PracticeName]
						, CASE WHEN F.FinancialType = 'Margin' THEN F.DollarAmount ELSE 0.00 END [Margin]
						, CASE WHEN F.FinancialType = 'Revenue' THEN F.DollarAmount ELSE 0.00 END [Revenue]
						, CASE WHEN PR.ProjectEndDate > '20240701' THEN 'https://wd12.myworkday.com/logic/d/inst/deeplink/' + PR.WorkdayObjectID + '.htmld' ELSE '' END [WorkdayURL]
						, CDP.FirstName + ' ' + CDP.LastName [Project Owner]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN DEIC.FirstName + ' ' + DEIC.LastName WHEN EIC.FirstName = 'Unknown' THEN 'Unknown' ELSE EIC.FirstName + ' ' + EIC.LastName END [EIC]
					FROM dbo.FactProjectSummary " & SystemTimeVar & " F
					--FROM dbo.FactProjectSummary F
					JOIN dbo.DimPerson CDP ON F.ClientDirectorPersonKey = CDP.PersonKey AND F.MonthStart BETWEEN '20250101' AND '20281231'
					JOIN dbo.DimPerson EIC ON F.EICPersonKey = EIC.PersonKey AND F.MonthStart BETWEEN '20250101' AND '20281231'
					JOIN dbo.DimProject PR ON F.ProjectKey = PR.ProjectKey
					JOIN dbo.DimSegment S ON F.SegmentKey = S.SegmentKey --AND S.SegmentName NOT IN ('National Communication & High Tech','Unknown')
					JOIN dbo.DimAccount A ON F.AccountKey = A.AccountKey
					JOIN dbo.DimPractice PRAC ON F.PracticeKey = PRAC.PracticeKey
					JOIN dbo.DimOpportunity O ON F.OpportunityKey = O.OpportunityKey 
					OUTER APPLY (SELECT TOP 1 OPPTY.* FROM dbo.FactOpportunity OPPTY WHERE O.OpportunityKey = OPPTY.OpportunityKey AND OPPTY.ProjectKey = F.ProjectKey ORDER BY OPPTY.ValidFrom DESC) FO
					LEFT JOIN dbo.DimPerson DEIC ON FO.SalesExecutiveInChargePersonKey = DEIC.PersonKey
					WHERE F.ProjectStatus NOT IN ('Inactive', 'Unknown')
						AND F.FinancialType = 'Revenue'
						AND NOT EXISTS(SELECT 1 FROM dbo.FactAttainmentHighConfidence " & SystemTimeVar & " HC WHERE F.OpportunityKey = HC.OpportunityKey)
						AND ((F.ProjectStatus = 'CRM Weighted' AND O.YearEndTargetingOnly != 'Yes' AND O.UnknownRevenue != 'Yes') OR F.ProjectStatus != 'cRM weighted')
				) Summary
			GROUP BY FactProjectSummaryKey
						, ProjectKey
						, AccountKey
						, SegmentKey
						, SalesPersonKey
						, ClientDirectorPersonKey
						, PracticeKey
						, SalesStage
						, ProjectStatus
						, FinancialType
						, OpportunityKey
						, WinProbability
						, AccountType
						, AssignedOffice
						, SalesPerson
						, ValidFrom
						, ValidTo
						, [DimPerson(ClientDirectorPersonKey).FirstName]
						, [DimPerson(ClientDirectorPersonKey).LastName]
						, [DimProject.ProjectType]
						, [DimProject.ProjectNumber]
						, [DimProject.ProjectName]
						, [DimProject.BusinessType]
						, [DimProject.ProjectStartDate]
						, [DimProject.ProjectEndDate]
						, [DimProject.WorkdayObjectID]
						, [DimProject.Commission]
						, [DimProject.DealType]
						, [DimSegment.SegmentName]
						, [DimAccount.AccountType]
						, [DimAccount.AccountName]
						, [DimPractice.PracticeName]
						, [WorkdayURL]
						, [Project Owner]
						, [EIC]
						, [MonthStart]
			UNION ALL
			SELECT FactProjectSummaryKey
						, ProjectKey
						, AccountKey
						, SegmentKey
						, SalesPersonKey
						, ClientDirectorPersonKey
						, PracticeKey
						, SalesStage
						, ProjectStatus
						, OpportunityKey
						, WinProbability
						, AccountType
						, AssignedOffice
						, SalesPerson
						, ValidFrom
						, ValidTo
						, [DimPerson(ClientDirectorPersonKey).FirstName]
						, [DimPerson(ClientDirectorPersonKey).LastName]
						, [DimProject.ProjectType]
						, [DimProject.ProjectNumber]
						, [DimProject.ProjectName]
						, [DimProject.BusinessType]
						, [DimProject.ProjectStartDate]
						, [DimProject.ProjectEndDate]
						, [DimProject.WorkdayObjectID]
						, [DimProject.Commission]
						, [DimProject.DealType]
						, [DimSegment.SegmentName]
						, [DimAccount.AccountType]
						, [DimAccount.AccountName]
						, [DimPractice.PracticeName]
						, [WorkdayURL]
						, [Project Owner]
						, [EIC] 
						, FinancialType
						, CASE WHEN [MonthStart] = 'Jan  1 2026 12:00AM' THEN SUM(Margin) END [Jan-26]
						, CASE WHEN [MonthStart] = 'Feb  1 2026 12:00AM' THEN SUM(Margin) END [Feb-26]
						, CASE WHEN [MonthStart] = 'Mar  1 2026 12:00AM' THEN SUM(Margin) END [Mar-26]
						, CASE WHEN [MonthStart] = 'Apr  1 2026 12:00AM' THEN SUM(Margin) END [Apr-26]
						, CASE WHEN [MonthStart] = 'May  1 2026 12:00AM' THEN SUM(Margin) END [May-26]
						, CASE WHEN [MonthStart] = 'Jun  1 2026 12:00AM' THEN SUM(Margin) END [Jun-26]
						, CASE WHEN [MonthStart] = 'Jul  1 2026 12:00AM' THEN SUM(Margin) END [Jul-26]
						, CASE WHEN [MonthStart] = 'Aug  1 2026 12:00AM' THEN SUM(Margin) END [Aug-26]
						, CASE WHEN [MonthStart] = 'Sep  1 2026 12:00AM' THEN SUM(Margin) END [Sep-26]
						, CASE WHEN [MonthStart] = 'Oct  1 2026 12:00AM' THEN SUM(Margin) END [Oct-26]
						, CASE WHEN [MonthStart] = 'Nov  1 2026 12:00AM' THEN SUM(Margin) END [Nov-26]
						, CASE WHEN [MonthStart] = 'Dec  1 2026 12:00AM' THEN SUM(Margin) END [Dec-26]
						, CASE WHEN [MonthStart] = 'Jan  1 2027 12:00AM' THEN SUM(Margin) END [Jan-27]
						, CASE WHEN [MonthStart] = 'Feb  1 2027 12:00AM' THEN SUM(Margin) END [Feb-27]
						, CASE WHEN [MonthStart] = 'Mar  1 2027 12:00AM' THEN SUM(Margin) END [Mar-27]
						, CASE WHEN [MonthStart] = 'Apr  1 2027 12:00AM' THEN SUM(Margin) END [Apr-27]
						, CASE WHEN [MonthStart] = 'May  1 2027 12:00AM' THEN SUM(Margin) END [May-27]
						, CASE WHEN [MonthStart] = 'Jun  1 2027 12:00AM' THEN SUM(Margin) END [Jun-27]
						, CASE WHEN [MonthStart] = 'Jul  1 2027 12:00AM' THEN SUM(Margin) END [Jul-27]
						, CASE WHEN [MonthStart] = 'Aug  1 2027 12:00AM' THEN SUM(Margin) END [Aug-27]
						, CASE WHEN [MonthStart] = 'Sep  1 2027 12:00AM' THEN SUM(Margin) END [Sep-27]
						, CASE WHEN [MonthStart] = 'Oct  1 2027 12:00AM' THEN SUM(Margin) END [Oct-27]
						, CASE WHEN [MonthStart] = 'Nov  1 2027 12:00AM' THEN SUM(Margin) END [Nov-27]
						, CASE WHEN [MonthStart] = 'Dec  1 2027 12:00AM' THEN SUM(Margin) END [Dec-27]
			FROM (
					SELECT F.FactProjectSummaryKey
						, F.ProjectKey
						, F.AccountKey
						, F.SegmentKey
						, F.SalesPersonKey
						, F.ClientDirectorPersonKey
						, F.PracticeKey
						, F.SalesStage
						, F.ProjectStatus
						, F.MonthStart
						, F.DollarAmount
						, F.TargetDollarAmount
						, F.FinancialType
						, F.OpportunityKey
						, F.WinProbability
						, F.AccountType
						, F.AssignedOffice
						, F.SalesPerson
						, F.ValidFrom
						, F.ValidTo
						, CDP.FirstName [DimPerson(ClientDirectorPersonKey).FirstName]
						, CDP.LastName [DimPerson(ClientDirectorPersonKey).LastName]
						, PR.ProjectType [DimProject.ProjectType]
						, PR.ProjectNumber [DimProject.ProjectNumber]
						, CASE WHEN PR.ProjectName = '' THEN O.OpportunityName ELSE PR.ProjectName END [DimProject.ProjectName]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN O.DealType ELSE PR.BusinessType END [DimProject.BusinessType]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN O.StartDate ELSE PR.ProjectStartDate END [DimProject.ProjectStartDate]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN O.EndDate ELSE PR.ProjectEndDate END [DimProject.ProjectEndDate]
						, PR.WorkdayObjectID [DimProject.WorkdayObjectID]
						, PR.Commission [DimProject.Commission]
						, PR.DealType [DimProject.DealType]
						, S.SegmentName [DimSegment.SegmentName]
						, A.AccountType [DimAccount.AccountType]
						, A.AccountName [DimAccount.AccountName]
						, PRAC.PracticeName [DimPractice.PracticeName]
						, CASE WHEN F.FinancialType = 'Margin' THEN F.DollarAmount ELSE 0.00 END [Margin]
						, CASE WHEN F.FinancialType = 'Revenue' THEN F.DollarAmount ELSE 0.00 END [Revenue]
						, CASE WHEN PR.ProjectEndDate > '20240701' THEN 'https://wd12.myworkday.com/logic/d/inst/deeplink/' + PR.WorkdayObjectID + '.htmld' ELSE '' END [WorkdayURL]
						, CDP.FirstName + ' ' + CDP.LastName [Project Owner]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN DEIC.FirstName + ' ' + DEIC.LastName WHEN EIC.FirstName = 'Unknown' THEN 'Unknown' ELSE EIC.FirstName + ' ' + EIC.LastName END [EIC]
					FROM dbo.FactProjectSummary " & SystemTimeVar & " F
					--FROM dbo.FactProjectSummary F
					JOIN dbo.DimPerson CDP ON F.ClientDirectorPersonKey = CDP.PersonKey AND F.MonthStart BETWEEN '20250101' AND '20281231'
					JOIN dbo.DimPerson EIC ON F.EICPersonKey = EIC.PersonKey AND F.MonthStart BETWEEN '20250101' AND '20281231'
					JOIN dbo.DimProject PR ON F.ProjectKey = PR.ProjectKey
					JOIN dbo.DimSegment S ON F.SegmentKey = S.SegmentKey --AND S.SegmentName NOT IN ('National Communication & High Tech','Unknown')
					JOIN dbo.DimAccount A ON F.AccountKey = A.AccountKey
					JOIN dbo.DimPractice PRAC ON F.PracticeKey = PRAC.PracticeKey
					JOIN dbo.DimOpportunity O ON F.OpportunityKey = O.OpportunityKey 
					OUTER APPLY (SELECT TOP 1 OPPTY.* FROM dbo.FactOpportunity OPPTY WHERE O.OpportunityKey = OPPTY.OpportunityKey AND OPPTY.ProjectKey = F.ProjectKey ORDER BY OPPTY.ValidFrom DESC) FO
					LEFT JOIN dbo.DimPerson DEIC ON FO.SalesExecutiveInChargePersonKey = DEIC.PersonKey
					WHERE F.ProjectStatus NOT IN ('Inactive', 'Unknown')
						AND F.FinancialType = 'Margin'
						AND NOT EXISTS(SELECT 1 FROM dbo.FactAttainmentHighConfidence " & SystemTimeVar & " HC WHERE F.OpportunityKey = HC.OpportunityKey)
						AND ((F.ProjectStatus = 'CRM Weighted' AND O.YearEndTargetingOnly != 'Yes' AND O.UnknownRevenue != 'Yes') OR F.ProjectStatus != 'cRM weighted')
				) Summary
			GROUP BY FactProjectSummaryKey
						, ProjectKey
						, AccountKey
						, SegmentKey
						, SalesPersonKey
						, ClientDirectorPersonKey
						, PracticeKey
						, SalesStage
						, ProjectStatus
						, FinancialType
						, OpportunityKey
						, WinProbability
						, AccountType
						, AssignedOffice
						, SalesPerson
						, ValidFrom
						, ValidTo
						, [DimPerson(ClientDirectorPersonKey).FirstName]
						, [DimPerson(ClientDirectorPersonKey).LastName]
						, [DimProject.ProjectType]
						, [DimProject.ProjectNumber]
						, [DimProject.ProjectName]
						, [DimProject.BusinessType]
						, [DimProject.ProjectStartDate]
						, [DimProject.ProjectEndDate]
						, [DimProject.WorkdayObjectID]
						, [DimProject.Commission]
						, [DimProject.DealType]
						, [DimSegment.SegmentName]
						, [DimAccount.AccountType]
						, [DimAccount.AccountName]
						, [DimPractice.PracticeName]
						, [WorkdayURL]
						, [Project Owner]
						, [EIC]
						, [MonthStart]
			) Result
		WHERE [Jan-26] IS NOT NULL OR
				[Feb-26] IS NOT NULL OR
				[Mar-26] IS NOT NULL OR
				[Apr-26] IS NOT NULL OR
				[May-26] IS NOT NULL OR
				[Jun-26] IS NOT NULL OR
				[Jul-26] IS NOT NULL OR
				[Aug-26] IS NOT NULL OR
				[Sep-26] IS NOT NULL OR
				[Oct-26] IS NOT NULL OR
				[Nov-26] IS NOT NULL OR
				[Dec-26] IS NOT NULL OR
				[Jan-27] IS NOT NULL OR
				[Feb-27] IS NOT NULL OR
				[Mar-27] IS NOT NULL OR
				[Apr-27] IS NOT NULL OR
				[May-27] IS NOT NULL OR
				[Jun-27] IS NOT NULL OR
				[Jul-27] IS NOT NULL OR
				[Aug-27] IS NOT NULL OR
				[Sep-27] IS NOT NULL OR
				[Oct-27] IS NOT NULL OR
				[Nov-27] IS NOT NULL OR
				[Dec-27] IS NOT NULL 
		GROUP BY
			ProjectKey
			, AccountKey
			, SegmentKey
			, SalesPersonKey
			, ClientDirectorPersonKey
			, PracticeKey
			, SalesStage
			, ProjectStatus
			, FinancialType
			, OpportunityKey
			, WinProbability
			, AccountType
			, AssignedOffice
			, SalesPerson
			, [DimPerson(ClientDirectorPersonKey).FirstName]
			, [DimPerson(ClientDirectorPersonKey).LastName]
			, [DimProject.ProjectType]
			, [DimProject.ProjectNumber]
			, [DimProject.ProjectName]
			, [DimProject.BusinessType]
			, [DimProject.ProjectStartDate]
			, [DimProject.ProjectEndDate]
			, [DimProject.WorkdayObjectID]
			, [DimProject.Commission]
			, [DimProject.DealType]
			, [DimSegment.SegmentName]
			, [DimAccount.AccountType]
			, [DimAccount.AccountName]
			, [DimPractice.PracticeName]
			, [WorkdayURL]
			, [Project Owner]
			, [EIC]

	UNION ALL


		SELECT " & TodayVar2 & " [AsOfDate]
		--SELECT GETDATE() [AsOfDate]
			, ProjectKey
			, AccountKey
			, SegmentKey
			, SalesPersonKey
			, ClientDirectorPersonKey
			, PracticeKey
			, SalesStage
			, ProjectStatus
			, OpportunityKey
			, WinProbability
			, AccountType
			, AssignedOffice
			, SalesPerson
			, [DimPerson(ClientDirectorPersonKey).FirstName]
			, [DimPerson(ClientDirectorPersonKey).LastName]
			, [DimProject.ProjectType]
			, [DimProject.ProjectNumber]
			, [DimProject.ProjectName]
			, [DimProject.BusinessType]
			, [DimProject.ProjectStartDate]
			, [DimProject.ProjectEndDate]
			, [DimProject.WorkdayObjectID]
			, [DimProject.Commission]
			, [DimProject.DealType]
			, [DimSegment.SegmentName]
			, [DimAccount.AccountType]
			, [DimAccount.AccountName]
			, [DimPractice.PracticeName]
			, [WorkdayURL]
			, [Project Owner]
			, [EIC]
			, FinancialType
			, SUM([Jan-26]) [Jan-26]
			, SUM([Feb-26]) [Feb-26]
			, SUM([Mar-26]) [Mar-26]
			, SUM([Apr-26]) [Apr-26]
			, SUM([May-26]) [May-26]
			, SUM([Jun-26]) [Jun-26]
			, SUM([Jul-26]) [Jul-26]
			, SUM([Aug-26]) [Aug-26]
			, SUM([Sep-26]) [Sep-26]
			, SUM([Oct-26]) [Oct-26]
			, SUM([Nov-26]) [Nov-26]
			, SUM([Dec-26]) [Dec-26]
			, SUM([Jan-27]) [Jan-27]
			, SUM([Feb-27]) [Feb-27]
			, SUM([Mar-27]) [Mar-27]
			, SUM([Apr-27]) [Apr-27]
			, SUM([May-27]) [May-27]
			, SUM([Jun-27]) [Jun-27]
			, SUM([Jul-27]) [Jul-27]
			, SUM([Aug-27]) [Aug-27]
			, SUM([Sep-27]) [Sep-27]
			, SUM([Oct-27]) [Oct-27]
			, SUM([Nov-27]) [Nov-27]
			, SUM([Dec-27]) [Dec-27]
		FROM
			(SELECT FactProjectSummaryKey
						, ProjectKey
						, AccountKey
						, SegmentKey
						, SalesPersonKey
						, ClientDirectorPersonKey
						, PracticeKey
						, SalesStage
						, ProjectStatus
						, OpportunityKey
						, WinProbability
						, AccountType
						, AssignedOffice
						, SalesPerson
						, ValidFrom
						, ValidTo
						, [DimPerson(ClientDirectorPersonKey).FirstName]
						, [DimPerson(ClientDirectorPersonKey).LastName]
						, [DimProject.ProjectType]
						, [DimProject.ProjectNumber]
						, [DimProject.ProjectName]
						, [DimProject.BusinessType]
						, [DimProject.ProjectStartDate]
						, [DimProject.ProjectEndDate]
						, [DimProject.WorkdayObjectID]
						, [DimProject.Commission]
						, [DimProject.DealType]
						, [DimSegment.SegmentName]
						, [DimAccount.AccountType]
						, [DimAccount.AccountName]
						, [DimPractice.PracticeName]
						, [WorkdayURL]
						, [Project Owner]
						, [EIC] 
						, FinancialType
						, CASE WHEN [MonthStart] = 'Jan  1 2026 12:00AM' THEN SUM(Revenue) END [Jan-26]
						, CASE WHEN [MonthStart] = 'Feb  1 2026 12:00AM' THEN SUM(Revenue) END [Feb-26]
						, CASE WHEN [MonthStart] = 'Mar  1 2026 12:00AM' THEN SUM(Revenue) END [Mar-26]
						, CASE WHEN [MonthStart] = 'Apr  1 2026 12:00AM' THEN SUM(Revenue) END [Apr-26]
						, CASE WHEN [MonthStart] = 'May  1 2026 12:00AM' THEN SUM(Revenue) END [May-26]
						, CASE WHEN [MonthStart] = 'Jun  1 2026 12:00AM' THEN SUM(Revenue) END [Jun-26]
						, CASE WHEN [MonthStart] = 'Jul  1 2026 12:00AM' THEN SUM(Revenue) END [Jul-26]
						, CASE WHEN [MonthStart] = 'Aug  1 2026 12:00AM' THEN SUM(Revenue) END [Aug-26]
						, CASE WHEN [MonthStart] = 'Sep  1 2026 12:00AM' THEN SUM(Revenue) END [Sep-26]
						, CASE WHEN [MonthStart] = 'Oct  1 2026 12:00AM' THEN SUM(Revenue) END [Oct-26]
						, CASE WHEN [MonthStart] = 'Nov  1 2026 12:00AM' THEN SUM(Revenue) END [Nov-26]
						, CASE WHEN [MonthStart] = 'Dec  1 2026 12:00AM' THEN SUM(Revenue) END [Dec-26]
						, CASE WHEN [MonthStart] = 'Jan  1 2027 12:00AM' THEN SUM(Revenue) END [Jan-27]
						, CASE WHEN [MonthStart] = 'Feb  1 2027 12:00AM' THEN SUM(Revenue) END [Feb-27]
						, CASE WHEN [MonthStart] = 'Mar  1 2027 12:00AM' THEN SUM(Revenue) END [Mar-27]
						, CASE WHEN [MonthStart] = 'Apr  1 2027 12:00AM' THEN SUM(Revenue) END [Apr-27]
						, CASE WHEN [MonthStart] = 'May  1 2027 12:00AM' THEN SUM(Revenue) END [May-27]
						, CASE WHEN [MonthStart] = 'Jun  1 2027 12:00AM' THEN SUM(Revenue) END [Jun-27]
						, CASE WHEN [MonthStart] = 'Jul  1 2027 12:00AM' THEN SUM(Revenue) END [Jul-27]
						, CASE WHEN [MonthStart] = 'Aug  1 2027 12:00AM' THEN SUM(Revenue) END [Aug-27]
						, CASE WHEN [MonthStart] = 'Sep  1 2027 12:00AM' THEN SUM(Revenue) END [Sep-27]
						, CASE WHEN [MonthStart] = 'Oct  1 2027 12:00AM' THEN SUM(Revenue) END [Oct-27]
						, CASE WHEN [MonthStart] = 'Nov  1 2027 12:00AM' THEN SUM(Revenue) END [Nov-27]
						, CASE WHEN [MonthStart] = 'Dec  1 2027 12:00AM' THEN SUM(Revenue) END [Dec-27]
			FROM (
					SELECT F.FactProjectSummaryKey
						, F.ProjectKey
						, F.AccountKey
						, F.SegmentKey
						, F.SalesPersonKey
						, F.ClientDirectorPersonKey
						, F.PracticeKey
						, F.SalesStage
						, F.ProjectStatus
						, F.MonthStart
						, F.DollarAmount
						, F.TargetDollarAmount
						, F.FinancialType
						, F.OpportunityKey
						, F.WinProbability
						, F.AccountType
						, F.AssignedOffice
						, F.SalesPerson
						, F.ValidFrom
						, F.ValidTo
						, CDP.FirstName [DimPerson(ClientDirectorPersonKey).FirstName]
						, CDP.LastName [DimPerson(ClientDirectorPersonKey).LastName]
						, PR.ProjectType [DimProject.ProjectType]
						, PR.ProjectNumber [DimProject.ProjectNumber]
						, CASE WHEN PR.ProjectName = '' THEN O.OpportunityName ELSE PR.ProjectName END [DimProject.ProjectName]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN O.DealType ELSE PR.BusinessType END [DimProject.BusinessType]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN O.StartDate ELSE PR.ProjectStartDate END [DimProject.ProjectStartDate]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN O.EndDate ELSE PR.ProjectEndDate END [DimProject.ProjectEndDate]
						, PR.WorkdayObjectID [DimProject.WorkdayObjectID]
						, PR.Commission [DimProject.Commission]
						, PR.DealType [DimProject.DealType]
						, S.SegmentName [DimSegment.SegmentName]
						, A.AccountType [DimAccount.AccountType]
						, A.AccountName [DimAccount.AccountName]
						, PRAC.PracticeName [DimPractice.PracticeName]
						, CASE WHEN F.FinancialType = 'Margin' THEN F.DollarAmount ELSE 0.00 END [Margin]
						, CASE WHEN F.FinancialType = 'Revenue' THEN F.DollarAmount ELSE 0.00 END [Revenue]
						, CASE WHEN PR.ProjectEndDate > '20240701' THEN 'https://wd12.myworkday.com/logic/d/inst/deeplink/' + PR.WorkdayObjectID + '.htmld' ELSE '' END [WorkdayURL]
						, CDP.FirstName + ' ' + CDP.LastName [Project Owner]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN DEIC.FirstName + ' ' + DEIC.LastName WHEN EIC.FirstName = 'Unknown' THEN 'Unknown' ELSE EIC.FirstName + ' ' + EIC.LastName END [EIC]
					FROM dbo.FactProjectSummary " & SystemTimeVar2 & " F
					--FROM dbo.FactProjectSummary F
					JOIN dbo.DimPerson CDP ON F.ClientDirectorPersonKey = CDP.PersonKey AND F.MonthStart BETWEEN '20250101' AND '20281231'
					JOIN dbo.DimPerson EIC ON F.EICPersonKey = EIC.PersonKey AND F.MonthStart BETWEEN '20250101' AND '20281231'
					JOIN dbo.DimProject PR ON F.ProjectKey = PR.ProjectKey
					JOIN dbo.DimSegment S ON F.SegmentKey = S.SegmentKey --AND S.SegmentName NOT IN ('National Communication & High Tech','Unknown')
					JOIN dbo.DimAccount A ON F.AccountKey = A.AccountKey
					JOIN dbo.DimPractice PRAC ON F.PracticeKey = PRAC.PracticeKey
					JOIN dbo.DimOpportunity O ON F.OpportunityKey = O.OpportunityKey 
					OUTER APPLY (SELECT TOP 1 OPPTY.* FROM dbo.FactOpportunity OPPTY WHERE O.OpportunityKey = OPPTY.OpportunityKey AND OPPTY.ProjectKey = F.ProjectKey ORDER BY OPPTY.ValidFrom DESC) FO
					LEFT JOIN dbo.DimPerson DEIC ON FO.SalesExecutiveInChargePersonKey = DEIC.PersonKey
					WHERE F.ProjectStatus NOT IN ('Inactive', 'Unknown')
						AND F.FinancialType = 'Revenue'
						AND NOT EXISTS(SELECT 1 FROM dbo.FactAttainmentHighConfidence " & SystemTimeVar2 & " HC WHERE F.OpportunityKey = HC.OpportunityKey)
						AND ((F.ProjectStatus = 'CRM Weighted' AND O.YearEndTargetingOnly != 'Yes' AND O.UnknownRevenue != 'Yes') OR F.ProjectStatus != 'cRM weighted')
				) Summary
			GROUP BY FactProjectSummaryKey
						, ProjectKey
						, AccountKey
						, SegmentKey
						, SalesPersonKey
						, ClientDirectorPersonKey
						, PracticeKey
						, SalesStage
						, ProjectStatus
						, FinancialType
						, OpportunityKey
						, WinProbability
						, AccountType
						, AssignedOffice
						, SalesPerson
						, ValidFrom
						, ValidTo
						, [DimPerson(ClientDirectorPersonKey).FirstName]
						, [DimPerson(ClientDirectorPersonKey).LastName]
						, [DimProject.ProjectType]
						, [DimProject.ProjectNumber]
						, [DimProject.ProjectName]
						, [DimProject.BusinessType]
						, [DimProject.ProjectStartDate]
						, [DimProject.ProjectEndDate]
						, [DimProject.WorkdayObjectID]
						, [DimProject.Commission]
						, [DimProject.DealType]
						, [DimSegment.SegmentName]
						, [DimAccount.AccountType]
						, [DimAccount.AccountName]
						, [DimPractice.PracticeName]
						, [WorkdayURL]
						, [Project Owner]
						, [EIC]
						, [MonthStart]
	UNION ALL
			SELECT FactProjectSummaryKey
						, ProjectKey
						, AccountKey
						, SegmentKey
						, SalesPersonKey
						, ClientDirectorPersonKey
						, PracticeKey
						, SalesStage
						, ProjectStatus
						, OpportunityKey
						, WinProbability
						, AccountType
						, AssignedOffice
						, SalesPerson
						, ValidFrom
						, ValidTo
						, [DimPerson(ClientDirectorPersonKey).FirstName]
						, [DimPerson(ClientDirectorPersonKey).LastName]
						, [DimProject.ProjectType]
						, [DimProject.ProjectNumber]
						, [DimProject.ProjectName]
						, [DimProject.BusinessType]
						, [DimProject.ProjectStartDate]
						, [DimProject.ProjectEndDate]
						, [DimProject.WorkdayObjectID]
						, [DimProject.Commission]
						, [DimProject.DealType]
						, [DimSegment.SegmentName]
						, [DimAccount.AccountType]
						, [DimAccount.AccountName]
						, [DimPractice.PracticeName]
						, [WorkdayURL]
						, [Project Owner]
						, [EIC] 
						, FinancialType
						, CASE WHEN [MonthStart] = 'Jan  1 2026 12:00AM' THEN SUM(Margin) END [Jan-26]
						, CASE WHEN [MonthStart] = 'Feb  1 2026 12:00AM' THEN SUM(Margin) END [Feb-26]
						, CASE WHEN [MonthStart] = 'Mar  1 2026 12:00AM' THEN SUM(Margin) END [Mar-26]
						, CASE WHEN [MonthStart] = 'Apr  1 2026 12:00AM' THEN SUM(Margin) END [Apr-26]
						, CASE WHEN [MonthStart] = 'May  1 2026 12:00AM' THEN SUM(Margin) END [May-26]
						, CASE WHEN [MonthStart] = 'Jun  1 2026 12:00AM' THEN SUM(Margin) END [Jun-26]
						, CASE WHEN [MonthStart] = 'Jul  1 2026 12:00AM' THEN SUM(Margin) END [Jul-26]
						, CASE WHEN [MonthStart] = 'Aug  1 2026 12:00AM' THEN SUM(Margin) END [Aug-26]
						, CASE WHEN [MonthStart] = 'Sep  1 2026 12:00AM' THEN SUM(Margin) END [Sep-26]
						, CASE WHEN [MonthStart] = 'Oct  1 2026 12:00AM' THEN SUM(Margin) END [Oct-26]
						, CASE WHEN [MonthStart] = 'Nov  1 2026 12:00AM' THEN SUM(Margin) END [Nov-26]
						, CASE WHEN [MonthStart] = 'Dec  1 2026 12:00AM' THEN SUM(Margin) END [Dec-26]
						, CASE WHEN [MonthStart] = 'Jan  1 2027 12:00AM' THEN SUM(Margin) END [Jan-27]
						, CASE WHEN [MonthStart] = 'Feb  1 2027 12:00AM' THEN SUM(Margin) END [Feb-27]
						, CASE WHEN [MonthStart] = 'Mar  1 2027 12:00AM' THEN SUM(Margin) END [Mar-27]
						, CASE WHEN [MonthStart] = 'Apr  1 2027 12:00AM' THEN SUM(Margin) END [Apr-27]
						, CASE WHEN [MonthStart] = 'May  1 2027 12:00AM' THEN SUM(Margin) END [May-27]
						, CASE WHEN [MonthStart] = 'Jun  1 2027 12:00AM' THEN SUM(Margin) END [Jun-27]
						, CASE WHEN [MonthStart] = 'Jul  1 2027 12:00AM' THEN SUM(Margin) END [Jul-27]
						, CASE WHEN [MonthStart] = 'Aug  1 2027 12:00AM' THEN SUM(Margin) END [Aug-27]
						, CASE WHEN [MonthStart] = 'Sep  1 2027 12:00AM' THEN SUM(Margin) END [Sep-27]
						, CASE WHEN [MonthStart] = 'Oct  1 2027 12:00AM' THEN SUM(Margin) END [Oct-27]
						, CASE WHEN [MonthStart] = 'Nov  1 2027 12:00AM' THEN SUM(Margin) END [Nov-27]
						, CASE WHEN [MonthStart] = 'Dec  1 2027 12:00AM' THEN SUM(Margin) END [Dec-27]
			FROM (
					SELECT F.FactProjectSummaryKey
						, F.ProjectKey
						, F.AccountKey
						, F.SegmentKey
						, F.SalesPersonKey
						, F.ClientDirectorPersonKey
						, F.PracticeKey
						, F.SalesStage
						, F.ProjectStatus
						, F.MonthStart
						, F.DollarAmount
						, F.TargetDollarAmount
						, F.FinancialType
						, F.OpportunityKey
						, F.WinProbability
						, F.AccountType
						, F.AssignedOffice
						, F.SalesPerson
						, F.ValidFrom
						, F.ValidTo
						, CDP.FirstName [DimPerson(ClientDirectorPersonKey).FirstName]
						, CDP.LastName [DimPerson(ClientDirectorPersonKey).LastName]
						, PR.ProjectType [DimProject.ProjectType]
						, PR.ProjectNumber [DimProject.ProjectNumber]
						, CASE WHEN PR.ProjectName = '' THEN O.OpportunityName ELSE PR.ProjectName END [DimProject.ProjectName]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN O.DealType ELSE PR.BusinessType END [DimProject.BusinessType]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN O.StartDate ELSE PR.ProjectStartDate END [DimProject.ProjectStartDate]
						, CASE WHEN F.ProjectStatus = 'CRM Weighted' THEN O.EndDate ELSE PR.ProjectEndDate END [DimProject.ProjectEndDate]
						, PR.WorkdayObjectID [DimProject.WorkdayObjectID]
						, PR.Commission [DimProject.Commission]
						, PR.DealType [DimProject.DealType]
						, S.SegmentName [DimSegment.SegmentName]
						, A.AccountType [DimAccount.AccountType]
						, A.AccountName [DimAccount.AccountName]
						, PRAC.PracticeName [DimPractice.PracticeName]
						, CASE WHEN F.FinancialType = 'Margin' THEN F.DollarAmount ELSE 0.00 END [Margin]
						, CASE WHEN F.FinancialType = 'Revenue' THEN F.DollarAmount ELSE 0.00 END [Revenue]
						, CASE WHEN PR.ProjectEndDate > '20240701' THEN 'https://wd12.myworkday.com/logic/d/inst/deeplink/' + PR.WorkdayObjectID + '.htmld' ELSE '' END [WorkdayURL]
						, CDP.FirstName + ' ' + CDP.LastName [Project Owner]
						, CASE WHEN EIC.FirstName = 'Unknown' THEN 'Unknown' ELSE EIC.FirstName + ' ' + EIC.LastName END [EIC]
					FROM dbo.FactProjectSummary " & SystemTimeVar2 & " F
					--FROM dbo.FactProjectSummary F
					JOIN dbo.DimPerson CDP ON F.ClientDirectorPersonKey = CDP.PersonKey AND F.MonthStart BETWEEN '20250101' AND '20281231'
					JOIN dbo.DimPerson EIC ON F.EICPersonKey = EIC.PersonKey AND F.MonthStart BETWEEN '20250101' AND '20281231'
					JOIN dbo.DimProject PR ON F.ProjectKey = PR.ProjectKey
					JOIN dbo.DimSegment S ON F.SegmentKey = S.SegmentKey --AND S.SegmentName NOT IN ('National Communication & High Tech','Unknown')
					JOIN dbo.DimAccount A ON F.AccountKey = A.AccountKey
					JOIN dbo.DimPractice PRAC ON F.PracticeKey = PRAC.PracticeKey
					JOIN dbo.DimOpportunity O ON F.OpportunityKey = O.OpportunityKey 
					OUTER APPLY (SELECT TOP 1 OPPTY.* FROM dbo.FactOpportunity OPPTY WHERE O.OpportunityKey = OPPTY.OpportunityKey AND OPPTY.ProjectKey = F.ProjectKey ORDER BY OPPTY.ValidFrom DESC) FO
					LEFT JOIN dbo.DimPerson DEIC ON FO.SalesExecutiveInChargePersonKey = DEIC.PersonKey
					WHERE F.ProjectStatus NOT IN ('Inactive', 'Unknown')
						AND F.FinancialType = 'Margin'
						AND NOT EXISTS(SELECT 1 FROM dbo.FactAttainmentHighConfidence " & SystemTimeVar2 & " HC WHERE F.OpportunityKey = HC.OpportunityKey)
						AND ((F.ProjectStatus = 'CRM Weighted' AND O.YearEndTargetingOnly != 'Yes' AND O.UnknownRevenue != 'Yes') OR F.ProjectStatus != 'cRM weighted')
				) Summary
			GROUP BY FactProjectSummaryKey
						, ProjectKey
						, AccountKey
						, SegmentKey
						, SalesPersonKey
						, ClientDirectorPersonKey
						, PracticeKey
						, SalesStage
						, ProjectStatus
						, FinancialType
						, OpportunityKey
						, WinProbability
						, AccountType
						, AssignedOffice
						, SalesPerson
						, ValidFrom
						, ValidTo
						, [DimPerson(ClientDirectorPersonKey).FirstName]
						, [DimPerson(ClientDirectorPersonKey).LastName]
						, [DimProject.ProjectType]
						, [DimProject.ProjectNumber]
						, [DimProject.ProjectName]
						, [DimProject.BusinessType]
						, [DimProject.ProjectStartDate]
						, [DimProject.ProjectEndDate]
						, [DimProject.WorkdayObjectID]
						, [DimProject.Commission]
						, [DimProject.DealType]
						, [DimSegment.SegmentName]
						, [DimAccount.AccountType]
						, [DimAccount.AccountName]
						, [DimPractice.PracticeName]
						, [WorkdayURL]
						, [Project Owner]
						, [EIC]
						, [MonthStart]
			) Result
		WHERE [Jan-26] IS NOT NULL OR
				[Feb-26] IS NOT NULL OR
				[Mar-26] IS NOT NULL OR
				[Apr-26] IS NOT NULL OR
				[May-26] IS NOT NULL OR
				[Jun-26] IS NOT NULL OR
				[Jul-26] IS NOT NULL OR
				[Aug-26] IS NOT NULL OR
				[Sep-26] IS NOT NULL OR
				[Oct-26] IS NOT NULL OR
				[Nov-26] IS NOT NULL OR
				[Dec-26] IS NOT NULL OR
				[Jan-27] IS NOT NULL OR
				[Feb-27] IS NOT NULL OR
				[Mar-27] IS NOT NULL OR
				[Apr-27] IS NOT NULL OR
				[May-27] IS NOT NULL OR
				[Jun-27] IS NOT NULL OR
				[Jul-27] IS NOT NULL OR
				[Aug-27] IS NOT NULL OR
				[Sep-27] IS NOT NULL OR
				[Oct-27] IS NOT NULL OR
				[Nov-27] IS NOT NULL OR
				[Dec-27] IS NOT NULL 
		GROUP BY
			ProjectKey
			, AccountKey
			, SegmentKey
			, SalesPersonKey
			, ClientDirectorPersonKey
			, PracticeKey
			, SalesStage
			, ProjectStatus
			, FinancialType
			, OpportunityKey
			, WinProbability
			, AccountType
			, AssignedOffice
			, SalesPerson
			, [DimPerson(ClientDirectorPersonKey).FirstName]
			, [DimPerson(ClientDirectorPersonKey).LastName]
			, [DimProject.ProjectType]
			, [DimProject.ProjectNumber]
			, [DimProject.ProjectName]
			, [DimProject.BusinessType]
			, [DimProject.ProjectStartDate]
			, [DimProject.ProjectEndDate]
			, [DimProject.WorkdayObjectID]
			, [DimProject.Commission]
			, [DimProject.DealType]
			, [DimSegment.SegmentName]
			, [DimAccount.AccountType]
			, [DimAccount.AccountName]
			, [DimPractice.PracticeName]
			, [WorkdayURL]
			, [Project Owner]
			, [EIC]
) D

UNION ALL 

SELECT *, CAST(1 AS BIT) [HighConfidence]
FROM 
(

				SELECT " & TodayVar & " [AsOfDate]
				--select GETDATE() [AsOfDate]
							, ProjectKey
							, AccountKey
							, SegmentKey
							, SalesPersonKey
							, ClientDirectorPersonKey
							, PracticeKey
							, '1 - Closed' [SalesStage] /* to ensure high confidence ext show as booked revenue  */
							, 'At Risk' [ProjectStatus] /* to ensure high confidence ext show as booked revenue  */
							, OpportunityKey
							, WinProbability
							, AccountType
							, AssignedOffice
							, SalesPerson
							, [DimPerson(ClientDirectorPersonKey).FirstName]
							, [DimPerson(ClientDirectorPersonKey).LastName]
							, [DimProject.ProjectType]
							, [DimProject.ProjectNumber]
							, [DimProject.ProjectName]
							, [DimProject.BusinessType]
							, [DimProject.ProjectStartDate]
							, [DimProject.ProjectEndDate]
							, [DimProject.WorkdayObjectID]
							, [DimProject.Commission]
							, [DimProject.DealType]
							, [DimSegment.SegmentName]
							, [DimAccount.AccountType]
							, [DimAccount.AccountName]
							, [DimPractice.PracticeName]
							, [WorkdayURL]
							, [Project Owner]
							, [EIC]
							, FinancialType
							, SUM([Jan-26]) [Jan-26]
							, SUM([Feb-26]) [Feb-26]
							, SUM([Mar-26]) [Mar-26]
							, SUM([Apr-26]) [Apr-26]
							, SUM([May-26]) [May-26]
							, SUM([Jun-26]) [Jun-26]
							, SUM([Jul-26]) [Jul-26]
							, SUM([Aug-26]) [Aug-26]
							, SUM([Sep-26]) [Sep-26]
							, SUM([Oct-26]) [Oct-26]
							, SUM([Nov-26]) [Nov-26]
							, SUM([Dec-26]) [Dec-26]
							, SUM([Jan-27]) [Jan-27]
							, SUM([Feb-27]) [Feb-27]
							, SUM([Mar-27]) [Mar-27]
							, SUM([Apr-27]) [Apr-27]
							, SUM([May-27]) [May-27]
							, SUM([Jun-27]) [Jun-27]
							, SUM([Jul-27]) [Jul-27]
							, SUM([Aug-27]) [Aug-27]
							, SUM([Sep-27]) [Sep-27]
							, SUM([Oct-27]) [Oct-27]
							, SUM([Nov-27]) [Nov-27]
							, SUM([Dec-27]) [Dec-27] 
						FROM (

												SELECT F.ProjectKey
												, F.AccountKey
												, F.SegmentKey
												, F.SalesPersonKey
												, F.ClientDirectorPersonKey
												, F.PracticeKey
												, F.SalesStage
												, F.ProjectStatus
												, F.OpportunityKey
												, F.WinProbability
												, F.AccountType
												, F.AssignedOffice
												, F.SalesPerson
												, CDP.FirstName [DimPerson(ClientDirectorPersonKey).FirstName]
												, CDP.LastName [DimPerson(ClientDirectorPersonKey).LastName]
												, PR.ProjectType [DimProject.ProjectType]
												, PR.ProjectNumber [DimProject.ProjectNumber]
												, O.OpportunityName [DimProject.ProjectName]
												, O.DealType [DimProject.BusinessType]
												, O.StartDate [DimProject.ProjectStartDate]
												, O.EndDate [DimProject.ProjectEndDate]
												, PR.WorkdayObjectID [DimProject.WorkdayObjectID]
												, PR.Commission [DimProject.Commission]
												, PR.DealType [DimProject.DealType]
												, S.SegmentName [DimSegment.SegmentName]
												, A.AccountType [DimAccount.AccountType]
												, A.AccountName [DimAccount.AccountName]
												, PRAC.PracticeName [DimPractice.PracticeName]
												, 'https://wd12.myworkday.com/logic/d/inst/deeplink/' + PR.WorkdayObjectID + '.htmld' [WorkdayURL]
												, CDP.FirstName + ' ' + CDP.LastName [Project Owner]
												, DEIC.FirstName + ' ' + DEIC.LastName [EIC]
												, 'Revenue' FinancialType
												, CASE WHEN HC.[MonthStart] = 'Jan  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Jan-26]
												, CASE WHEN HC.[MonthStart] = 'Feb  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Feb-26]
												, CASE WHEN HC.[MonthStart] = 'Mar  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Mar-26]
												, CASE WHEN HC.[MonthStart] = 'Apr  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Apr-26]
												, CASE WHEN HC.[MonthStart] = 'May  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [May-26]
												, CASE WHEN HC.[MonthStart] = 'Jun  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Jun-26]
												, CASE WHEN HC.[MonthStart] = 'Jul  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Jul-26]
												, CASE WHEN HC.[MonthStart] = 'Aug  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Aug-26]
												, CASE WHEN HC.[MonthStart] = 'Sep  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Sep-26]
												, CASE WHEN HC.[MonthStart] = 'Oct  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Oct-26]
												, CASE WHEN HC.[MonthStart] = 'Nov  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Nov-26]
												, CASE WHEN HC.[MonthStart] = 'Dec  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Dec-26]
												, CASE WHEN HC.[MonthStart] = 'Jan  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Jan-27]
												, CASE WHEN HC.[MonthStart] = 'Feb  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Feb-27]
												, CASE WHEN HC.[MonthStart] = 'Mar  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Mar-27]
												, CASE WHEN HC.[MonthStart] = 'Apr  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Apr-27]
												, CASE WHEN HC.[MonthStart] = 'May  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [May-27]
												, CASE WHEN HC.[MonthStart] = 'Jun  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Jun-27]
												, CASE WHEN HC.[MonthStart] = 'Jul  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Jul-27]
												, CASE WHEN HC.[MonthStart] = 'Aug  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Aug-27]
												, CASE WHEN HC.[MonthStart] = 'Sep  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Sep-27]
												, CASE WHEN HC.[MonthStart] = 'Oct  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Oct-27]
												, CASE WHEN HC.[MonthStart] = 'Nov  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Nov-27]
												, CASE WHEN HC.[MonthStart] = 'Dec  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Dec-27]
						FROM dbo.FactAttainmentHighConfidence " & SystemTimeVar & " HC
						JOIN dbo.FactProjectSummary " & SystemTimeVar & " F ON HC.OpportunityKey = F.OpportunityKey AND HC.MonthStart = F.MonthStart AND HC.FinancialType = F.FinancialType
						--FROM dbo.FactAttainmentHighConfidence HC
						--JOIN dbo.FactProjectSummary F ON HC.OpportunityKey = F.OpportunityKey AND HC.MonthStart = F.MonthStart AND HC.FinancialType = F.FinancialType
						JOIN dbo.DimPerson CDP ON F.ClientDirectorPersonKey = CDP.PersonKey AND F.MonthStart BETWEEN '20250101' AND '20281231'
						JOIN dbo.DimPerson EIC ON F.EICPersonKey = EIC.PersonKey AND F.MonthStart BETWEEN '20250101' AND '20281231'
						JOIN dbo.DimProject PR ON F.ProjectKey = PR.ProjectKey
						JOIN dbo.DimSegment S ON F.SegmentKey = S.SegmentKey --AND S.SegmentName NOT IN ('National Communication & High Tech','Unknown')
						JOIN dbo.DimAccount A ON F.AccountKey = A.AccountKey
						JOIN dbo.DimPractice PRAC ON F.PracticeKey = PRAC.PracticeKey
						JOIN dbo.DimOpportunity O ON F.OpportunityKey = O.OpportunityKey 
						OUTER APPLY (SELECT TOP 1 OPPTY.* FROM dbo.FactOpportunity OPPTY WHERE O.OpportunityKey = OPPTY.OpportunityKey AND OPPTY.ProjectKey = F.ProjectKey ORDER BY OPPTY.ValidFrom DESC) FO
						LEFT JOIN dbo.DimPerson DEIC ON FO.SalesExecutiveInChargePersonKey = DEIC.PersonKey
						WHERE HC.FinancialType = 'Revenue' AND HC.MonthStart BETWEEN '20260101' AND '20281231'
						AND ((F.ProjectStatus = 'CRM Weighted' AND O.YearEndTargetingOnly != 'Yes' AND O.UnknownRevenue != 'Yes') OR F.ProjectStatus != 'cRM weighted')
						GROUP BY F.ProjectKey
												, F.AccountKey
												, F.SegmentKey
												, F.SalesPersonKey
												, F.ClientDirectorPersonKey
												, F.PracticeKey
												, F.SalesStage
												, F.ProjectStatus
												, F.OpportunityKey
												, F.WinProbability
												, F.AccountType
												, F.AssignedOffice
												, F.SalesPerson
												, CDP.FirstName 
												, CDP.LastName 
												, PR.ProjectType 
												, PR.ProjectNumber 
												, O.OpportunityName 
												, O.DealType 
												, O.StartDate 
												, O.EndDate 
												, PR.WorkdayObjectID 
												, PR.Commission 
												, PR.DealType 
												, S.SegmentName 
												, A.AccountType 
												, A.AccountName 
												, PRAC.PracticeName 
												, 'https://wd12.myworkday.com/logic/d/inst/deeplink/' + PR.WorkdayObjectID + '.htmld' 
												, CDP.FirstName + ' ' + CDP.LastName 
												, DEIC.FirstName + ' ' + DEIC.LastName 
												, HC.MonthStart




				) D 

				GROUP BY ProjectKey
							, AccountKey
							, SegmentKey
							, SalesPersonKey
							, ClientDirectorPersonKey
							, PracticeKey
							, SalesStage
							, ProjectStatus
							, OpportunityKey
							, WinProbability
							, AccountType
							, AssignedOffice
							, SalesPerson
							, [DimPerson(ClientDirectorPersonKey).FirstName]
							, [DimPerson(ClientDirectorPersonKey).LastName]
							, [DimProject.ProjectType]
							, [DimProject.ProjectNumber]
							, [DimProject.ProjectName]
							, [DimProject.BusinessType]
							, [DimProject.ProjectStartDate]
							, [DimProject.ProjectEndDate]
							, [DimProject.WorkdayObjectID]
							, [DimProject.Commission]
							, [DimProject.DealType]
							, [DimSegment.SegmentName]
							, [DimAccount.AccountType]
							, [DimAccount.AccountName]
							, [DimPractice.PracticeName]
							, [WorkdayURL]
							, [Project Owner]
							, [EIC]
							, FinancialType

				/*******/
				UNION ALL
				/*******/

				SELECT " & TodayVar & " [AsOfDate]
				--select GETDATE() [AsOfDate]
							, ProjectKey
							, AccountKey
							, SegmentKey
							, SalesPersonKey
							, ClientDirectorPersonKey
							, PracticeKey
							, SalesStage
							, ProjectStatus
							, OpportunityKey
							, WinProbability
							, AccountType
							, AssignedOffice
							, SalesPerson
							, [DimPerson(ClientDirectorPersonKey).FirstName]
							, [DimPerson(ClientDirectorPersonKey).LastName]
							, [DimProject.ProjectType]
							, [DimProject.ProjectNumber]
							, [DimProject.ProjectName]
							, [DimProject.BusinessType]
							, [DimProject.ProjectStartDate]
							, [DimProject.ProjectEndDate]
							, [DimProject.WorkdayObjectID]
							, [DimProject.Commission]
							, [DimProject.DealType]
							, [DimSegment.SegmentName]
							, [DimAccount.AccountType]
							, [DimAccount.AccountName]
							, [DimPractice.PracticeName]
							, [WorkdayURL]
							, [Project Owner]
							, [EIC]
							, FinancialType
							, SUM([Jan-26]) [Jan-26]
							, SUM([Feb-26]) [Feb-26]
							, SUM([Mar-26]) [Mar-26]
							, SUM([Apr-26]) [Apr-26]
							, SUM([May-26]) [May-26]
							, SUM([Jun-26]) [Jun-26]
							, SUM([Jul-26]) [Jul-26]
							, SUM([Aug-26]) [Aug-26]
							, SUM([Sep-26]) [Sep-26]
							, SUM([Oct-26]) [Oct-26]
							, SUM([Nov-26]) [Nov-26]
							, SUM([Dec-26]) [Dec-26]
							, SUM([Jan-27]) [Jan-27]
							, SUM([Feb-27]) [Feb-27]
							, SUM([Mar-27]) [Mar-27]
							, SUM([Apr-27]) [Apr-27]
							, SUM([May-27]) [May-27]
							, SUM([Jun-27]) [Jun-27]
							, SUM([Jul-27]) [Jul-27]
							, SUM([Aug-27]) [Aug-27]
							, SUM([Sep-27]) [Sep-27]
							, SUM([Oct-27]) [Oct-27]
							, SUM([Nov-27]) [Nov-27]
							, SUM([Dec-27]) [Dec-27] 
						FROM (

												SELECT F.ProjectKey
												, F.AccountKey
												, F.SegmentKey
												, F.SalesPersonKey
												, F.ClientDirectorPersonKey
												, F.PracticeKey
												, F.SalesStage
												, F.ProjectStatus
												, F.OpportunityKey
												, F.WinProbability
												, F.AccountType
												, F.AssignedOffice
												, F.SalesPerson
												, CDP.FirstName [DimPerson(ClientDirectorPersonKey).FirstName]
												, CDP.LastName [DimPerson(ClientDirectorPersonKey).LastName]
												, PR.ProjectType [DimProject.ProjectType]
												, PR.ProjectNumber [DimProject.ProjectNumber]
												, O.OpportunityName [DimProject.ProjectName]
												, O.DealType [DimProject.BusinessType]
												, O.StartDate [DimProject.ProjectStartDate]
												, O.EndDate [DimProject.ProjectEndDate]
												, PR.WorkdayObjectID [DimProject.WorkdayObjectID]
												, PR.Commission [DimProject.Commission]
												, PR.DealType [DimProject.DealType]
												, S.SegmentName [DimSegment.SegmentName]
												, A.AccountType [DimAccount.AccountType]
												, A.AccountName [DimAccount.AccountName]
												, PRAC.PracticeName [DimPractice.PracticeName]
												, 'https://wd12.myworkday.com/logic/d/inst/deeplink/' + PR.WorkdayObjectID + '.htmld' [WorkdayURL]
												, CDP.FirstName + ' ' + CDP.LastName [Project Owner]
												, DEIC.FirstName + ' ' + DEIC.LastName [EIC]
												, 'Margin' FinancialType
												, CASE WHEN HC.[MonthStart] = 'Jan  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Jan-26]
												, CASE WHEN HC.[MonthStart] = 'Feb  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Feb-26]
												, CASE WHEN HC.[MonthStart] = 'Mar  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Mar-26]
												, CASE WHEN HC.[MonthStart] = 'Apr  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Apr-26]
												, CASE WHEN HC.[MonthStart] = 'May  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [May-26]
												, CASE WHEN HC.[MonthStart] = 'Jun  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Jun-26]
												, CASE WHEN HC.[MonthStart] = 'Jul  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Jul-26]
												, CASE WHEN HC.[MonthStart] = 'Aug  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Aug-26]
												, CASE WHEN HC.[MonthStart] = 'Sep  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Sep-26]
												, CASE WHEN HC.[MonthStart] = 'Oct  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Oct-26]
												, CASE WHEN HC.[MonthStart] = 'Nov  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Nov-26]
												, CASE WHEN HC.[MonthStart] = 'Dec  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Dec-26]
												, CASE WHEN HC.[MonthStart] = 'Jan  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Jan-27]
												, CASE WHEN HC.[MonthStart] = 'Feb  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Feb-27]
												, CASE WHEN HC.[MonthStart] = 'Mar  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Mar-27]
												, CASE WHEN HC.[MonthStart] = 'Apr  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Apr-27]
												, CASE WHEN HC.[MonthStart] = 'May  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [May-27]
												, CASE WHEN HC.[MonthStart] = 'Jun  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Jun-27]
												, CASE WHEN HC.[MonthStart] = 'Jul  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Jul-27]
												, CASE WHEN HC.[MonthStart] = 'Aug  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Aug-27]
												, CASE WHEN HC.[MonthStart] = 'Sep  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Sep-27]
												, CASE WHEN HC.[MonthStart] = 'Oct  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Oct-27]
												, CASE WHEN HC.[MonthStart] = 'Nov  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Nov-27]
												, CASE WHEN HC.[MonthStart] = 'Dec  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Dec-27]
						FROM dbo.FactAttainmentHighConfidence " & SystemTimeVar & " HC
						JOIN dbo.FactProjectSummary " & SystemTimeVar & " F ON HC.OpportunityKey = F.OpportunityKey AND HC.MonthStart = F.MonthStart AND HC.FinancialType = F.FinancialType
						--FROM dbo.FactAttainmentHighConfidence HC
						--JOIN dbo.FactProjectSummary F ON HC.OpportunityKey = F.OpportunityKey AND HC.MonthStart = F.MonthStart AND HC.FinancialType = F.FinancialType
						JOIN dbo.DimPerson CDP ON F.ClientDirectorPersonKey = CDP.PersonKey AND F.MonthStart BETWEEN '20250101' AND '20281231'
						JOIN dbo.DimPerson EIC ON F.EICPersonKey = EIC.PersonKey AND F.MonthStart BETWEEN '20250101' AND '20281231'
						JOIN dbo.DimProject PR ON F.ProjectKey = PR.ProjectKey
						JOIN dbo.DimSegment S ON F.SegmentKey = S.SegmentKey --AND S.SegmentName NOT IN ('National Communication & High Tech','Unknown')
						JOIN dbo.DimAccount A ON F.AccountKey = A.AccountKey
						JOIN dbo.DimPractice PRAC ON F.PracticeKey = PRAC.PracticeKey
						JOIN dbo.DimOpportunity O ON F.OpportunityKey = O.OpportunityKey 
						OUTER APPLY (SELECT TOP 1 OPPTY.* FROM dbo.FactOpportunity OPPTY WHERE O.OpportunityKey = OPPTY.OpportunityKey AND OPPTY.ProjectKey = F.ProjectKey ORDER BY OPPTY.ValidFrom DESC) FO
						LEFT JOIN dbo.DimPerson DEIC ON FO.SalesExecutiveInChargePersonKey = DEIC.PersonKey
						WHERE HC.FinancialType = 'Margin' AND HC.MonthStart BETWEEN '20260101' AND '20281231'
							AND ((F.ProjectStatus = 'CRM Weighted' AND O.YearEndTargetingOnly != 'Yes' AND O.UnknownRevenue != 'Yes') OR F.ProjectStatus != 'cRM weighted')
						GROUP BY F.ProjectKey
												, F.AccountKey
												, F.SegmentKey
												, F.SalesPersonKey
												, F.ClientDirectorPersonKey
												, F.PracticeKey
												, F.SalesStage
												, F.ProjectStatus
												, F.OpportunityKey
												, F.WinProbability
												, F.AccountType
												, F.AssignedOffice
												, F.SalesPerson
												, CDP.FirstName 
												, CDP.LastName 
												, PR.ProjectType 
												, PR.ProjectNumber 
												, O.OpportunityName 
												, O.DealType 
												, O.StartDate 
												, O.EndDate 
												, PR.WorkdayObjectID 
												, PR.Commission 
												, PR.DealType 
												, S.SegmentName 
												, A.AccountType 
												, A.AccountName 
												, PRAC.PracticeName 
												, 'https://wd12.myworkday.com/logic/d/inst/deeplink/' + PR.WorkdayObjectID + '.htmld' 
												, CDP.FirstName + ' ' + CDP.LastName 
												, DEIC.FirstName + ' ' + DEIC.LastName 
												, HC.MonthStart




				) D 

				GROUP BY ProjectKey
							, AccountKey
							, SegmentKey
							, SalesPersonKey
							, ClientDirectorPersonKey
							, PracticeKey
							, SalesStage
							, ProjectStatus
							, OpportunityKey
							, WinProbability
							, AccountType
							, AssignedOffice
							, SalesPerson
							, [DimPerson(ClientDirectorPersonKey).FirstName]
							, [DimPerson(ClientDirectorPersonKey).LastName]
							, [DimProject.ProjectType]
							, [DimProject.ProjectNumber]
							, [DimProject.ProjectName]
							, [DimProject.BusinessType]
							, [DimProject.ProjectStartDate]
							, [DimProject.ProjectEndDate]
							, [DimProject.WorkdayObjectID]
							, [DimProject.Commission]
							, [DimProject.DealType]
							, [DimSegment.SegmentName]
							, [DimAccount.AccountType]
							, [DimAccount.AccountName]
							, [DimPractice.PracticeName]
							, [WorkdayURL]
							, [Project Owner]
							, [EIC]
							, FinancialType

				/******/
				UNION ALL
				/******/
				SELECT " & TodayVar2 & " [AsOfDate]
				--select GETDATE() [AsOfDate]
							, ProjectKey
							, AccountKey
							, SegmentKey
							, SalesPersonKey
							, ClientDirectorPersonKey
							, PracticeKey
							, SalesStage
							, ProjectStatus
							, OpportunityKey
							, WinProbability
							, AccountType
							, AssignedOffice
							, SalesPerson
							, [DimPerson(ClientDirectorPersonKey).FirstName]
							, [DimPerson(ClientDirectorPersonKey).LastName]
							, [DimProject.ProjectType]
							, [DimProject.ProjectNumber]
							, [DimProject.ProjectName]
							, [DimProject.BusinessType]
							, [DimProject.ProjectStartDate]
							, [DimProject.ProjectEndDate]
							, [DimProject.WorkdayObjectID]
							, [DimProject.Commission]
							, [DimProject.DealType]
							, [DimSegment.SegmentName]
							, [DimAccount.AccountType]
							, [DimAccount.AccountName]
							, [DimPractice.PracticeName]
							, [WorkdayURL]
							, [Project Owner]
							, [EIC]
							, FinancialType
							, SUM([Jan-26]) [Jan-26]
							, SUM([Feb-26]) [Feb-26]
							, SUM([Mar-26]) [Mar-26]
							, SUM([Apr-26]) [Apr-26]
							, SUM([May-26]) [May-26]
							, SUM([Jun-26]) [Jun-26]
							, SUM([Jul-26]) [Jul-26]
							, SUM([Aug-26]) [Aug-26]
							, SUM([Sep-26]) [Sep-26]
							, SUM([Oct-26]) [Oct-26]
							, SUM([Nov-26]) [Nov-26]
							, SUM([Dec-26]) [Dec-26]
							, SUM([Jan-27]) [Jan-27]
							, SUM([Feb-27]) [Feb-27]
							, SUM([Mar-27]) [Mar-27]
							, SUM([Apr-27]) [Apr-27]
							, SUM([May-27]) [May-27]
							, SUM([Jun-27]) [Jun-27]
							, SUM([Jul-27]) [Jul-27]
							, SUM([Aug-27]) [Aug-27]
							, SUM([Sep-27]) [Sep-27]
							, SUM([Oct-27]) [Oct-27]
							, SUM([Nov-27]) [Nov-27]
							, SUM([Dec-27]) [Dec-27] 
						FROM (

												SELECT F.ProjectKey
												, F.AccountKey
												, F.SegmentKey
												, F.SalesPersonKey
												, F.ClientDirectorPersonKey
												, F.PracticeKey
												, F.SalesStage
												, F.ProjectStatus
												, F.OpportunityKey
												, F.WinProbability
												, F.AccountType
												, F.AssignedOffice
												, F.SalesPerson
												, CDP.FirstName [DimPerson(ClientDirectorPersonKey).FirstName]
												, CDP.LastName [DimPerson(ClientDirectorPersonKey).LastName]
												, PR.ProjectType [DimProject.ProjectType]
												, PR.ProjectNumber [DimProject.ProjectNumber]
												, O.OpportunityName [DimProject.ProjectName]
												, O.DealType [DimProject.BusinessType]
												, O.StartDate [DimProject.ProjectStartDate]
												, O.EndDate [DimProject.ProjectEndDate]
												, PR.WorkdayObjectID [DimProject.WorkdayObjectID]
												, PR.Commission [DimProject.Commission]
												, PR.DealType [DimProject.DealType]
												, S.SegmentName [DimSegment.SegmentName]
												, A.AccountType [DimAccount.AccountType]
												, A.AccountName [DimAccount.AccountName]
												, PRAC.PracticeName [DimPractice.PracticeName]
												, 'https://wd12.myworkday.com/logic/d/inst/deeplink/' + PR.WorkdayObjectID + '.htmld' [WorkdayURL]
												, CDP.FirstName + ' ' + CDP.LastName [Project Owner]
												, DEIC.FirstName + ' ' + DEIC.LastName [EIC]
												, 'Revenue' FinancialType
												, CASE WHEN HC.[MonthStart] = 'Jan  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Jan-26]
												, CASE WHEN HC.[MonthStart] = 'Feb  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Feb-26]
												, CASE WHEN HC.[MonthStart] = 'Mar  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Mar-26]
												, CASE WHEN HC.[MonthStart] = 'Apr  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Apr-26]
												, CASE WHEN HC.[MonthStart] = 'May  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [May-26]
												, CASE WHEN HC.[MonthStart] = 'Jun  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Jun-26]
												, CASE WHEN HC.[MonthStart] = 'Jul  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Jul-26]
												, CASE WHEN HC.[MonthStart] = 'Aug  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Aug-26]
												, CASE WHEN HC.[MonthStart] = 'Sep  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Sep-26]
												, CASE WHEN HC.[MonthStart] = 'Oct  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Oct-26]
												, CASE WHEN HC.[MonthStart] = 'Nov  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Nov-26]
												, CASE WHEN HC.[MonthStart] = 'Dec  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Dec-26]
												, CASE WHEN HC.[MonthStart] = 'Jan  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Jan-27]
												, CASE WHEN HC.[MonthStart] = 'Feb  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Feb-27]
												, CASE WHEN HC.[MonthStart] = 'Mar  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Mar-27]
												, CASE WHEN HC.[MonthStart] = 'Apr  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Apr-27]
												, CASE WHEN HC.[MonthStart] = 'May  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [May-27]
												, CASE WHEN HC.[MonthStart] = 'Jun  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Jun-27]
												, CASE WHEN HC.[MonthStart] = 'Jul  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Jul-27]
												, CASE WHEN HC.[MonthStart] = 'Aug  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Aug-27]
												, CASE WHEN HC.[MonthStart] = 'Sep  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Sep-27]
												, CASE WHEN HC.[MonthStart] = 'Oct  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Oct-27]
												, CASE WHEN HC.[MonthStart] = 'Nov  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Nov-27]
												, CASE WHEN HC.[MonthStart] = 'Dec  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Dec-27]
						FROM dbo.FactAttainmentHighConfidence " & SystemTimeVar2 & " HC
						JOIN dbo.FactProjectSummary " & SystemTimeVar2 & " F ON HC.OpportunityKey = F.OpportunityKey AND HC.MonthStart = F.MonthStart AND HC.FinancialType = F.FinancialType
						--FROM dbo.FactAttainmentHighConfidence HC
						--JOIN dbo.FactProjectSummary F ON HC.OpportunityKey = F.OpportunityKey AND HC.MonthStart = F.MonthStart AND HC.FinancialType = F.FinancialType
						JOIN dbo.DimPerson CDP ON F.ClientDirectorPersonKey = CDP.PersonKey AND F.MonthStart BETWEEN '20250101' AND '20281231'
						JOIN dbo.DimPerson EIC ON F.EICPersonKey = EIC.PersonKey AND F.MonthStart BETWEEN '20250101' AND '20281231'
						JOIN dbo.DimProject PR ON F.ProjectKey = PR.ProjectKey
						JOIN dbo.DimSegment S ON F.SegmentKey = S.SegmentKey --AND S.SegmentName NOT IN ('National Communication & High Tech','Unknown')
						JOIN dbo.DimAccount A ON F.AccountKey = A.AccountKey
						JOIN dbo.DimPractice PRAC ON F.PracticeKey = PRAC.PracticeKey
						JOIN dbo.DimOpportunity O ON F.OpportunityKey = O.OpportunityKey 
						OUTER APPLY (SELECT TOP 1 OPPTY.* FROM dbo.FactOpportunity OPPTY WHERE O.OpportunityKey = OPPTY.OpportunityKey AND OPPTY.ProjectKey = F.ProjectKey ORDER BY OPPTY.ValidFrom DESC) FO
						LEFT JOIN dbo.DimPerson DEIC ON FO.SalesExecutiveInChargePersonKey = DEIC.PersonKey
						WHERE HC.FinancialType = 'Revenue' AND HC.MonthStart BETWEEN '20260101' AND '20281231'
							AND ((F.ProjectStatus = 'CRM Weighted' AND O.YearEndTargetingOnly != 'Yes' AND O.UnknownRevenue != 'Yes') OR F.ProjectStatus != 'cRM weighted')
						GROUP BY F.ProjectKey
												, F.AccountKey
												, F.SegmentKey
												, F.SalesPersonKey
												, F.ClientDirectorPersonKey
												, F.PracticeKey
												, F.SalesStage
												, F.ProjectStatus
												, F.OpportunityKey
												, F.WinProbability
												, F.AccountType
												, F.AssignedOffice
												, F.SalesPerson
												, CDP.FirstName 
												, CDP.LastName 
												, PR.ProjectType 
												, PR.ProjectNumber 
												, O.OpportunityName 
												, O.DealType 
												, O.StartDate 
												, O.EndDate 
												, PR.WorkdayObjectID 
												, PR.Commission 
												, PR.DealType 
												, S.SegmentName 
												, A.AccountType 
												, A.AccountName 
												, PRAC.PracticeName 
												, 'https://wd12.myworkday.com/logic/d/inst/deeplink/' + PR.WorkdayObjectID + '.htmld' 
												, CDP.FirstName + ' ' + CDP.LastName 
												, DEIC.FirstName + ' ' + DEIC.LastName 
												, HC.MonthStart




				) D 

				GROUP BY ProjectKey
							, AccountKey
							, SegmentKey
							, SalesPersonKey
							, ClientDirectorPersonKey
							, PracticeKey
							, SalesStage
							, ProjectStatus
							, OpportunityKey
							, WinProbability
							, AccountType
							, AssignedOffice
							, SalesPerson
							, [DimPerson(ClientDirectorPersonKey).FirstName]
							, [DimPerson(ClientDirectorPersonKey).LastName]
							, [DimProject.ProjectType]
							, [DimProject.ProjectNumber]
							, [DimProject.ProjectName]
							, [DimProject.BusinessType]
							, [DimProject.ProjectStartDate]
							, [DimProject.ProjectEndDate]
							, [DimProject.WorkdayObjectID]
							, [DimProject.Commission]
							, [DimProject.DealType]
							, [DimSegment.SegmentName]
							, [DimAccount.AccountType]
							, [DimAccount.AccountName]
							, [DimPractice.PracticeName]
							, [WorkdayURL]
							, [Project Owner]
							, [EIC]
							, FinancialType

				/*******/
				UNION ALL
				/*******/

				SELECT " & TodayVar2 & " [AsOfDate]
				--select GETDATE() [AsOfDate]
							, ProjectKey
							, AccountKey
							, SegmentKey
							, SalesPersonKey
							, ClientDirectorPersonKey
							, PracticeKey
							, SalesStage
							, ProjectStatus
							, OpportunityKey
							, WinProbability
							, AccountType
							, AssignedOffice
							, SalesPerson
							, [DimPerson(ClientDirectorPersonKey).FirstName]
							, [DimPerson(ClientDirectorPersonKey).LastName]
							, [DimProject.ProjectType]
							, [DimProject.ProjectNumber]
							, [DimProject.ProjectName]
							, [DimProject.BusinessType]
							, [DimProject.ProjectStartDate]
							, [DimProject.ProjectEndDate]
							, [DimProject.WorkdayObjectID]
							, [DimProject.Commission]
							, [DimProject.DealType]
							, [DimSegment.SegmentName]
							, [DimAccount.AccountType]
							, [DimAccount.AccountName]
							, [DimPractice.PracticeName]
							, [WorkdayURL]
							, [Project Owner]
							, [EIC]
							, FinancialType
							, SUM([Jan-26]) [Jan-26]
							, SUM([Feb-26]) [Feb-26]
							, SUM([Mar-26]) [Mar-26]
							, SUM([Apr-26]) [Apr-26]
							, SUM([May-26]) [May-26]
							, SUM([Jun-26]) [Jun-26]
							, SUM([Jul-26]) [Jul-26]
							, SUM([Aug-26]) [Aug-26]
							, SUM([Sep-26]) [Sep-26]
							, SUM([Oct-26]) [Oct-26]
							, SUM([Nov-26]) [Nov-26]
							, SUM([Dec-26]) [Dec-26]
							, SUM([Jan-27]) [Jan-27]
							, SUM([Feb-27]) [Feb-27]
							, SUM([Mar-27]) [Mar-27]
							, SUM([Apr-27]) [Apr-27]
							, SUM([May-27]) [May-27]
							, SUM([Jun-27]) [Jun-27]
							, SUM([Jul-27]) [Jul-27]
							, SUM([Aug-27]) [Aug-27]
							, SUM([Sep-27]) [Sep-27]
							, SUM([Oct-27]) [Oct-27]
							, SUM([Nov-27]) [Nov-27]
							, SUM([Dec-27]) [Dec-27] 
						FROM (

												SELECT F.ProjectKey
												, F.AccountKey
												, F.SegmentKey
												, F.SalesPersonKey
												, F.ClientDirectorPersonKey
												, F.PracticeKey
												, F.SalesStage
												, F.ProjectStatus
												, F.OpportunityKey
												, F.WinProbability
												, F.AccountType
												, F.AssignedOffice
												, F.SalesPerson
												, CDP.FirstName [DimPerson(ClientDirectorPersonKey).FirstName]
												, CDP.LastName [DimPerson(ClientDirectorPersonKey).LastName]
												, PR.ProjectType [DimProject.ProjectType]
												, PR.ProjectNumber [DimProject.ProjectNumber]
												, O.OpportunityName [DimProject.ProjectName]
												, O.DealType [DimProject.BusinessType]
												, O.StartDate [DimProject.ProjectStartDate]
												, O.EndDate [DimProject.ProjectEndDate]
												, PR.WorkdayObjectID [DimProject.WorkdayObjectID]
												, PR.Commission [DimProject.Commission]
												, PR.DealType [DimProject.DealType]
												, S.SegmentName [DimSegment.SegmentName]
												, A.AccountType [DimAccount.AccountType]
												, A.AccountName [DimAccount.AccountName]
												, PRAC.PracticeName [DimPractice.PracticeName]
												, 'https://wd12.myworkday.com/logic/d/inst/deeplink/' + PR.WorkdayObjectID + '.htmld' [WorkdayURL]
												, CDP.FirstName + ' ' + CDP.LastName [Project Owner]
												, DEIC.FirstName + ' ' + DEIC.LastName [EIC]
												, 'Margin' FinancialType
												, CASE WHEN HC.[MonthStart] = 'Jan  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Jan-26]
												, CASE WHEN HC.[MonthStart] = 'Feb  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Feb-26]
												, CASE WHEN HC.[MonthStart] = 'Mar  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Mar-26]
												, CASE WHEN HC.[MonthStart] = 'Apr  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Apr-26]
												, CASE WHEN HC.[MonthStart] = 'May  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [May-26]
												, CASE WHEN HC.[MonthStart] = 'Jun  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Jun-26]
												, CASE WHEN HC.[MonthStart] = 'Jul  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Jul-26]
												, CASE WHEN HC.[MonthStart] = 'Aug  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Aug-26]
												, CASE WHEN HC.[MonthStart] = 'Sep  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Sep-26]
												, CASE WHEN HC.[MonthStart] = 'Oct  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Oct-26]
												, CASE WHEN HC.[MonthStart] = 'Nov  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Nov-26]
												, CASE WHEN HC.[MonthStart] = 'Dec  1 2026 12:00AM' THEN SUM(HC.DollarAmount) END [Dec-26]
												, CASE WHEN HC.[MonthStart] = 'Jan  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Jan-27]
												, CASE WHEN HC.[MonthStart] = 'Feb  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Feb-27]
												, CASE WHEN HC.[MonthStart] = 'Mar  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Mar-27]
												, CASE WHEN HC.[MonthStart] = 'Apr  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Apr-27]
												, CASE WHEN HC.[MonthStart] = 'May  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [May-27]
												, CASE WHEN HC.[MonthStart] = 'Jun  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Jun-27]
												, CASE WHEN HC.[MonthStart] = 'Jul  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Jul-27]
												, CASE WHEN HC.[MonthStart] = 'Aug  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Aug-27]
												, CASE WHEN HC.[MonthStart] = 'Sep  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Sep-27]
												, CASE WHEN HC.[MonthStart] = 'Oct  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Oct-27]
												, CASE WHEN HC.[MonthStart] = 'Nov  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Nov-27]
												, CASE WHEN HC.[MonthStart] = 'Dec  1 2027 12:00AM' THEN SUM(HC.DollarAmount) END [Dec-27]
						FROM dbo.FactAttainmentHighConfidence " & SystemTimeVar2 & " HC
						JOIN dbo.FactProjectSummary " & SystemTimeVar2 & " F ON HC.OpportunityKey = F.OpportunityKey AND HC.MonthStart = F.MonthStart AND HC.FinancialType = F.FinancialType
						--FROM dbo.FactAttainmentHighConfidence HC
						--JOIN dbo.FactProjectSummary F ON HC.OpportunityKey = F.OpportunityKey AND HC.MonthStart = F.MonthStart AND HC.FinancialType = F.FinancialType
						JOIN dbo.DimPerson CDP ON F.ClientDirectorPersonKey = CDP.PersonKey AND F.MonthStart BETWEEN '20250101' AND '20281231'
						JOIN dbo.DimPerson EIC ON F.EICPersonKey = EIC.PersonKey AND F.MonthStart BETWEEN '20250101' AND '20281231'
						JOIN dbo.DimProject PR ON F.ProjectKey = PR.ProjectKey
						JOIN dbo.DimSegment S ON F.SegmentKey = S.SegmentKey --AND S.SegmentName NOT IN ('National Communication & High Tech','Unknown')
						JOIN dbo.DimAccount A ON F.AccountKey = A.AccountKey
						JOIN dbo.DimPractice PRAC ON F.PracticeKey = PRAC.PracticeKey
						JOIN dbo.DimOpportunity O ON F.OpportunityKey = O.OpportunityKey 
						OUTER APPLY (SELECT TOP 1 OPPTY.* FROM dbo.FactOpportunity OPPTY WHERE O.OpportunityKey = OPPTY.OpportunityKey AND OPPTY.ProjectKey = F.ProjectKey ORDER BY OPPTY.ValidFrom DESC) FO
						LEFT JOIN dbo.DimPerson DEIC ON FO.SalesExecutiveInChargePersonKey = DEIC.PersonKey
						WHERE HC.FinancialType = 'Margin' AND HC.MonthStart BETWEEN '20260101' AND '20281231'
							AND ((F.ProjectStatus = 'CRM Weighted' AND O.YearEndTargetingOnly != 'Yes' AND O.UnknownRevenue != 'Yes') OR F.ProjectStatus != 'cRM weighted')
						GROUP BY F.ProjectKey
												, F.AccountKey
												, F.SegmentKey
												, F.SalesPersonKey
												, F.ClientDirectorPersonKey
												, F.PracticeKey
												, F.SalesStage
												, F.ProjectStatus
												, F.OpportunityKey
												, F.WinProbability
												, F.AccountType
												, F.AssignedOffice
												, F.SalesPerson
												, CDP.FirstName 
												, CDP.LastName 
												, PR.ProjectType 
												, PR.ProjectNumber 
												, O.OpportunityName 
												, O.DealType 
												, O.StartDate 
												, O.EndDate 
												, PR.WorkdayObjectID 
												, PR.Commission 
												, PR.DealType 
												, S.SegmentName 
												, A.AccountType 
												, A.AccountName 
												, PRAC.PracticeName 
												, 'https://wd12.myworkday.com/logic/d/inst/deeplink/' + PR.WorkdayObjectID + '.htmld' 
												, CDP.FirstName + ' ' + CDP.LastName 
												, DEIC.FirstName + ' ' + DEIC.LastName 
												, HC.MonthStart




				) D 

				GROUP BY ProjectKey
							, AccountKey
							, SegmentKey
							, SalesPersonKey
							, ClientDirectorPersonKey
							, PracticeKey
							, SalesStage
							, ProjectStatus
							, OpportunityKey
							, WinProbability
							, AccountType
							, AssignedOffice
							, SalesPerson
							, [DimPerson(ClientDirectorPersonKey).FirstName]
							, [DimPerson(ClientDirectorPersonKey).LastName]
							, [DimProject.ProjectType]
							, [DimProject.ProjectNumber]
							, [DimProject.ProjectName]
							, [DimProject.BusinessType]
							, [DimProject.ProjectStartDate]
							, [DimProject.ProjectEndDate]
							, [DimProject.WorkdayObjectID]
							, [DimProject.Commission]
							, [DimProject.DealType]
							, [DimSegment.SegmentName]
							, [DimAccount.AccountType]
							, [DimAccount.AccountName]
							, [DimPractice.PracticeName]
							, [WorkdayURL]
							, [Project Owner]
							, [EIC]
							, FinancialType

) DHC

) OUTERDHC
"])
in
    Source