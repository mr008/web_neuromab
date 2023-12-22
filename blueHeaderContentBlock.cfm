<cfparam name="attributes.title" default="Default Title">
<cfif thisTag.executionMode eq 'End'>

	<cfset oldContent = thisTag.generatedContent>
    <cfset thisTag.generatedContent = ''>

	<cfoutput>
	<cfsavecontent variable="newContent">
    	
        <div style="height:25px;"> </div>
        <table width="100%">
        	<tr>
            	<td class="contentHeader">
                	#attributes.title#
                </td>
            </tr>
            <tr>
            	<td class="translucentbkg">
                    <div class="opaquetext">
                    
                    #oldContent#
                        
                    </div>
                </td>
            </tr>
        </table>
        
    </cfsavecontent>
    </cfoutput>

	<cfset thisTag.generatedContent = newContent>

</cfif>