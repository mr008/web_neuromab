        <cfquery datasource="#request.dsn#" name="qArrayTomography">
        	select * from tblArrayTomography 
            order by target;
        </cfquery>

        <cffile action="write"
        	file="c:\server\Inetpub\neuromab\temp\NeuroMab-UCDavis-ArrayTomoGraphy.csv"
            output="Target,Clone,IsoType,MouseLRWhite,MouseLowicryl,HumanLRWhite"
            addnewline="yes">
		<cfoutput>
		<cfloop query="qArrayTomography">
        <cffile action="append"
        	file="c:\server\Inetpub\neuromab\temp\NeuroMab-UCDavis-ArrayTomoGraphy.csv"
            output="""#TRIM(Target)#"",""#TRIM(Clone)#"",""#TRIM(Isotype)#"",""#TRIM(MouseLRWhite)#"",""#TRIM(MouseLowicryl)#"",""#TRIM(HumanLRWhite)#"""
            addnewline="yes">
        </cfloop>
		</cfoutput>
 <cflocation url="/temp/NeuroMab-UCDavis-ArrayTomoGraphy.csv">