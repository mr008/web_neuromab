        <cfquery datasource="#request.dsn#" name="qSequences">
SELECT tblCatalog.Target, tblSequences.SequenceID, tblSequences.Clone, tblSequences.VLS, tblSequences.VHS
FROM tblSequences INNER JOIN tblCatalog ON tblSequences.Clone = tblCatalog.Clone;
        </cfquery>

        <cffile action="write"
        	file="c:\server\Inetpub\neuromab\temp\NeuroMab-UCDavis-Sequences.csv"
            output="Target,Clone,VLS,VLH"
            addnewline="yes">
		<cfoutput>
		<cfloop query="qSequences">
        <cffile action="append"
        	file="c:\server\Inetpub\neuromab\temp\NeuroMab-UCDavis-Sequences.csv"
            output="""#TRIM(Target)#"",""#TRIM(Clone)#"",""#TRIM(VLS)#"",""#TRIM(VHS)#"""
            addnewline="yes">
        </cfloop>
		</cfoutput>
 <cflocation url="/temp/NeuroMab-UCDavis-Sequences.csv">