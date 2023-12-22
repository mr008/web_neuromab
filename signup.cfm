
<cfparam name="errorMessage" default="">
<cfparam name="url.action" default="signup">

<cfif url.action eq 'save'>
	<cfscript>
    	if( len(trim(form.username)) eq 0 ){ errorMessage = errorMessage & 'Please specify a username.<br>'; }
		if( len(trim(form.password)) eq 0 ){ errorMessage = errorMessage & 'Please specify a password.<br>'; }
		if( len(trim(form.email)) eq 0 ){ errorMessage = errorMessage & 'Please specify an email address.<br>'; }
		if( trim(form.email) neq trim(form.email_confirm) ){ errorMessage = errorMessage & 'Email addresses do not match.<br>'; }
		if( trim(form.password) neq trim(form.password_confirm) ){ errorMessage = errorMessage & 'Passwords do not match.<br>'; }
    </cfscript>
    <cfif len(trim(errorMessage))>
		<cfset url.action = 'signup'>
    <cfelse>
    	<cfquery datasource="#request.dsn#" name="qInsert">
        	insert into tblMembers (
            	username,
                email,
                password,
                title,
                name,
                department,
                institution,
                address,
                city,
                usstate,
                zip,
                phone,
                fax
            )
            values(
            	'#trim(form.username)#',
                '#trim(form.email)#',
                '#trim(form.password)#',
                '#trim(form.title)#',
                '#trim(form.name)#',
                '#trim(form.department)#',
                '#trim(form.institution)#',
                '#trim(form.address)#',
                '#trim(form.city)#',
                '#trim(form.usstate)#',
                '#trim(form.zip)#',
                '#trim(form.phone)#',
                '#trim(form.fax)#'
            )
        </cfquery>
    	<cfset url.action = 'signupComplete'>
	</cfif>
</cfif>

<!--- page header --->
<cfinclude template="include/header.cfm">
        
        
        <cfif url.action eq 'signupComplete'>
			<div style="height:25px;"> </div>
            <table width="100%">
                <tr>
                    <td class="contentHeader">
                        Sign up complete!
                    </td>
                </tr>
                <tr>
                    <td class="translucentbkg">
                        <div class="opaquetext">
                        
                        Sign up is complete, welcome to NeuroMab!
                        <br /><br />
                        <a href="login.cfm?return=suggestions.cfm">Click here to login to NeuroMab</a>
                        <br /><br />
                            
                        </div>
                    </td>
                </tr>
            </table>
		</cfif>
              
        
        <cfif url.action eq 'signup'>
        
        	<cf_contentSection sectionName="signup">
                
            </cf_contentSection>  
        
            <div style="height:25px;"> </div>
                <table width="100%">
                    <cfparam name="form.username" default="">
                    <cfparam name="form.password" default="">
                    <cfparam name="form.password_confirm" default="">
                    <cfparam name="form.email" default="">
                    <cfparam name="form.email_confirm" default="">
                    <cfparam name="form.name" default="">
                    <cfparam name="form.Institution" default="">
                    <cfparam name="form.Department" default="">
                    <cfparam name="form.Title" default="">
                    <cfparam name="form.address" default="">
                    <cfparam name="form.city" default="">
                    <cfparam name="form.usstate" default="">
                    <cfparam name="form.zip" default="">
                    <cfparam name="form.phone" default="">
                    <cfparam name="form.fax" default="">
                    
                    <cfoutput>
                    <form action="signup.cfm?action=save" method="post">
                    <tr>
                        <td class="contentHeader">
                            Member sign up
                        </td>
                    </tr>
                    <tr>
                        <td class="translucentbkg">
                            <div class="opaquetext">
                                
                                <cfif len(trim(errorMessage))>
                                	Oops! <br />
                                    <span style="color:##990000">
                                    #errorMessage#
                                    </span><br /><br />
                                </cfif>
                                
                                <table width="100%">
                                    <tr>
                                        <td>Username</td>
                                        <td>
                                            <input name="username" type="text" value="#form.username#" size="15" maxlength="15"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Password</td>
                                        <td>
                                            <input name="password" type="password" value="#form.password#" size="16" maxlength="16"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Confirm Password</td>
                                        <td>
                                            <input name="password_confirm" type="password" value="#form.password_confirm#" size="16" maxlength="16"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Email</td>
                                        <td>
                                            <input name="email" type="text" style="width:100%;" value="#form.email#" size="45" maxlength="45"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Confirm Email</td>
                                        <td>
                                            <input name="email_confirm" type="text" style="width:100%;" value="#form.email_confirm#" size="45" maxlength="45"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Name</td>
                                        <td>
                                            <input name="name" type="text" style="width:100%;" value="#form.name#" size="45" maxlength="45"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Institution</td>
                                        <td>
                                            <input name="Institution" type="text" style="width:100%;" value="#form.Institution#" size="45" maxlength="45"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Department</td>
                                        <td>
                                            <input name="Department" type="text" style="width:100%;" value="#form.Department#" size="45" maxlength="45"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Title</td>
                                        <td>
                                            <input name="Title" type="text" style="width:100%;" value="#form.Title#" size="45" maxlength="45"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Street Address</td>
                                        <td>
                                            <input name="address" type="text" style="width:100%;" value="#form.address#" size="45" maxlength="45"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>City</td>
                                        <td>
                                            <input name="city" type="text" style="width:100%;" value="#form.city#" size="45" maxlength="45"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>State</td>
                                        <td>
                                            <input name="usstate" type="text" style="width:50px;" value="#form.usstate#" maxlength="2"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Zip</td>
                                        <td>
                                            <input type="text" name="zip" value="#form.zip#" style="width:150px;" maxlength="10"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Phone (just numbers)</td>
                                        <td>
                                            <input type="text" name="phone" value="#form.phone#" style="width:250px;" maxlength="20"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Fax (just numbers)</td>
                                        <td>
                                            <input type="text" name="fax" value="#form.fax#" style="width:250px;" maxlength="20"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <input type="submit" value="Sign-up" />
                                        </td>
                                    </tr>
                                </table>
                                
                            </div>
                        </td>
                    </tr>
                    </form>
                    </cfoutput>
                </table>
        </cfif>
<!--- page header --->
<cfinclude template="include/footer.cfm">
        