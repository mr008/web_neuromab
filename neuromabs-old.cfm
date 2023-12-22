
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
                    or
                    CatABIDTCSupe like '%#form.keywords#%' 
                    or
                    CatABIDPure like '%#form.keywords#%'
                    or
                    HumanGeneName like '%#form.keywords#%'
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
                        <cfgridcolumn name="Target" header="Target Type" width="80">
                        <cfgridcolumn name="AccessionNum" header="Accession<br> Number" width="60">
                        <cfgridcolumn name="Clone" header="Clone" width="80">
                        <cfgridcolumn name="HumanGeneNames" header="Human<br>Gene Names" width="60">
                        <cfgridcolumn name="IgIsotype" header="Isotype" width="50">
                        <cfgridcolumn name="ValidationT" header="IF<br>ICC" width="50">
                        <cfgridcolumn name="ValidationBrIB" header="Brain<br>Immuno<br>blot" width="60">
                        <cfgridcolumn name="ValidationBrIHC" header="Brain<br>IHC" width="50">
                        <cfgridcolumn name="ValidationKO" header="KO" width="30">
                        <cfgridcolumn name="CatABIDTCSupe" header="TC Supe<br>RRID:AB_" width="70">
                        <cfgridcolumn name="CatABIDPure" header="Pure<br>RRID:AB_" width="70">
                        <cfloop query="qCatalog">
                        	
                            
                        	<cfset editVal = '<a href="catalogEdit.cfm?action=edit&cid=#qCatalog.catalogId#">Edit</a>'>
                            <cfset deleteVal = '<a href="catalogEdit.cfm?action=delete&cid=#qCatalog.catalogId#">Delete</a>'>
                            <cfset AccessionVal = '<a href="#qCatalog.AccessionRef#" target="_blank" >#qCatalog.AccessionNum#</a>'>
                            <cfset CatABIDTCSupeVal = '<a href="https://www.antibodyregistry.org/search.php?q=AB_#qCatalog.CatABIDTCSupe#" target="_blank" >#qCatalog.CatABIDTCSupe#</a>'>
                            <cfset CatABIDPureVal = '<a href="https://www.antibodyregistry.org/search.php?q=AB_#qCatalog.CatABIDPure#" target="_blank">#qCatalog.CatABIDPure#</a>'>
                            
                            <cfset dataSheetVal = '<a target="_blank" href="/datasheet/#qCatalog.DataSheetFileName#">#qCatalog.DataSheetFileName#</a>'>							
							<cfif trim(ValidationT) EQ 'Pass'>
                            <cfset ValidationTVal = '<img src="images/pass.png">'>
							<cfelseif trim(ValidationT) EQ "Fail">
                            <cfset ValidationTVal = '<img src="images/fail.png">'>
                            <cfelseif trim(ValidationT) EQ "ND">
                            <cfset ValidationTVal = 'ND'>
                            <cfelseif trim(ValidationT) EQ "NA">
                            <cfset ValidationTVal = 'NA'>
                            </cfif>

							<cfif trim(ValidationBrIB) EQ 'Pass'>
                            <cfset ValidationBrIBVal = '<img src="images/pass.png">'>
							<cfelseif trim(ValidationBrIB) EQ "Fail">
                            <cfset ValidationBrIBVal = '<img src="images/fail.png">'>
                            <cfelseif trim(ValidationBrIB) EQ "ND">
                            <cfset ValidationBrIBVal = 'ND'>
                            <cfelseif trim(ValidationBrIB) EQ "NA">
                            <cfset ValidationBrIBVal = 'NA'>
                            </cfif>

							<cfif trim(ValidationBrIHC) EQ 'Pass'>
                            <cfset ValidationBrIHCVal = '<img src="images/pass.png">'>
							<cfelseif trim(ValidationBrIHC) EQ "Fail">
                            <cfset ValidationBrIHCVal = '<img src="images/fail.png">'>
                            <cfelseif trim(ValidationBrIHC) EQ "ND">
                            <cfset ValidationBrIHCVal = 'ND'>
                            <cfelseif trim(ValidationBrIHC) EQ "NA">
                            <cfset ValidationBrIHCVal = 'NA'>
                            </cfif>

							<cfif trim(ValidationKO) EQ 'Pass'>
                            <cfset ValidationKOVal = '<img src="images/pass.png">'>
							<cfelseif trim(ValidationKO) EQ "Fail">
                            <cfset ValidationKOVal = '<img src="images/fail.png">'>
                            <cfelseif trim(ValidationKO) EQ "ND">
                            <cfset ValidationKOVal = 'ND'>
                            <cfelseif trim(ValidationKO) EQ "NA">
                            <cfset ValidationKOVal = 'NA'>
                            </cfif>

                            <cfif session.editMode and session.isAdmin>
                            	<cfgridrow data="#replace(editVal, ',', '&##44;', 'ALL')#,#replace(deleteVal, ',', '&##44;', 'ALL')#,#replace(qCatalog.target, ',', '&##44;', 'ALL')# ,#replace(qCatalog.targetType, ',', '&##44;', 'ALL')# ,#replace(AccessionVal, ',', '&##44;', 'ALL')# ,#replace(dataSheetVal, ',', '&##44;', 'ALL')# ,#replace(qCatalog.HumanGeneName, ',', '&##44;', 'ALL')# ,#replace(dataSheetVal, ',', '&##44;', 'ALL')# ,#replace(qCatalog.IgIsoType, ',', '&##44;', 'ALL')# ,#replace(qCatalog.ValidationT, ',', '&##44;', 'ALL')# ,#replace(qCatalog.ValidationBrIB, ',', '&##44;', 'ALL')# ,#replace(qCatalog.ValidationBrIHC, ',', '&##44;', 'ALL')# ,#replace(qCatalog.ValidationKO, ',', '&##44;', 'ALL')# ,#replace(CatABIDTCSupeVal, ',', '&##44;', 'ALL')# ,#replace(CatABIDPureVal, ',', '&##44;', 'ALL')# ">
							<cfelse>
                            	<cfgridrow data="#replace(qCatalog.target, ',', '&##44;', 'ALL')# ,#replace(qCatalog.targetType, ',', '&##44;', 'ALL')# ,#replace(AccessionVal, ',', '&##44;', 'ALL')# ,#replace(dataSheetVal, ',', '&##44;', 'ALL')# ,,#replace(qCatalog.HumanGeneName, ',', '&##44;', 'ALL')# ,#replace(qCatalog.IgIsoType, ',', '&##44;', 'ALL')# ,#replace(ValidationTVal, ',', '&##44;', 'ALL')# ,#replace(ValidationBrIBVal, ',', '&##44;', 'ALL')# ,#replace(ValidationBrIHCVal, ',', '&##44;', 'ALL')# ,#replace(ValidationKOVal, ',', '&##44;', 'ALL')# ,#replace(CatABIDTCSupeVal, ',', '&##44;', 'ALL')# ,#replace(CatABIDPureVal, ',', '&##44;', 'ALL')# ">
							</cfif>
                        </cfloop>
                    </cfgrid>
        
        		</td>
            </tr>
        </cfform>
        </table>
                
<!--- page header --->
<cfinclude template="include/footer.cfm">
        