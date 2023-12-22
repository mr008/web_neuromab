
<cfparam name="url.action" default="">
<cfparam name="session.editing" default="0">

<cfif session.isAdmin neq 1>
	Access denied <cfabort>
</cfif>

<cfif url.action eq 'addContentBlock'>
	<cfparam name="url.sectionName" default="">
    <cfquery datasource="#request.dsn#" name="qGetOrder">
    	select orderNum from content where contentSection = '#url.sectionName#' order by orderNum desc
    </cfquery>
    <cfif qGetOrder.recordCount>
		<cfset newOrder = qGetOrder.orderNum + 1>
    <cfelse>
    	<cfset newOrder = 1>
	</cfif>
    <cfquery datasource="#request.dsn#" name="qAddContentBlock">
    	insert into content ( contentSection , orderNum ) 
        values ( '#url.sectionName#' , '#newOrder#' ) 
    </cfquery>
    <cflocation url="#cgi.HTTP_REFERER#" addtoken="no">
</cfif>

<cfif url.action eq 'editContent'>
	<cfparam name="url.cid" default="0" type="numeric"	>
    <cfquery datasource="#request.dsn#" name="qUpdateContent">
    	update content set contentName = '#form.title#', content = '#form.content#' 
        where contentId = #url.cid#
    </cfquery>
    <cfset session.editing = 0>
    <cflocation url="#cgi.HTTP_REFERER#" addtoken="no">
</cfif>

<cfif url.action eq 'setEdit'>
	<cfparam name="url.cid" default="0" type="numeric"	>
	<cfset session.editing = url.cid>
    <cflocation url="#cgi.HTTP_REFERER#" addtoken="no">
</cfif>

<cfif url.action eq 'deleteContent'>
	<cfparam name="url.cid" default="0" type="numeric"	>
    <cfquery datasource="#request.dsn#" name="qUpdateContent">
    	delete from content
        where contentId = #url.cid#
    </cfquery>
    <cflocation url="#cgi.HTTP_REFERER#" addtoken="no">
</cfif>

<cfif url.action eq 'editOn'>
	<cfset session.editMode = 1>
    <cflocation url="#cgi.HTTP_REFERER#" addtoken="no">
</cfif>

<cfif url.action eq 'editOff'>
	<cfset session.editMode = 0>
    <cflocation url="#cgi.HTTP_REFERER#" addtoken="no">
</cfif>