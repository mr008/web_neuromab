<cffunction name="makeRandomString" returnType="string" output="false">
	<cfset var chars = "23456789ABCDEFGHJKMNPQRS">
	<cfset var length = randRange(4,7)>
	<cfset var result = "">
	<cfset var i = "">
	<cfset var char = "">
	
	<cfscript>
	for(i=1; i <= length; i++) {
		char = mid(chars, randRange(1, len(chars)),1);
		result&=char;
	}
	</cfscript>
		
	<cfreturn result>
</cffunction>
<cfset captcha = makeRandomString()>
<cfset captchaHash = hash(captcha)>

<cfparam name="errorMessage" default="">
<cfparam name="url.action" default="signup">

<cfif url.action eq 'save'>
	<cfscript>
		if( len(trim(form.email)) eq 0 ){ errorMessage = errorMessage & 'Please specify an email address.<br>'; }
		if( trim(form.email) neq trim(form.email_confirm) ){ errorMessage = errorMessage & 'Email addresses do not match.<br>'; }
    </cfscript>
    <cfif len(trim(errorMessage))>
		<cfset url.action = 'signup'>
    <cfelse>
    	<cfquery datasource="#request.dsn#" name="qInsert">
        	insert into tblCatalogAdd (
                email,
                title,
                name,
                department,
                institution,
                address,
                city,
                usstate,
                zip,
                phone,
                fax,
                application
            )
            values(
                '#trim(form.email)#',
                '#trim(form.title)#',
                '#trim(form.name)#',
                '#trim(form.department)#',
                '#trim(form.institution)#',
                '#trim(form.address)#',
                '#trim(form.city)#',
                '#trim(form.usstate)#',
                '#trim(form.zip)#',
                '#trim(form.phone)#',
                '#trim(form.fax)#',
                '#trim(form.application)#'
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
                    <cfparam name="form.application" default="">
                    
                    <cfoutput>
                    <form action="subscribe.cfm?action=save" method="post">
                    <tr>
                        <td class="contentHeader">
                            Catalog Notification Sign Up
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
                                        <td>Email</td>
                                        <td>
                                            <input type="text" name="email" value="#form.email#" style="width:100%;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Confirm Email</td>
                                        <td>
                                            <input type="text" name="email_confirm" value="#form.email_confirm#" style="width:100%;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Name</td>
                                        <td>
                                            <input type="text" name="name" value="#form.name#" style="width:100%;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Institution</td>
                                        <td>
                                            <input type="text" name="Institution" value="#form.Institution#" style="width:100%;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Department</td>
                                        <td>
                                            <input type="text" name="Department" value="#form.Department#" style="width:100%;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Title</td>
                                        <td>
                                            <input type="text" name="Title" value="#form.Title#" style="width:100%;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Street Address</td>
                                        <td>
                                            <input type="text" name="address" value="#form.address#" style="width:100%;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>City</td>
                                        <td>
                                            <input type="text" name="city" value="#form.city#" style="width:100%;"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>State</td>
                                        <td>
                                            <input type="text" name="usstate" value="#form.usstate#" style="width:50px;" maxlength="2"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Zip</td>
                                        <td>
                                            <input type="text" name="zip" value="#form.zip#" style="width:150px;" maxlength="10"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Phone</td>
                                        <td>
                                            <input type="text" name="phone" value="#form.phone#" style="width:250px;" maxlength="14"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Fax</td>
                                        <td>
                                            <input type="text" name="fax" value="#form.fax#" style="width:250px;" maxlength="14"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Application</td>
                                        <td>
                                            <input type="text" name="application" value="#form.application#" style="width:250px;" maxlength="50"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Enter Text from below</td>
                                        <td>
                                            <input type="text" name="Captcha" value="" style="width:250px;" maxlength="50"/><br />
                                            	<CFOUTPUT>
    <cfimage action="captcha" width="300" height="75" text="#captcha#">
	<input type="hidden" name="captchaHash" value="#captchaHash#">
    </CFOUTPUT>

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
        