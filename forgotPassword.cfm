
<cfparam name="url.action" default="forgot">
<cfparam name="errorMessage" default="">

<cfif url.action eq 'send'>
	<cfquery datasource="#request.dsn#" name="qUser">
    	select * from tblMembers where email = '#trim(form.email)#'
    </cfquery>
	<cfif qUser.recordCount>
    	<cfoutput>
		<cfmail to="#qUser.email#" subject="Your Neuromab password" from="#request.email#">
        	Your password is : #qUser.password#
        </cfmail>
        </cfoutput>
        <cfset url.action = 'sent'>
    <cfelse>
    	<cfset errorMessage = 'Sorry, we didnt find that email address as a registered user.<br>Please try again<br>'>    
        <cfset url.action = 'forgot'>
	</cfif>
</cfif>

<!--- page header --->
<cfinclude template="include/header.cfm">
        
        <cfif url.action eq 'sent'>
            <div style="height:25px;"> </div>
            <table width="100%">
                <tr>
                    <td class="contentHeader">
                        Password sent
                    </td>
                </tr>
                <tr>
                    <td class="translucentbkg">
                        <div class="opaquetext">
                        
                            Your password has been sent to your email address.
                            <br /><br />
                            [ <a href="login.cfm">Click here to login</a> ]
                            
                        </div>
                    </td>
                </tr>
            </table>
        </cfif>
        
        <cfif url.action eq 'forgot'>
            <div style="height:25px;"> </div>
            <table width="100%">
                <tr>
                    <td class="contentHeader">
                        Forgot password
                    </td>
                </tr>
                <tr>
                	<cfoutput>
                    <cfparam name="form.email" default="">
                    <form action="forgotPassword.cfm?action=send" method="post">
                    <td class="translucentbkg">
                        <div class="opaquetext">
                        
                        <cfif len(trim(errorMessage))>
                            <span style="color:##990000">
                            #errorMessage#
                            </span><br /><br />
                        </cfif>
                        
                        Enter your email address below and your password will be sent to your email account.
                        <br /><br />
                        <input type="text" name="email" value="#form.email#" style="width:250px;" />
                        <br />
                        <input type="submit" value="send password" style="width:200px;"/>
                            
                        </div>
                    </td>
                    </form>
                    </cfoutput>
                </tr>
            </table>
        </cfif>
                
<!--- page header --->
<cfinclude template="include/footer.cfm">
        