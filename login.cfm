
<cfparam name="errorMessage" default="">
<cfparam name="url.action" default="">
<cfparam name="url.return" default="index.cfm">

<cfif url.action eq 'login'>
	<cfquery datasource="#request.dsn#" name="qLogin">
    	select * from tblMembers where username = '#trim(form.username)#' and password = '#trim(form.password)#'
    </cfquery>
    <cfif qLogin.recordCount>
    	<cfset session.userQuery = qLogin>
        <cfset session.authenticated = 1>
        <cfoutput query="qLogin">
		<cfset session.email = #email#>
        </cfoutput>
                
        <cfif uCase(trim(qLogin.title)) eq 'ADMIN'>
        	<cfset session.editMode = 0>
            <cfset session.isAdmin = 1>
        <cfelse>
        	<cfset session.editMode = 0>
            <cfset session.isAdmin = 0> 
        </cfif>
        <cflocation url="#url.return#" addtoken="no">
	<cfelse>
    	<cfset errorMessage = "Username and/or password is incorrect.  Please try again.">
	</cfif>
</cfif>

<!--- page header --->
<cfinclude template="include/header.cfm">
    
    <cf_contentSection sectionName="suggestions_view">
        	
    </cf_contentSection>
    
	<div style="height:25px;"> </div>
    <table width="100%">
        <tr>
            <td class="contentHeader">
                NeuroMab Login
            </td>
        </tr>
        <tr>
            <td class="translucentbkg">
                <div class="opaquetext">
                
                <table width="400">
                	<cfoutput>
                	<form action="login.cfm?action=login&return=#url.return#" method="post">
                    </cfoutput>
                    <cfif len(trim(errorMessage))>
					<tr>
                    	<td colspan="2" style="color:#990000">
                        	<cfoutput>#errorMessage#</cfoutput>
                        </td>
                    </tr>
					</cfif>
                	<tr>
                    	<td>Username : </td>
                        <td>
                        	<input type="text" name="username" style="width:200px;" />
                        </td>
                    </tr>
                    <tr>
                    	<td>Password : </td>
                        <td>
                        	<input type="password" name="password" style="width:200px;" />
                        </td>
                    </tr>
                    <tr>
                    	<td></td>
                        <td>
                        	<input type="submit" value="login" />
                        </td>
                    </tr>
                    </form>
                </table>
                <br /><br />
                Not yet a member?  <br />[ <a href="signup.cfm">Click here to sign up!</a> ]
                <br /><br /><br />
                Forgot your password?  <br />[ <a href="forgotPassword.cfm">Click here to have your password emailed to you</a> ]
                </div>
            </td>
        </tr>
    </table>
                
<!--- page header --->
<cfinclude template="include/footer.cfm">