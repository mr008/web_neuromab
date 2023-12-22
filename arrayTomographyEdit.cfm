
<cfif session.isAdmin and session.editMode>
	<!--- access granted --->
<cfelse>
	Access denied. 
    <cfabort>
</cfif>

<cfparam name="url.action" default="edit">
<cfparam name="url.atid" default="0" type="numeric">

<cfif url.action eq 'delete'>
	<cfquery datasource="#request.dsn#" name="qDelete">
    	delete from tblArrayTomography
        where atID = #url.atid#;
    </cfquery>
    <cflocation url="arrayTomography.cfm" addtoken="no">
</cfif>

<cfif url.action eq 'saveContent'>
	<cfif url.atid>
		<cfquery datasource="#request.dsn#" name="qUpdate">
        	update tblArrayTomography set
            	target = '#form.target#',
                Clone = '#form.Clone#',
                IsoType = '#form.IsoType#',
                MouseLRWhite = '#form.MouseLRWhite#',
                MouseLowicryl = '#form.MouseLowicryl#',
                HumanLRWhite = '#form.HumanLRWhite#'
            where atID = #url.atid#
        </cfquery>
    <cfelse>
    	<cfquery datasource="#request.dsn#" name="qInsert">
        	insert into tblArrayTomography (
            	target,
                Clone,
                IsoType,
                MouseLRWhite,
                MouseLowicryl,
                HumanLRWhite
            )
            values(
            	'#form.target#',
                '#form.Clone#',
                '#form.IsoType#',
                '#form.MouseLRWhite#',
                '#form.MouseLowicryl#',
                '#form.HumanLRWhite#'
            )
        </cfquery>

    </cfif>
    <cflocation url="arraytomography.cfm" addtoken="no">
</cfif>

<!--- page header --->
<cfinclude template="include/header.cfm">
        
        <div style="height:25px;"> </div>
        <table width="100%">
	        <cfoutput>
            <form action="arraytomographyEdit.cfm?action=saveContent&atid=#url.atid#" method="post">
            </cfoutput>
            <tr>
                <td class="contentHeader">
                    <cfif url.atid>
                    	<cfquery datasource="#request.dsn#" name="qEdit">
                        	select * from tblArrayTomography where atID = #url.atid# 
                        </cfquery>
                    	<cfparam name="form.target" default="#qEdit.target#">
                        <cfparam name="form.Clone" default="#qEdit.Clone#">
                        <cfparam name="form.IsoType" default="#qEdit.IsoType#">
                        <cfparam name="form.MouseLRWhite" default="#qEdit.MouseLRWhite#">
                        <cfparam name="form.MouseLowicryl" default="#qEdit.MouseLowicryl#">
                        <cfparam name="form.HumanLRWhite" default="#qEdit.HumanLRWhite#">
						Edit Catalog Entry
                    <cfelse>
                    	<cfparam name="form.target" default="">
                        <cfparam name="form.Clone" default="">
                        <cfparam name="form.IsoType" default="">
                        <cfparam name="form.MouseLRWhite" default="">
                        <cfparam name="form.MouseLowicryl" default="">
                        <cfparam name="form.HumanLRWhite" default="">
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
                            	<td>Clone</td>
                                <td>
                                	<input type="text" name="Clone" value="#form.Clone#"/>
                                </td>
                            </tr>
							<tr>
                            	<td>IsoType</td>
                                <td>
                                	<input type="text" name="IsoType" value="#form.IsoType#"/>
                                </td>
                            </tr>

                            <tr>
                            	<td>Mouse LRWhite</td>
                                <td>
                                	<input type="text" name="MouseLRWhite" value="#form.MouseLRWhite#"/>
                                </td>
                            </tr>

                            <tr>
                            	<td>Mouse Lowicryl</td>
                                <td>
                                	<input type="text" name="MouseLowicryl" value="#form.MouseLowicryl#"/>
                                </td>
                            </tr>

                            <tr>
                            	<td>Human LRWhite</td>
                                <td>
                                	<input type="text" name="HumanLRWhite" value="#form.HumanLRWhite#"/>
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