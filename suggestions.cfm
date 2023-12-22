
<cfif session.authenticated neq 1>
	<cflocation url="login.cfm?return=suggestions.cfm" addtoken="no">
</cfif>

<cfparam name="url.action" default="view">

<cfif url.action eq 'save'>
	<cfparam name="url.sid" default="0">
	<cfif url.sid>
		<cfquery datasource="#request.dsn#" name="qUpdate">
        	update tblSuggestion set
            	<cfif session.isAdmin>
					username = '#form.username#',
                    status = '#form.status#',
				</cfif>
                justification = '#form.justification#', 
                AvailabilitySuitability = '#form.AvailabilitySuitability#',
                ReagentList = '#form.ReagentList#',
                BrainExpression = '#form.BrainExpression#',
                TargetName = '#form.TargetName#',
                TargetGeneName = '#form.TargetGeneName#'
			where suggestionId = '#url.sid#';
        </cfquery>
    <cfelse>
		<cfquery datasource="#request.dsn#" name="qInsert">
        	INSERT INTO tblSuggestion (username,justification,AvailabilitySuitability,ReagentList,
                BrainExpression,TargetName,TargetGeneName<cfif session.isAdmin>,Status</cfif>)
            VALUES ('#form.username#','#form.justification#','#form.AvailabilitySuitability#','#form.ReagentList#','#form.BrainExpression#','#form.TargetName#','#form.TargetGeneName#'<cfif session.isAdmin>,'#form.Status#'</cfif>);
        </cfquery>
        <cfmail to="#session.email#" from="neuromab@ucdavis.edu" subject="[UCDNeuromab] Suggestion Received" type="html" server="smtp.ucdavis.edu">
<cfprocessingdirective suppresswhitespace="no">
<p>Thank you for suggesting a new Neuromab using our online form. The following suggestion has been received:</p>

<p><strong>Justification:</strong> #form.justification#</p>
<p><strong>Availability/Suitability:</strong> #form.AvailabilitySuitability#</p>
<p><strong>Reagent List:</strong> #form.ReagentList#</p>
<p><strong>Brain Expression:</strong> #form.BrainExpression#</p>
<p><strong>Target Name:</strong> #form.TargetName#</p>
<p><strong>Target Gene Name:</strong> #form.TargetGeneName#</p>
</cfprocessingdirective>
        </cfmail>    	
	</cfif>
    <cflocation url="suggestions.cfm" addtoken="no">
</cfif>

<cfif url.action eq 'delete'>
	<cfparam name="url.sid" default="0">
    <cfquery datasource="#request.dsn#" name="qAccess">
    	select suggestionId from tblSuggestion where suggestionId = #url.sid# and username = '#session.userQuery.username#'
    </cfquery>
    <cfif session.isAdmin OR qAccess.recordCount>
		<cfquery datasource="#request.dsn#" name="qDelete">
        	delete
            from tblSuggestion
            where suggestionId = #url.sid#;
        </cfquery>
	</cfif>
    <cflocation url="suggestions.cfm" addtoken="no">
</cfif>

<cfif url.action eq 'email'>
	<cfparam name="url.sid" default="0">
    <cfquery datasource="#request.dsn#" name="qEdit">
        select * from tblSuggestion where suggestionId = #url.sid# 
    </cfquery>
    <cfoutput>
    <cfmail to="#request.email#" replyto="#request.email#" from="#request.email#" subject="Suggestion Submission" type="html" server="smtp.ucdavis.edu">
    	Reagent List : <br />
        #qEdit.ReagentList#
        <br /><br />

    	Brain Expression : <br />
        #qEdit.BrainExpression#
        <br /><br />
        
        Availability/Suitability : <br />
        #qEdit.AvailabilitySuitability#
        <br /><br />
        
        Justification : <br />
        #qEdit.Justification#
        <br /><br />
        
        Target Name : <br />
        #qEdit.TargetName#
        <br /><br />

        Target Gene Name : <br />
        #qEdit.TargetGeneName#
        <br /><br />

        User Name : <br />
        #qEdit.username#
        <br /><br />
    </cfmail>
    </cfoutput>
    
	<cflocation url="suggestions.cfm" addtoken="no">
