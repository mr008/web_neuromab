
<!--- page header --->
<cfinclude template="include/header.cfm">

        <cf_contentSection sectionName="catalog">
        	
        </cf_contentSection>        


        <cfparam name="form.keywords" default="">
        
        <cfquery datasource="#request.dsn#" name="qCatalog">
        	select * from tblCatalog 
            <cfif len(trim(form.keywords))>
				where 
                	target like '%#form.keywords#%' 
                    or
                    targetType like '%#form.keywords#%' 
                    or
                    AccessionNum like '%#form.keywords#%' 
                    or
                    AccessionRef like '%#form.keywords#%' 
                    or
                    Clone like '%#form.keywords#%' 
                    or
                    AICatalogTCSupe like '%#form.keywords#%' 
                    or
                    AICatalogPure like '%#form.keywords#%'
			</cfif>
            order by target;
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
        
                    <cfgrid name="catalog" format="html">
                    	<cfif session.editMode and session.isAdmin>
							<cfgridcolumn name="Edit" header="Edit" width="50">
                            <cfgridcolumn name="Delete" header="Delete" width="50">
						</cfif>
                        <cfgridcolumn name="TargetType" header="Target" width="100">
                        <cfgridcolumn name="Target" header="Target Type" width="100">
                        <cfgridcolumn name="AccessionNum" header="Accession<br> Number" width="60">
                        <cfgridcolumn name="Clone" header="Clone" width="60">
                        <cfgridcolumn name="DataSheetName" header="DataSheet" width="70">
                        <cfgridcolumn name="IgIsotype" header="Isotype" width="50">
                        <cfgridcolumn name="ValidationT" header="T" width="30">
                        <cfgridcolumn name="ValidationBrIB" header="Br-IB" width="40">
                        <cfgridcolumn name="ValidationBrIHC" header="Br-IHC" width="40">
                        <cfgridcolumn name="ValidationKO" header="KO" width="30">
                        <cfgridcolumn name="AICatalogTCSupe" header="AI Catalog<br>## TC Supe" width="70">
                        <cfgridcolumn name="AICatalogPure" header="AI Catalog<br> Pure" width="70">
                        <cfloop query="qCatalog">
                        	
                            
                        	<cfset editVal = '<a href="catalogEdit.cfm?action=edit&cid=#qCatalog.catalogId#">Edit</a>'>
                            <cfset deleteVal = '<a href="catalogEdit.cfm?action=delete&cid=#qCatalog.catalogId#">Delete</a>'>
                            <cfset AccessionVal = '<a target target="_blank" href="#qCatalog.AccessionRef#">#qCatalog.AccessionNum#</a>'>
                            <cfset dataSheetVal = '<a target target="_blank" href="#qCatalog.DataSheetRef#">#qCatalog.DataSheetName#</a>'>

							<cfif trim(ValidationT) EQ 'Pass'>
                            <cfset ValidationTVal = '<img src="images/pass.png">'>
							<cfelseif trim(ValidationT) EQ "Fail">
                            <cfset ValidationTVal = '<img src="images/fail.png">'>
                            <cfelseif trim(ValidationT) EQ "ND">
                            <cfset ValidationTVal = 'ND'>
                            </cfif>

							<cfif trim(ValidationBrIB) EQ 'Pass'>
                            <cfset ValidationBrIBVal = '<img src="images/pass.png">'>
							<cfelseif trim(ValidationBrIB) EQ "Fail">
                            <cfset ValidationBrIBVal = '<img src="images/fail.png">'>
                            <cfelseif trim(ValidationBrIB) EQ "ND">
                            <cfset ValidationBrIBVal = 'ND'>
                            </cfif>

							<cfif trim(ValidationBrIHC) EQ 'Pass'>
                            <cfset ValidationBrIHCVal = '<img src="images/pass.png">'>
							<cfelseif trim(ValidationBrIHC) EQ "Fail">
                            <cfset ValidationBrIHCVal = '<img src="images/fail.png">'>
                            <cfelseif trim(ValidationBrIHC) EQ "ND">
                            <cfset ValidationBrIHCVal = 'ND'>
                            </cfif>

							<cfif trim(ValidationKO) EQ 'Pass'>
                            <cfset ValidationKOVal = '<img src="images/pass.png">'>
							<cfelseif trim(ValidationKO) EQ "Fail">
                            <cfset ValidationKOVal = '<img src="images/fail.png">'>
                            <cfelseif trim(ValidationKO) EQ "ND">
                            <cfset ValidationKOVal = 'ND'>
                            </cfif>

                            <cfif session.editMode and session.isAdmin>
                            	<cfgridrow data="#replace(editVal, ',', '&##44;', 'ALL')#,#replace(deleteVal, ',', '&##44;', 'ALL')#,#replace(qCatalog.target, ',', '&##44;', 'ALL')# ,#replace(qCatalog.targetType, ',', '&##44;', 'ALL')# ,#replace(AccessionVal, ',', '&##44;', 'ALL')# ,#replace(qCatalog.Clone, ',', '&##44;', 'ALL')# ,#replace(dataSheetVal, ',', '&##44;', 'ALL')# ,#replace(qCatalog.IgIsoType, ',', '&##44;', 'ALL')# ,#replace(qCatalog.ValidationT, ',', '&##44;', 'ALL')# ,#replace(qCatalog.ValidationBrIB, ',', '&##44;', 'ALL')# ,#replace(qCatalog.ValidationBrIHC, ',', '&##44;', 'ALL')# ,#replace(qCatalog.ValidationKO, ',', '&##44;', 'ALL')# ,#replace(qCatalog.AICatalogTCSupe, ',', '&##44;', 'ALL')# ,#replace(qCatalog.AICatalogPure, ',', '&##44;', 'ALL')# ">
							<cfelse>
                            	<cfgridrow data="#replace(qCatalog.target, ',', '&##44;', 'ALL')# ,#replace(qCatalog.targetType, ',', '&##44;', 'ALL')# ,#replace(AccessionVal, ',', '&##44;', 'ALL')# ,#replace(qCatalog.Clone, ',', '&##44;', 'ALL')# ,#replace(dataSheetVal, ',', '&##44;', 'ALL')# ,#replace(qCatalog.IgIsoType, ',', '&##44;', 'ALL')# ,#replace(ValidationTVal, ',', '&##44;', 'ALL')# ,#replace(ValidationBrIBVal, ',', '&##44;', 'ALL')# ,#replace(ValidationBrIHCVal, ',', '&##44;', 'ALL')# ,#replace(ValidationKOVal, ',', '&##44;', 'ALL')# ,#replace(qCatalog.AICatalogTCSupe, ',', '&##44;', 'ALL')# ,#replace(qCatalog.AICatalogPure, ',', '&##44;', 'ALL')# ">
							</cfif>
                        </cfloop>
                    </cfgrid>
        
        		</td>
            </tr>
        </cfform>
        </table>
                
<!--- page header --->
<cfinclude template="include/footer.cfm">
        