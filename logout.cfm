
<cfset session.authenticated = 0>
<cfset session.isAdmin = 0 >
<cfset session.editMode = 0>

<cflocation url="login.cfm" addtoken="no">
