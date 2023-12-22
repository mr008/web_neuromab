
<cfif session.isAdmin and session.editMode>
	<!--- access granted --->
<cfelse>
	Access denied. 
    <cfabort>
</cfif>

<cfparam name="url.action" default="edit">
<cfparam name="url.cid" default="0" type="numeric">

<cfif url.action eq 'delete'>
	<cfquery datasource="#request.dsn#" name="qDelete">
    	delete from tblCatalog where catalogId = #url.cid#
    </cfquery>
    <cflocation url="neuromabs.cfm" addtoken="no">
</cfif>

<cfif url.action eq 'saveContent'>
	<cfif url.cid>
		<cfquery datasource="#request.dsn#" name="qInsert">
        	update tblCatalog set
            	target = '#form.target#',
                targetType = '#form.targetType#',
                AccessionNum = '#form.AccessionNum#',
                AccessionRef = '#form.AccessionRef#',
                Clone = '#form.Clone#',
                HumanGeneName = '#form.HumanGeneName#',
                DataSheetFileName = '#form.DataSheetFileName#',
                DataSheetModDate = '#form.DataSheetModDate#',
                IgIsoType = '#form.IgIsoType#',
                ValidationT = '#form.ValidationT#',
                ValidationBrIB = '#form.ValidationBrIB#',
                ValidationBrIHC = '#form.ValidationBrIHC#',
                ValidationKO = '#form.ValidationKO#',
                AICatalogTCSupe = '#form.AICatalogTCSupe#',
                AICatalogPure = '#form.AICatalogPure#',
                CatABIDTCSupe = '#form.CatABIDTCSupe#',
                CatABIDPure = '#form.CatABIDPure#'
            where catalogId = #url.cid#
        </cfquery>
    <cfelse>
    	<cfquery datasource="#request.dsn#" name="qInsert">
        	insert into tblCatalog (
            	target,
                targetType,
                AccessionNum,
                AccessionRef,
                Clone,
                HumanGeneName,
                DataSheetFileName,
                DataSheetModDate,
                IgIsoType,
                ValidationT,
                ValidationBrIB,
                ValidationBrIHC,
                ValidationKO,
                AICatalogTCSupe,
                AICatalogPure,
                CatABIDTCSupe,
				CatABIDPure
            )
            values(
            	'#form.target#',
                '#form.targetType#',
                '#form.AccessionNum#',
                '#form.AccessionRef#',
                '#form.Clone#',
                '#form.HumanGeneName#',
                '#form.DataSheetFileName#',
                '#form.DataSheetModDate#',
                '#form.IgIsoType#',
                '#form.ValidationT#',
                '#form.ValidationBrIB#',
                '#form.ValidationBrIHC#',
                '#form.ValidationKO#',
                '#form.AICatalogTCSupe#',
                '#form.AICatalogPure#',
                '#form.CatABIDTCSupe#',
                '#form.CatABIDPure#'
            )
        </cfquery>
        <cfquery name="qSubscriberList" datasource="#request.dsn#">
        SELECT email
        FROM tblCatalogAdd
        </cfquery>
        <cfmail to="#email#" from="neuromab@ucdavis.edu" subject="[UCDNeuromab] New Neuromab Added to Our Catalog" query="qSubscriberList" server="smtp.ucdavis.edu">
<cfprocessingdirective suppresswhitespace="no">
A New Neuromab has been added to the UC Davis Neuromab Catalog:

Target:          	#form.target#
Target Type:     	#form.targetType#
Accession Number: 	#form.AccessionNum#
Reference:		#form.AccessionRef#
Clone:			#form.Clone#
</cfprocessingdirective>
		</cfmail>

    </cfif>
    <cflocation url="neuromabs.cfm" addtoken="no">
</cfif>

