        <cfquery datasource="#request.dsn#" name="qPublications">
        	select * from tblPublications 
            order by PublicationYear;
        </cfquery>

        <cffile action="write"
        	file="c:\server\Inetpub\neuromab\temp\publications.csv"
            output="PublicationYear,PublicationClone,PublicationTarget,PublicationCitation,PublicationPubmed"
            addnewline="yes">
		<cfoutput>
		<cfloop query="qPublications">
        <cffile action="append"
        	file="c:\server\Inetpub\neuromab\temp\publications.csv"
            output="""#TRIM(PublicationYear)#"",""#TRIM(PublicationClone)#"",""#TRIM(PublicationTarget)#"",""#TRIM(PublicationCitation)#"",""#TRIM(PublicationPubmed)#""" addnewline="yes">
        </cfloop>
		</cfoutput>
 <cflocation url="/temp/publications.csv">