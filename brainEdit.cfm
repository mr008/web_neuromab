
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
    	delete from tblBrain where BrainID = #url.cid#
    </cfquery>
    <cflocation url="brain.cfm" addtoken="no">
</cfif>

<cfif url.action eq 'saveContent'>
	<cfif url.cid>
		<cfquery datasource="#request.dsn#" name="qInsert">
        	update tblBrain set
            	BrainTarget = '#form.BrainTarget#',
                BrainCloneNumber = '#form.BrainCloneNumber#',
                BrainImmunoEM = '#form.BrainImmunoEM#',
                BrainSuperRes = '#form.BrainSuperRes#',
                BrainArrayTomo = '#form.BrainArrayTomo#',
                BrainExpans = '#form.BrainExpans#',
                BrainVolumetric = '#form.BrainVolumetric#'
            where BrainID = #url.cid#
        </cfquery>
    <cfelse>
    	<cfquery datasource="#request.dsn#" name="qInsert">
        	insert into tblBrain (
            	BrainTarget,
                BrainCloneNumber,
                BrainImmunoEM,
                BrainSuperRes,
                BrainArrayTomo,
                BrainExpans,
                BrainVolumetric            )
            values(
            	'#form.BrainTarget#',
                '#form.BrainCloneNumber#',
                '#form.BrainImmunoEM#',
                '#form.BrainSuperRes#',
                '#form.BrainArrayTomo#',
                '#form.BrainExpans#',
                '#form.BrainVolumetric#'            )
        </cfquery>
<!---
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
		--->

    </cfif>
    <cflocation url="brain.cfm" addtoken="no">
</cfif>

<!--- page header --->
<cfinclude template="include/header.cfm">
        
        <div style="height:25px;"> </div>
        <table width="100%">
	        <cfoutput>
            <form action="brainEdit.cfm?action=saveContent&cid=#url.cid#" method="post">
            </cfoutput>
            <tr>
                <td class="contentHeader">
                    <cfif url.cid>
                    	<cfquery datasource="#request.dsn#" name="qEdit">
                        	select * from tblBrain where BrainID = #url.cid# 
                        </cfquery>
                    	<cfparam name="form.BrainTarget" default="#qEdit.BrainTarget#">
                        <cfparam name="form.BrainCloneNumber" default="#qEdit.BrainCloneNumber#">
                        <cfparam name="form.BrainImmunoEM" default="#qEdit.BrainImmunoEM#">
                        <cfparam name="form.BrainSuperRes" default="#qEdit.BrainSuperRes#">
                        <cfparam name="form.BrainArrayTomo" default="#qEdit.BrainArrayTomo#">
                        <cfparam name="form.BrainExpans" default="#qEdit.BrainExpans#">
                        <cfparam name="form.BrainVolumetric" default="#qEdit.BrainVolumetric#">
						Edit Brain Entry
                    <cfelse>
                    	<cfparam name="form.BrainTarget" default="">
                        <cfparam name="form.BrainCloneNumber" default="">
                        <cfparam name="form.BrainImmunoEM" default="">
                        <cfparam name="form.BrainSuperRes" default="">
                        <cfparam name="form.BrainArrayTomo" default="">
                        <cfparam name="form.BrainExpans" default="">
                        <cfparam name="form.BrainVolumetric" default="">
                    	New Brain Entry
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
                                	<input type="text" name="BrainTarget" value="#form.BrainTarget#"/>
                                </td>
                            </tr>
                            
                        	<tr>
                            	<td>Clone Number</td>
                                <td>
                                	<input type="text" name="BrainCloneNumber" value="#form.BrainCloneNumber#"/>
                                </td>
                            </tr>
                            
                        	<tr>
                            	<td>Immuno EM</td>
                                <td>
                                	<input type="text" name="BrainImmunoEM" value="#form.BrainImmunoEM#"/>
                                </td>
                            </tr>
                            
                            <tr>
                            	<td>Super Res</td>
                                <td>
                                	<input type="text" name="BrainSuperRes" value="#form.BrainSuperRes#"/>
                                </td>
                            </tr>
                            
                            <tr>
                            	<td>Array Tomography</td>
                                <td>
                                	<input type="text" name="BrainArrayTomo" value="#form.BrainArrayTomo#"/>
                                </td>
                            </tr>
                            
                            <tr>
                            	<td>Expansion Microscopy</td>
                                <td>
                                	<input type="text" name="BrainExpans" value="#form.BrainExpans#"/>
                                </td>
                            </tr>

                            <tr>
                            	<td>Volumetric Tissue Imaging</td>
                                <td>
                                	<input type="text" name="BrainVolumetric" value="#form.BrainVolumetric#"/>
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
        