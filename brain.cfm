
<!--- page header --->
<cfinclude template="include/header.cfm">

        <cf_contentSection sectionName="brain">
        	
        </cf_contentSection>        


        <cfparam name="form.keywords" default="">
        
        <cfquery datasource="#request.dsn#" name="qBrain">
        	select * from tblBrain 
            <cfif len(trim(form.keywords))>
				where 
                	BrainTarget like '%#form.keywords#%' 
                    or
                    BrainCloneNumber like '%#form.keywords#%' 
			</cfif>
            order by BrainTarget;
        </cfquery>
        <!--- 
        <cfdump var="#qCatalog#"/> --->
        
        <div style="height:25px;"> </div>
        <table width="100%">
            <cfif session.editMode and session.isAdmin>
				<tr>
                	<td class="catalogPreText"> [ + <a href="catalogEdit.cfm?cid=0">Add new catalog entry</a> ] </td>
                </tr>
			</cfif>
<!--- 
           <tr>
                <td class="catalogPreText">
                    <p class="catalogPreText">Click on a column header to re-sort table</p>
                </td>
            </tr>
--->
            <tr>
            <cfform id="NeuromabCatalog">
            	<td>
        
                    <cfgrid name="brain" format="html">
                    	<cfif session.editMode and session.isAdmin>
							<cfgridcolumn name="Edit" header="Edit" width="50">
                            <cfgridcolumn name="Delete" header="Delete" width="50">
						</cfif>
                        <cfgridcolumn name="BrainTarget" header="Target" width="150">
                        <cfgridcolumn name="BrainCloneNumber" header="Clone Number" width="150">
                        <cfgridcolumn name="BrainImmunoEM" header="Immuno-EM" width="70">
                        <cfgridcolumn name="BrainSuperRes" header="Superres<br>imaging" width="70">
                        <cfgridcolumn name="BrainArrayTomo" header="Array<br>Tomography" width="70">
                        <cfgridcolumn name="BrainExpans" header="Expansion<br>Microscopy" width="70">
                        <cfgridcolumn name="BrainVolumetric" header="Volumetric<br>Tissue<br>Imaging" width="60">

                        <cfloop query="qBrain">
                        	
                            
                        	<cfset editVal = '<a href="brainEdit.cfm?action=edit&cid=#qBrain.BrainID#">Edit</a>'>
                            <cfset deleteVal = '<a href="brainEdit.cfm?action=delete&cid=#qBrain.BrainID#">Delete</a>'>

							<cfif trim(BrainImmunoEM) EQ 'Pass'>
                            <cfset BrainImmunoEMVal = '<img src="images/pass.png">'>
							<cfelseif trim(BrainImmunoEM) EQ "Fail">
                            <cfset BrainImmunoEMVal = '<img src="images/fail.png">'>
                            <cfelseif trim(BrainImmunoEM) EQ "ND" or trim(BrainImmunoEM) EQ "" >
                            <cfset BrainImmunoEMVal = 'ND'>
                            <cfelseif trim(BrainImmunoEM) EQ "NA">
                            <cfset BrainImmunoEMVal = 'NA'>
                            </cfif>

							<cfif trim(BrainSuperRes) EQ 'Pass'>
                            <cfset BrainSuperResVal = '<img src="images/pass.png">'>
							<cfelseif trim(BrainSuperRes) EQ "Fail">
                            <cfset BrainSuperResVal = '<img src="images/fail.png">'>
                            <cfelseif trim(BrainSuperRes) EQ "ND" or trim(BrainSuperRes) EQ "">
                            <cfset BrainSuperResVal = 'ND'>
                            <cfelseif trim(BrainSuperRes) EQ "NA">
                            <cfset BrainSuperResVal = 'NA'>
                            </cfif>

							<cfif trim(BrainArrayTomo) EQ 'Pass'>
                            <cfset BrainArrayTomoVal = '<img src="images/pass.png">'>
							<cfelseif trim(BrainArrayTomo) EQ "Fail">
                            <cfset BrainArrayTomoVal = '<img src="images/fail.png">'>
                            <cfelseif trim(BrainArrayTomo) EQ "ND" or trim(BrainArrayTomo) EQ "">
                            <cfset BrainArrayTomoVal = 'ND'>
                            <cfelseif trim(BrainArrayTomo) EQ "NA">
                            <cfset BrainArrayTomoVal = 'NA'>
                            </cfif>

							<cfif trim(BrainExpans) EQ 'Pass'>
                            <cfset BrainExpansVal = '<img src="images/pass.png">'>
							<cfelseif trim(BrainExpans) EQ "Fail">
                            <cfset BrainExpansVal = '<img src="images/fail.png">'>
                            <cfelseif trim(BrainExpans) EQ "ND" or trim(BrainExpans) EQ "">
                            <cfset BrainExpansVal = 'ND'>
                            <cfelseif trim(BrainExpans) EQ "NA">
                            <cfset BrainExpansVal = 'NA'>
                            </cfif>

							<cfif trim(BrainVolumetric) EQ 'Pass'>
                            <cfset BrainVolumetricVal = '<img src="images/pass.png">'>
							<cfelseif trim(BrainVolumetric) EQ "Fail">
                            <cfset BrainVolumetricVal = '<img src="images/fail.png">'>
                            <cfelseif trim(BrainVolumetric) EQ "ND" or trim(BrainVolumetric) EQ "">
                            <cfset BrainVolumetricVal = 'ND'>
                            <cfelseif trim(BrainVolumetric) EQ "NA">
                            <cfset BrainVolumetricVal = 'NA'>
                            </cfif>



                            <cfif session.editMode and session.isAdmin>
                            	<cfgridrow data="#replace(editVal, ',', '&##44;', 'ALL')#,#replace(deleteVal, ',', '&##44;', 'ALL')#,#replace(qBrain.BrainTarget, ',', '&##44;', 'ALL')# ,#replace(qBrain.BrainCloneNumber, ',', '&##44;', 'ALL')# ,#replace(BrainImmunoEMVal, ',', '&##44;', 'ALL')# ,#replace(BrainSuperResVal, ',', '&##44;', 'ALL')# ,#replace(BrainArrayTomoVal, ',', '&##44;', 'ALL')# ,#replace(BrainExpansVal, ',', '&##44;', 'ALL')# ,#replace(BrainVolumetricVal, ',', '&##44;', 'ALL')#">
							<cfelse>
                            	<cfgridrow data="#replace(qBrain.BrainTarget, ',', '&##44;', 'ALL')# ,#replace(qBrain.BrainCloneNumber, ',', '&##44;', 'ALL')# ,#replace(BrainImmunoEMVal, ',', '&##44;', 'ALL')# ,#replace(BrainSuperResVal, ',', '&##44;', 'ALL')# ,,#replace(BrainArrayTomoVal, ',', '&##44;', 'ALL')# ,#replace(BrainExpansVal, ',', '&##44;', 'ALL')# ,#replace(BrainVolumetricVal, ',', '&##44;', 'ALL')#">
							</cfif>
                        </cfloop>
                    </cfgrid>
        
        		</td>
            </tr>
        </cfform>
        </table>
                
<!--- page header --->
<cfinclude template="include/footer.cfm">
        