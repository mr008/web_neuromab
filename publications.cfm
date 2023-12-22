
<!--- page header --->
<cfinclude template="include/header.cfm">
        <cfparam name="form.keywords" default="">
        
        <cfquery datasource="#request.dsn#" name="qPublications">
        	select * from tblPublications
            <cfif len(trim(form.keywords))>
				where 
                	PublicationYear like '%#form.keywords#%' 
                    or
                    PublicationClone like '%#form.keywords#%' 
                    or
                    PublicationTarget like '%#form.keywords#%' 
                    or
                    PublicationCitation like '%#form.keywords#%' 
			</cfif>
            order by PublicationYear DESC, PublicationCitation ASC;
        </cfquery>

        <cf_contentSection sectionName="publications">
        	
        </cf_contentSection>        
        
        <!--- 
        <cfdump var="#qPublications#"/> --->
        
        <div style="height:25px;"> </div>
        <table width="100%">
            <cfif session.editMode and session.isAdmin>
				<tr>
                	<td class="catalogPreText"> [ + <a href="publicationsEdit.cfm?cid=0">Add new Publication entry</a> ] </td>
                </tr>
			</cfif>
            <!---
            <tr>
                <td class="catalogPreText">
                    Click on a column header to re-sort table
                </td>
            </tr>
			--->
            <tr>
            <cfform name="PubGrid" id="PubGridID">
            <style>
            #PubGridID
			.x-grid-row td {white-space:normal;}
            </style>
            	<td>
        
                    <cfgrid name="publications" gridlines="yes" enabled="yes" visible="yes" format="html" autowidth="true">
                    	<cfif session.editMode and session.isAdmin>
							<cfgridcolumn name="Edit" header="Edit" width="50">
                            <cfgridcolumn name="Delete" header="Delete" width="50">
						</cfif>
                        <cfgridcolumn name="PublicationYear" header="Year" width="50">
                        <cfgridcolumn name="PublicationClone" header="Clone" width="100">
                        <cfgridcolumn name="PublicationTarget" header="Target" width="100">
                        <cfgridcolumn name="PublicationPubmed" header="PubMed" width="70">
                       <cfgridcolumn name="PublicationCitation" header="Publication" width="400">
                        <cfloop query="qPublications">
                        	
                            
                        	<cfset editVal = '<a href="publicationsEdit.cfm?action=edit&pid=#qPublications.PublicationID#">Edit</a>'>
                            <cfset deleteVal = '<a href="publicationsEdit.cfm?action=delete&pid=#qPublications.PublicationID#">Delete</a>'>
                            <cfset PubmedVal = '<a href="http://www.ncbi.nlm.nih.gov/pubmed/#qPublications.PublicationPubmed#" target="_blank">#qPublications.PublicationPubmed#</a>'>
<!---
                            <cfset dataSheetVal = '<a target target="_blank" href="#qCatalog.DataSheetRef#">#qCatalog.DataSheetName#</a>'>
--->
                            <cfif session.editMode and session.isAdmin>
                            	<cfgridrow data="#replace(editVal, ',', '&##44;', 'ALL')#,#replace(deleteVal, ',', '&##44;', 'ALL')#,#replace(qPublications.PublicationYear, ',', '&##44;', 'ALL')# ,#replace(qPublications.PublicationClone, ',', '&##44;', 'ALL')# ,#replace(qPublications.PublicationTarget, ',', '&##44;', 'ALL')# ,#replace(PubmedVal, ',', '&##44;', 'ALL')# ,#replace(qPublications.PublicationCitation, ',', '&##44;', 'ALL')# ">
							<cfelse>
                            	<cfgridrow data="#replace(qPublications.PublicationYear, ',', '&##44;', 'ALL')# ,#replace(qPublications.PublicationClone, ',', '&##44;', 'ALL')# ,#replace(qPublications.PublicationTarget, ',', '&##44;', 'ALL')# ,#replace(PubmedVal, ',', '&##44;', 'ALL')# ,#replace(qPublications.PublicationCitation, ',', '&##44;', 'ALL')# ">
							</cfif>
                        </cfloop>
                    </cfgrid>
        
        		</td>
            </tr>
        </cfform>
        </table>
                
<!--- page header --->
<cfinclude template="include/footer.cfm">
        