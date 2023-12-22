<cfparam name="attributes.title" default="Default Title">
<cfparam name="attributes.id" default="0">
<cfparam name="session.editing" default="0">

<cfif thisTag.executionMode eq 'End'>

	<cfset oldContent = thisTag.generatedContent>
    <cfset thisTag.generatedContent = ''>

	<cfoutput>
    <cfif session.editMode and session.editing eq attributes.id>
    	
        <cfsavecontent variable="newContent">
            
            <div style="height:25px;"> </div>
            <table width="100%">
            	<cfform action="contentHandler.cfm?action=editContent&cid=#attributes.id#" method="post">
                <tr>
                    <td class="contentHeader">
                        <input type="text" name="title" value="#attributes.title#" style="width:100%" />
                    </td>
                </tr>
                <tr>
                    <td class="translucentbkg">
                        <div class="opaquetext">
                        	<!--- <cftextarea richtext=true name="content" toolbar="Basic"></cftextarea> --->
                            <cftextarea richtext="true" name="content" style="width:100%; height:300px;" height="400">#oldContent#</cftextarea> 
                            <input type="submit" value="save this content block changes"/>
                        </div>
                    </td>
                </tr>
                </cfform>
                <tr>
                	<form action="contentHandler.cfm?action=deleteContent&cid=#attributes.id#" method="post">
                	<td class="translucentbkg"><div class="opaquetext"><input type="submit" value="delete this content block" style="color:##990000" /></div>
                    </td>
                    </form>
                </tr>
            </table>
            
        </cfsavecontent>
    <cfelse>
    	<cfsavecontent variable="newContent">
            
            <div style="height:25px;"> </div>
            <table width="100%">
                <tr>
                    <td class="contentHeader">
                        #attributes.title#
                        <cfif session.editMode>
							<a href="contentHandler.cfm?action=setEdit&cid=#attributes.id#">[ edit ]</a>
						</cfif>
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

    </cfif>
	</cfoutput>
    
    

	<cfset thisTag.generatedContent = newContent>
<cfelse>

	<cfparam name="session.editmode" default="0">
    
</cfif>