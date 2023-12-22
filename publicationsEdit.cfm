
<cfif session.isAdmin and session.editMode>
	<!--- access granted --->
<cfelse>
	Access denied. 
    <cfabort>
</cfif>

<cfparam name="url.action" default="edit">
<cfparam name="url.pid" default="0" type="numeric">

<cfif url.action eq 'delete'>
	<cfquery datasource="#request.dsn#" name="qDelete">
    	delete from tblPublications
        where PublicationID = #url.pid#
    </cfquery>
    <cflocation url="publications.cfm" addtoken="no">
</cfif>

<cfif url.action eq 'saveContent'>
	<cfif url.pid>
		<cfquery datasource="#request.dsn#" name="qInsert">
        	update tblPublications set
            	PublicationYear = '#form.PublicationYear#',
                PublicationClone = '#form.PublicationClone#',
                PublicationTarget = '#form.PublicationTarget#',
                PublicationCitation = '#form.PublicationCitation#',
                PublicationPubmed = '#form.PublicationPubmed#'
            where PublicationID = #url.pid#
        </cfquery>
    <cfelse>
    	<cfquery datasource="#request.dsn#" name="qInsert">
        	insert into tblPublications (
            	PublicationYear,
                PublicationClone,
                PublicationTarget,
                PublicationCitation,
                PublicationPubmed
            )
            values(
            	'#form.PublicationYear#',
                '#form.PublicationClone#',
                '#form.PublicationTarget#',
                '#form.PublicationCitation#',
                '#form.PublicationPubmed#'
            )
        </cfquery>
	</cfif>
    <cflocation url="publications.cfm" addtoken="no">
</cfif>

<!--- page header --->
<cfinclude template="include/header.cfm">
        
        <div style="height:25px;"> </div>
        <table width="100%">
	        <cfoutput>
            <form action="publicationsEdit.cfm?action=saveContent&pid=#url.pid#" method="post">
            </cfoutput>
            <tr>
                <td class="contentHeader">
                    <cfif url.pid>
                    	<cfquery datasource="#request.dsn#" name="qEdit">
                        	select * from tblPublications where PublicationID = #url.pid# 
                        </cfquery>
                    	<cfparam name="form.PublicationYear" default="#qEdit.PublicationYear#">
                        <cfparam name="form.PublicationClone" default="#qEdit.PublicationClone#">
                        <cfparam name="form.PublicationTarget" default="#qEdit.PublicationTarget#">
                        <cfparam name="form.PublicationPubmed" default="#qEdit.PublicationPubmed#">
                        <cfparam name="form.PublicationCitation" default="#qEdit.PublicationCitation#">
						Edit Publications Entry
                    <cfelse>
                    	<cfparam name="form.PublicationYear" default="">
                        <cfparam name="form.PublicationClone" default="">
                        <cfparam name="form.PublicationTarget" default="">
                        <cfparam name="form.PublicationPubmed" default="">
                        <cfparam name="form.PublicationCitation" default="">
                    	New Publications Entry
					</cfif>
                </td>
            </tr>
            <tr>
                <td class="translucentbkg">
                    <div class="opaquetext">
                    	
                    	<cfoutput>
                    	<table width="100%">
                        	<tr>
                            	<td>Year</td>
                                <td width="70%">
                                	<input type="text" name="PublicationYear" value="#form.PublicationYear#"/>
                                </td>
                            </tr>
                            
                        	<tr>
                            	<td>Clone</td>
                                <td>
                                	<input type="text" name="PublicationClone" value="#form.PublicationClone#"/>
                                </td>
                            </tr>
                            
                        	<tr>
                            	<td>Target</td>
                                <td>
                                	<input type="text" name="PublicationTarget" value="#form.PublicationTarget#"/>
                                </td>
                            </tr>
                            
                             <tr>
                            	<td>Pubmed</td>
                                <td>
                                	<input type="text" name="PublicationPubmed" value="#form.PublicationPubmed#"/>
                                </td>
                            </tr>

                           <tr>
                            	<td>Citation</td>
                                <td>
                                	<input type="text" name="PublicationCitation" value="#form.PublicationCitation#"/>
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
        