</cfif>

<!--- page header --->
<cfinclude template="include/header.cfm">
                

<cfif url.action eq 'view'>
	<cf_contentSection sectionName="suggestions_view"></cf_contentSection> 
    <cfquery datasource="#request.dsn#" name="qSuggestions">
    	select * from tblSuggestion 
        <cfif session.isAdmin neq 1>where username = '#trim(session.userQuery.username)#'</cfif>
        order by SuggestionID DESC
    </cfquery>
    <div style="height:25px;"> </div>
    <table width="100%">
        <tr>
            <td class="catalogPreText"> [ + <a href="suggestions.cfm?action=edit&sid=0">Add new suggestion</a> ] </td>
        </tr>
        <tr>
            <td class="catalogPreText">
                Click on a column header to re-sort the table  <cfif session.isAdmin>[<a href="suggestions-download.cfm" target="_blank">Download CSV</a>]</cfif>
            </td>
        </tr>
        <tr>
        <cfform>
            <td>
    
                <cfgrid name="suggestions" format="html">
                        
                    <cfgridcolumn name="Date" header="Date Submitted" width="150">
                    <cfgridcolumn name="Justification" header="Justification" width="150">
                    <cfgridcolumn name="Availability" header="Availability /<br> Suitability" width="150">
                    <cfgridcolumn name="reagent" header="Reagent List" width="150">
                    <cfgridcolumn name="BrainExpression" header="Brain Expression" width="150">
                    <cfgridcolumn name="TargetName" header="Target Name" width="150">
                    <cfgridcolumn name="TargetGeneName" header="Target Gene Name" width="150">
                    <cfgridcolumn name="status" header="Status" width="80">
                    <cfgridcolumn name="Edit" header="Edit" width="50">
                    <cfgridcolumn name="Delete" header="Delete" width="50">
                    <cfgridcolumn name="Email" header="Submit" width="50">
                    
                    <cfloop query="qSuggestions">
                        <!--- <cfoutput>#replace(qSuggestions.Justification, ',', ',,', 'ALL')#</cfoutput> --->
                        <cfset editVal = '<a href="suggestions.cfm?action=edit&sid=#qSuggestions.SuggestionID#">Edit</a>'>
                        <cfset deleteVal = '<a href="suggestions.cfm?action=delete&sid=#qSuggestions.SuggestionID#">Delete</a>'>
                        <cfset emailVal = '<a href="suggestions.cfm?action=email&sid=#qSuggestions.SuggestionID#">Submit</a>'>
                        
                        <cfgridrow data="#replace(qSuggestions.SuggestionDate, ',', '&##44;', 'ALL')# ,#replace(qSuggestions.Justification, ',', '&##44;', 'ALL')# ,#replace(qSuggestions.AvailabilitySuitability, ',', '&##44;', 'ALL')# ,#replace(qSuggestions.ReagentList, ',', '&##44;', 'ALL')# ,#replace(qSuggestions.BrainExpression, ',', '&##44;', 'ALL')# ,#replace(qSuggestions.TargetName, ',', '&##44;', 'ALL')# ,#replace(qSuggestions.TargetGeneName, ',', '&##44;', 'ALL')# ,#replace(qSuggestions.status, ',', '&##44;', 'ALL')# ,#replace(editVal, ',', '&##44;', 'ALL')#,#replace(deleteVal, ',', '&##44;', 'ALL')#,#replace(emailVal, ',', '&##44;', 'ALL')#">
                                                
                    </cfloop>
                </cfgrid>
    
            </td>
        </tr>
    </cfform>
    </table>
</cfif>    



