<cfparam name="attributes.title" default="Default Title">
<cfparam name="session.editMode" default="0">
<cfparam name="attributes.sectionName" default="#cgi.SCRIPT_NAME#">
    
<cfif thisTag.executionMode eq 'End'>

	<cfset oldContent = thisTag.generatedContent>
    <cfset thisTag.generatedContent = ''>

	<cfoutput>
    <cfif session.editMode>
        <cfsavecontent variable="newContent">
            
                <a href="contentHandler.cfm?action=addContentBlock&sectionName=#attributes.sectionName#">[ + add content block ]</a>
            
            
            <cfquery datasource="#request.dsn#" name="qContentBlocks">
            	select * from [content] where contentSection = '#attributes.sectionName#'
            </cfquery>
            <cfloop query="qContentBlocks">
                <cf_contentBlock title="#qContentBlocks.contentName#" id="#qContentBlocks.contentId#">#qContentBlocks.content#</cf_contentBlock>
            </cfloop>
            
            #oldContent#
                        
        </cfsavecontent>
    <cfelse>
    	<cfsavecontent variable="newContent">            
            <cfquery datasource="#request.dsn#" name="qContentBlocks">
                select * from content where contentSection = '#attributes.sectionName#'
            </cfquery>
            <cfloop query="qContentBlocks">
                <cf_contentBlock title="#qContentBlocks.contentName#" id="#qContentBlocks.contentId#">#qContentBlocks.content#</cf_contentBlock>
            </cfloop>
        </cfsavecontent>
    </cfif>
    </cfoutput>

	<cfset thisTag.generatedContent = newContent>
    
<cfelse>
	

</cfif>