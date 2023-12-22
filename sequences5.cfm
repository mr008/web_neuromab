
<!--- page header --->
<cfinclude template="include/header.cfm">

        <cf_contentSection sectionName="sequences">
        	
        </cf_contentSection>        


        <cfparam name="form.keywords" default="">
        
        <cfquery datasource="#request.dsn#" name="qSequences">
SELECT tblCatalog.Target, tblSequences.SequenceID, tblSequences.Clone, tblSequences.VLS, tblSequences.VHS
FROM tblSequences INNER JOIN tblCatalog ON tblSequences.Clone = tblCatalog.Clone;
        </cfquery>
        <!--- 
        <cfdump var="#qCatalog#"/> --->
        
        <div style="height:25px;"> </div>
        <table width="100%">
            <cfif session.editMode and session.isAdmin>
				<tr>
                	<td class="catalogPreText"> [ + <a href="sequenceEdit.cfm?cid=0">Add new sequence entry</a> ] </td>
                </tr>
			</cfif>
<!--- 
           <tr>
                <td class="catalogPreText">
                    <p class="catalogPreText">Click on a column header to re-sort table</p>
                </td>
            </tr>
--->
<style type="text/css">
.x-grid3-cell-inner { white-space:normal;} 

</style>
            <tr>
            <cfform id="Sequences">
            	<td>
        
                    <cfgrid name="Sequences" format="html">
                    	<cfif session.editMode and session.isAdmin>
							<cfgridcolumn name="Edit" header="Edit" width="50">
                            <cfgridcolumn name="Delete" header="Delete" width="50">
						</cfif>
                        <cfgridcolumn name="Target" header="Target" width="100">
                        <cfgridcolumn name="Clone" header="Clone" width="100">
                        <cfgridcolumn name="VLS" header="Variable Light Sequence" width="300">
                        <cfgridcolumn name="VHS" header="Variable Heavy Sequence" width="300">
                        <cfloop query="qSequences">
                        	
                            
                        	<cfset editVal = '<a href="sequenceEdit.cfm?action=edit&cid=#qSequences.SequenceID#">Edit</a>'>
                            <cfset deleteVal = '<a href="sequenceEdit.cfm?action=delete&cid=#qSequences.SequenceID#">Delete</a>'>

                            <cfif session.editMode and session.isAdmin>
                            	<cfgridrow data="#replace(editVal, ',', '&##44;', 'ALL')#,#replace(deleteVal, ',', '&##44;', 'ALL')#,#replace(qSequences.Target, ',', '&##44;', 'ALL')#,#replace(qSequences.clone, ',', '&##44;', 'ALL')# ,#replace(qSequences.VLS, ',', '&##44;', 'ALL')# ,#replace(qSequences.VHS, ',', '&##44;', 'ALL')#">
							<cfelse>
                            	<cfgridrow data=",#replace(qSequences.Target, ',', '&##44;', 'ALL')#,#replace(qSequences.clone, ',', '&##44;', 'ALL')# ,#replace(qSequences.VLS, ',', '&##44;', 'ALL')# ,#replace(qSequences.VHS, ',', '&##44;', 'ALL')# ">
							</cfif>
                        </cfloop>
                    </cfgrid>
        
        		</td>
            </tr>
        </cfform>
        </table>
                
<!--- page header --->
<cfinclude template="include/footer.cfm">
        