<cfif url.action eq 'edit'>
	<cfparam name="url.sid" default="0">
    <cfif url.sid>
        <cf_contentSection sectionName="suggestions_edit_top"></cf_contentSection>
    <cfelse>
        <cf_contentSection sectionName="suggestions_new_top"></cf_contentSection>
    </cfif>
	<div style="height:25px;"> </div>
        <table width="100%">
	        <cfoutput>
            <form action="suggestions.cfm?action=save&sid=#url.sid#" method="post">
            </cfoutput>
            <tr>
                <td class="contentHeader">
                    <cfif url.sid>
                    	<cfquery datasource="#request.dsn#" name="qEdit">
                        	select * from tblSuggestion where suggestionId = #url.sid# 
                        </cfquery>
                    	<cfparam name="form.Justification" default="#qEdit.Justification#">
                        <cfparam name="form.AvailabilitySuitability" default="#qEdit.AvailabilitySuitability#">
                        <cfparam name="form.ReagentList" default="#qEdit.ReagentList#">
                        <cfparam name="form.BrainExpression" default="#qEdit.BrainExpression#">
                        <cfparam name="form.TargetName" default="#qEdit.TargetName#">
                        <cfparam name="form.TargetGeneName" default="#qEdit.TargetGeneName#">
                        <cfparam name="form.username" default="#qEdit.username#">
                        <cfparam name="form.status" default="#qEdit.status#">
						Edit Suggestion
                    <cfelse>
                    	<cfparam name="form.Justification" default="">
                        <cfparam name="form.AvailabilitySuitability" default="">
                        <cfparam name="form.ReagentList" default="">
                        <cfparam name="form.BrainExpression" default="">
                        <cfparam name="form.TargetName" default="">
                        <cfparam name="form.TargetGeneName" default="">
                        <cfparam name="form.username" default="#session.userQuery.username#">
                        <cfparam name="form.status" default="">
                    	New Suggestion
					</cfif>
                </td>
            </tr>
            <tr>
                <td class="translucentbkg">
                    <div class="opaquetext">
                    	
                    	<cfoutput>
                    	<table width="100%">
                        	<cfif session.isAdmin>
							<tr>
                            	<td>Username</td>
                                <td width="70%">
                                	<input type="text" name="username" value="#form.username#" style="width:100%;"/>
                                </td>
                            </tr>
                            <cfelse>
                            <input type="hidden" name="username" value="#session.userQuery.username#"/>
							</cfif>
                        	<tr>
                            	<td>Justification</td>
                                <td width="70%">
                                	<textarea name="Justification" style="width:100%; height:100px;">#form.Justification#</textarea>
                                </td>
                            </tr>
                            <tr>
                            	<td>Availability / Suitability</td>
                                <td width="70%">
                                	<textarea name="AvailabilitySuitability" style="width:100%; height:100px;">#form.AvailabilitySuitability#</textarea>
                                </td>
                            </tr>
                            <tr>
                            	<td>Reagent List</td>
                                <td width="70%">
                                	<textarea name="ReagentList" style="width:100%; height:100px;">#form.ReagentList#</textarea>
                                </td>
                            </tr>
                            <tr>
                            	<td>Brain Expression</td>
                                <td width="70%">
                                	<textarea name="BrainExpression" style="width:100%; height:100px;">#form.BrainExpression#</textarea>
                                </td>
                            </tr>
                            <tr>
                            	<td>Target Name</td>
                                <td width="70%">
                                	<textarea name="TargetName" style="width:100%; height:100px;">#form.TargetName#</textarea>
                                </td>
                            </tr>
                            <tr>
                            	<td>Target Gene Name</td>
                                <td width="70%">
                                	<textarea name="TargetGeneName" style="width:100%; height:100px;">#form.TargetGeneName#</textarea>
                                </td>
                            </tr>
                            <cfif session.isAdmin>
							<tr>
                            	<td>Status</td>
                                <td width="70%">
                                	<input type="text" name="Status" value="#form.Status#" style="width:100%;"/>
                                </td>
                            </tr>
							</cfif>
                        </table>
	                    </cfoutput>
                        <input type="submit" value="Save"/>
                    </div>
                </td>
            </tr>
            </form>
        </table> 
        <cfif url.sid>
        	<cf_contentSection sectionName="suggestions_edit_bottom"></cf_contentSection>
		<cfelse>
        	<cf_contentSection sectionName="suggestions_new_bottom"></cf_contentSection>
		</cfif>
        
</cfif>
        

               
<!--- page header --->
<cfinclude template="include/footer.cfm">
        