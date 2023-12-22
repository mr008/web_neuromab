<cfapplication name="neuromab_v2_0" sessionmanagement="yes"
sessionTimeout = #CreateTimeSpan(0, 0, 20, 0)# >

<cfscript>

	request.dsn 		= 'neuromab';
	request.email		= 'neuromab@ucdavis.edu';
	//session.editMode = 1;
	
</cfscript>

<cfparam name="session.editMode" default="0">
<cfparam name="session.authenticated" default="0">
<cfparam name="session.isAdmin" default="0">
<cfparam name="session.userQuery" default="structNew()">
