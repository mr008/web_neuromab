<!--- page header --->
<cfinclude template="include/header.cfm">
        
        
        <cf_contentSection sectionName="arrayTomography">
        	
        </cf_contentSection>        
                
<!--- page header --->
        <cfquery datasource="#request.dsn#" name="qArrayTomography">
        	select * from tblArrayTomography 
            order by target;
        </cfquery>

        <div style="height:25px;"> </div>
        <table width="100%">
            <cfif session.editMode and session.isAdmin>
				<tr>
                	<td class="catalogPreText"> [ + <a href="arrayTomographyEdit.cfm?cid=0">Add new entry</a> ] </td>
                </tr>
			</cfif>
            <tr>
            <cfform id="ArrayTomography">
            	<td>
        
                    <cfgrid name="arraytomography" format="html">
                    	<cfif session.editMode and session.isAdmin>
							<cfgridcolumn name="Edit" header="Edit" width="50">
                            <cfgridcolumn name="Delete" header="Delete" width="50">
						</cfif>
                        <cfgridcolumn name="Target" header="Target" width="200">
                        <cfgridcolumn name="Clone" header="Clone" width="60">
                        <cfgridcolumn name="Isotype" header="Isotype" width="50">
                        <cfgridcolumn name="MouseLRWhite" header="Mouse LRWhite" width="100">
                        <cfgridcolumn name="MouseLowicryl" header="Mouse Lowicryl" width="100">
                        <cfgridcolumn name="HumanLRWhite" header="Human LRWhite" width="100">
                        <cfloop query="qArrayTomography">
                        	
                            
                        	<cfset editVal = '<a href="arrayTomographyEdit.cfm?action=edit&atid=#qArrayTomography.atID#">Edit</a>'>
                            <cfset deleteVal = '<a href="arrayTomographyEdit.cfm?action=delete&atid=#qArrayTomography.atID#">Delete</a>'>
							<cfif trim(MouseLRWhite) EQ 'Pass'>
                            <cfset MouseLRWhiteVal = '<img src="images/pass.png">'>
							<cfelseif trim(MouseLRWhite) EQ "Fail">
                            <cfset MouseLRWhiteVal = '<img src="images/fail.png">'>
                            <cfelseif trim(MouseLRWhite) EQ "ND">
                            <cfset MouseLRWhiteVal = 'ND'>
                            <cfelseif trim(MouseLRWhite) EQ "NA">
                            <cfset MouseLRWhiteVal = 'NA'>
                            </cfif>

							<cfif trim(MouseLowicryl) EQ 'Pass'>
                            <cfset MouseLowicrylVal = '<img src="images/pass.png">'>
							<cfelseif trim(MouseLowicryl) EQ "Fail">
                            <cfset MouseLowicrylVal = '<img src="images/fail.png">'>
                            <cfelseif trim(MouseLowicryl) EQ "ND">
                            <cfset MouseLowicrylVal = 'ND'>
                            <cfelseif trim(MouseLowicryl) EQ "NA">
                            <cfset MouseLowicrylVal = 'NA'>
                            </cfif>

							<cfif trim(HumanLRWhite) EQ 'Pass'>
                            <cfset HumanLRWhiteVal = '<img src="images/pass.png">'>
							<cfelseif trim(HumanLRWhite) EQ "Fail">
                            <cfset HumanLRWhiteVal = '<img src="images/fail.png">'>
                            <cfelseif trim(HumanLRWhite) EQ "ND">
                            <cfset HumanLRWhiteVal = 'ND'>
                            <cfelseif trim(HumanLRWhite) EQ "NA">
                            <cfset HumanLRWhiteVal = 'NA'>
                            </cfif>

                            <cfif session.editMode and session.isAdmin>
                            	<cfgridrow data="#replace(editVal, ',', '&##44;', 'ALL')#,#replace(deleteVal, ',', '&##44;', 'ALL')#,#replace(qArrayTomography.target, ',', '&##44;', 'ALL')# ,#replace(qArrayTomography.Clone, ',', '&##44;', 'ALL')# ,#replace(qArrayTomography.IsoType, ',', '&##44;', 'ALL')# ,#replace(qArrayTomography.MouseLRWhite, ',', '&##44;', 'ALL')# ,#replace(qArrayTomography.MouseLowicryl, ',', '&##44;', 'ALL')# ,#replace(qArrayTomography.HumanLRWhite, ',', '&##44;', 'ALL')#">
							<cfelse>
                            	<cfgridrow data="#replace(qArrayTomography.target, ',', '&##44;', 'ALL')# ,#replace(qArrayTomography.Clone, ',', '&##44;', 'ALL')# ,#replace(qArrayTomography.IsoType, ',', '&##44;', 'ALL')# ,#replace(MouseLRWhiteVal, ',', '&##44;', 'ALL')# ,#replace(MouseLowicrylVal, ',', '&##44;', 'ALL')# ,#replace(HumanLRWhiteVal, ',', '&##44;', 'ALL')#">
							</cfif>
                        </cfloop>
                    </cfgrid>
        
        		</td>
            </tr>
        </cfform>
        </table>










<cfinclude template="include/footer.cfm">