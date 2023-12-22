        <cfquery datasource="#request.dsn#" name="qCatalog">
        	select * from tblCatalog 
            order by target;
        </cfquery>

        <cffile action="write"
        	file="c:\server\Inetpub\neuromab\temp\NeuroMab-UCDavis.csv"
            output="TargetType,Target,AccessionNum,Clone,HumanGeneName,DataSheetFileName,IsoType,ValidationT,ValidationBrIB,ValidationBrIHC,ValidationKO,RRIDAB"
            addnewline="yes">
		<cfoutput>
		<cfloop query="qCatalog">
        <cffile action="append"
        	file="c:\server\Inetpub\neuromab\temp\NeuroMab-UCDavis.csv"
            output="""#TRIM(TargetType)#"",""#TRIM(Target)#"",""#TRIM(AccessionNum)#"",""#TRIM(Clone)#"",""#TRIM(HumanGeneName)#"",""#TRIM(DataSheetFileName)#"",""#TRIM(IgIsoType)#"",""#TRIM(ValidationT)#"",""#TRIM(ValidationBrIB)#"",""#TRIM(ValidationBrIHC)#"",""#TRIM(ValidationKO)#"",""#TRIM(RRIDAB)#"""
            addnewline="yes">
        </cfloop>
		</cfoutput>
 <cflocation url="/temp/NeuroMab-UCDavis.csv">