<!--- page header --->
<cfinclude template="include/header.cfm">
        
        <div style="height:25px;"> </div>
        <table width="100%">
	        <cfoutput>
            <form action="catalogEdit.cfm?action=saveContent&cid=#url.cid#" method="post">
            </cfoutput>
            <tr>
                <td class="contentHeader">
                    <cfif url.cid>
                    	<cfquery datasource="#request.dsn#" name="qEdit">
                        	select * from tblCatalog where catalogId = #url.cid# 
                        </cfquery>
                    	<cfparam name="form.target" default="#qEdit.target#">
                        <cfparam name="form.targetType" default="#qEdit.targetType#">
                        <cfparam name="form.AccessionNum" default="#qEdit.AccessionNum#">
                        <cfparam name="form.AccessionRef" default="#qEdit.AccessionRef#">
                        <cfparam name="form.Clone" default="#qEdit.Clone#">
                        <cfparam name="form.HumanGeneName" default="#qEdit.HumanGeneName#">
                        <cfparam name="form.DataSheetFileName" default="#qEdit.DataSheetFileName#">
                        <cfparam name="form.DataSheetModDate" default="#qEdit.DataSheetModDate#">
                        <cfparam name="form.IgIsoType" default="#qEdit.IgIsoType#">
                        <cfparam name="form.ValidationT" default="#qEdit.ValidationT#">
                        <cfparam name="form.ValidationBrIB" default="#qEdit.ValidationBrIB#">
                        <cfparam name="form.ValidationBrIHC" default="#qEdit.ValidationBrIHC#">
                        <cfparam name="form.ValidationKO" default="#qEdit.ValidationKO#">
                        <cfparam name="form.AICatalogTCSupe" default="#qEdit.AICatalogTCSupe#">
                        <cfparam name="form.AICatalogPure" default="#qEdit.AICatalogPure#">
                        <cfparam name="form.CatABIDTCSupe" default="#qEdit.CatABIDTCSupe#">
                        <cfparam name="form.CatABIDPure" default="#qEdit.CatABIDPure#">
						Edit Catalog Entry
                    <cfelse>
                    	<cfparam name="form.target" default="">
                        <cfparam name="form.targetType" default="">
                        <cfparam name="form.AccessionNum" default="">
                        <cfparam name="form.AccessionRef" default="">
                        <cfparam name="form.Clone" default="">
                        <cfparam name="form.HumanGeneName" default="">
                        <cfparam name="form.DataSheetFileName" default="">
                        <cfparam name="form.DataSheetModDate" default="">
                        <cfparam name="form.IgIsoType" default="">
                        <cfparam name="form.ValidationT" default="">
                        <cfparam name="form.ValidationBrIB" default="">
                        <cfparam name="form.ValidationBrIHC" default="">
                        <cfparam name="form.ValidationKO" default="">
                        <cfparam name="form.AICatalogTCSupe" default="">
                        <cfparam name="form.AICatalogPure" default="">
                        <cfparam name="form.CatABIDTCSupe" default="">
                        <cfparam name="form.CatABIDPure" default="">
                    	New Catalog Entry
					</cfif>
                </td>
            </tr>
            <tr>
                <td class="translucentbkg">
                    <div class="opaquetext">
                    	
                    	<cfoutput>
                    	<table width="100%">
                        	<tr>
                            	<td>Target</td>
                                <td width="70%">
                                	<input type="text" name="target" value="#form.target#"/>
                                </td>
                            </tr>
                            
                        	<tr>
                            	<td>Target Type</td>
                                <td>
                                	<input type="text" name="targetType" value="#form.targetType#"/>
                                </td>
                            </tr>
                            
                        	<tr>
                            	<td>Accession Number</td>
                                <td>
                                	<input type="text" name="AccessionNum" value="#form.AccessionNum#"/>
                                </td>
                            </tr>
                            
                            <tr>
                            	<td>Accession URL</td>
                                <td>
                                	<input type="text" name="AccessionRef" value="#form.AccessionRef#"/>
                                </td>
                            </tr>
                            
                            <tr>
                            	<td>Clone</td>
                                <td>
                                	<input type="text" name="Clone" value="#form.Clone#"/>
                                </td>
                            </tr>
                            
                            <tr>
                            	<td>Human Gene Name</td>
                                <td>
                                	<input type="text" name="HumanGeneName" value="#form.HumanGeneName#"/>
                                </td>
                            </tr>

                            <tr>
                            	<td>DataSheet Name</td>
                                <td>
                                	<input type="text" name="DataSheetFileName" value="#form.DataSheetFileName#"/>
                                </td>
                            </tr>
                            
                            <tr>
                            	<td>DataSheet URL</td>
                                <td>
                                	<input type="text" name="DataSheetModDate" value="#form.DataSheetModDate#"/>
                                </td>
                            </tr>
                            
                            <tr>
                            	<td>IgIsoType</td>
                                <td>
                                	<input type="text" name="IgIsoType" value="#form.IgIsoType#"/>
                                </td>
                            </tr>

                            <tr>
                            	<td>ValidationT</td>
                                <td>
                                	<input type="text" name="ValidationT" value="#form.ValidationT#"/>
                                </td>
                            </tr>

                            <tr>
                            	<td>ValidationBrIB</td>
                                <td>
                                	<input type="text" name="ValidationBrIB" value="#form.ValidationBrIB#"/>
                                </td>
                            </tr>

                            <tr>
                            	<td>ValidationBrIHC</td>
                                <td>
                                	<input type="text" name="ValidationBrIHC" value="#form.ValidationBrIHC#"/>
                                </td>
                            </tr>

                            <tr>
                            	<td>ValidationKO</td>
                                <td>
                                	<input type="text" name="ValidationKO" value="#form.ValidationKO#"/>
                                </td>
                            </tr>

                            <tr>
                            	<td>AI Catalog TC Supe</td>
                                <td>
                                	<input type="text" name="AICatalogTCSupe" value="#form.AICatalogTCSupe#"/>
                                </td>
                            </tr>
                            
                            <tr>
                            	<td>AI Catalog Pure</td>
                                <td>
                                	<input type="text" name="AICatalogPure" value="#form.AICatalogPure#"/>
                                </td>
                            </tr>

                            <tr>
                            	<td>AI Catalog TC Supe Antibody Registry ID</td>
                                <td>
                                	<input type="text" name="CatABIDTCSupe" value="#form.CatABIDTCSupe#"/>
                                </td>
                            </tr>
                            
                            <tr>
                            	<td>AI Catalog Pure Antibody Registry ID</td>
                                <td>
                                	<input type="text" name="CatABIDPure" value="#form.CatABIDPure#"/>
                                </td>
                            </tr>
                        </table>
	                    </cfoutput>
                        <input type="submit" value="Save"/>
                    </div>
                </td>
            </tr>
            </form>
        </table>       
                
<!--- page header --->
<cfinclude template="include/footer.cfm">
        