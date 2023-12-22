        <cfquery datasource="#request.dsn#" name="qSuggestions">
        	select * from tblSuggestion 
            order by SuggestionDate;
        </cfquery>

        <cffile action="write"
        	file="c:\server\Inetpub\neuromab\temp\NeuroMab-UCDavis-Suggestions.csv"
            output="SuggestionDate,username,Justification,AvailabilitySuitability,ReagentList,BrainExpression,TargetName,TargetGeneName,Status"
            addnewline="yes">
		<cfoutput>
		<cfloop query="qSuggestions">
        <cffile action="append"
        	file="c:\server\Inetpub\neuromab\temp\NeuroMab-UCDavis-Suggestions.csv"
            output="""#TRIM(DateFormat(SuggestionDate,"YYYY-MM-DD"))#"",""#TRIM(username)#"",""'#TRIM(Justification)#'"",""#TRIM(AvailabilitySuitability)#"",""#TRIM(ReagentList)#"",""#TRIM(BrainExpression)#"",""#TRIM(TargetName)#"",""#TRIM(TargetGeneName)#"",""#TRIM(Status)#"""
            addnewline="yes">
        </cfloop>
		</cfoutput>
 <cflocation url="/temp/NeuroMab-UCDavis-Suggestions.csv">