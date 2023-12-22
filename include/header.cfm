<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico">
<title>Welcome to NeuroMab!</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="/include/jquery/jquery.orbit-1.2.3.min.js"></script>
<link rel="stylesheet" href="/include/orbit-1.2.3.css">
</head>
<style>
	body
	{ 
		background-image: url(images/brain_logo.jpg);
		background-repeat: no-repeat;
		background-attachment:fixed;
		background-position: bottom left
	}
	.topNavCell{
		background-color:#ed1e24; 
		color:#FFFFFF; 
		font-family:Arial, Helvetica, sans-serif; font-size:12px; 
		font-weight:bold; 
		padding-left:20px; 
		padding-right:20px; 
		padding-top:10px; 
		padding-bottom:10px;
	}
	.topNavCell a{ 
		text-decoration:none; color:#FFFFFF;
	}
	.topNavCell a:hover{ 
		text-decoration:none; color:#333333;
	}
	.searchCell{
		font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#666666; 
		text-align:right;
	}
	.userCell{
		font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#666666; 
		text-align:left;
	}
	.searchBox{
		border-style:solid; border-color:#666666; border-width:1px;
		width:200px;
	}
	.contentBody{ background-color:#CCCCCC; color:#000000;
		<!--- filter: alpha(opacity=50);
		-moz-opacity:50% --->
	}
	.contentBodyText{ color:#333333 }
	.translucentbkg {
	   width: 800px; 
	   background-image: url(images/trans_bg.png) !important;  /* Mozilla only */
	   background-color: transparent !important;           /* Mozilla only */
	   background-image: none;                             /* IE only */
	   background-color: #ffffff;                          /* IE only */
	   filter:alpha(opacity=20);                           /* IE only */
   }
	.opaquetext { 
		position: relative;		
		font-family:Arial, Helvetica, sans-serif; font-size:14px; color:#333333; padding: 10px 10px 10px 10px; width:95%; 
	}
	.contentHeader{ 
		font-family:Arial, Helvetica, sans-serif; font-size:16px; color:#ffffff; font-weight:bold; 
		background-color:#3d92cf; padding: 10px 10px 10px 10px;
		background-image: url(images/section_bg.jpg) !important; background-repeat:repeat-x;
		
	}
	.leftNav{ text-align:center; color:#666666; font-family:Arial, Helvetica, sans-serif; font-size:12px;
	}
	.leftNav a{ text-decoration:none; color:#666666;}
	.leftNav a:hover{ text-decoration:underline; color:#666666;}
	.footerText{ font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#000000; } 
	a { font-family:Arial, Helvetica, sans-serif; };
	.catalogPreText{
		font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#666666; 
		text-align:left;
	}
	.opaquetext input{ width:100%; }
	/*div .x-grid-cell-text{white-space:normal;display:block;}*/
	/* Prevents slides from flashing */
    #slides {
      display:none;
    }

</style>

<style>
td.x-grid-col {
white-space: normal !Important;

}
</style>

<body>

<table border="0">
<tr>
	<td valign="top" style="width:100; text-align:left;">
    	<a href="index.cfm"><img src="images/NeuroMabLogo2.jpg" alt="Click to go to Neuromab Home" border="0" width="100" /></a>

        <div class="leftNav">
            <br />
<!---            <a href="sequences.cfm">Recombinant NeuroMabs</a>
			<br /><br />
--->            <a href="arrayTomography.cfm">Array Tomography</a>
            <br /><br />
            <a href="modelOrganisms.cfm">Model Organisms</a>
			<br /><br />
            <a href="diseaseTargets.cfm">Disease Targets</a>
			<br /><br />
            <a href="contributors.cfm">Contributors</a>
            <br /><br />
            <a href="advisoryBoard.cfm">Advisory Board</a>
            <br /><br />
            <a href="aboutUs.cfm">About Us</a>
   			<br /><br />

            <cfif session.isAdmin>
            	<br /><br />
				<cfif session.editMode>
                    [ <a href="contentHandler.cfm?action=editOff">turn edit mode off</a> ]
                <cfelse>
                    [ <a href="contentHandler.cfm?action=editOn">turn edit mode on</a> ]
                </cfif>
                <!--- <br /><br />
                [ <a href="members.cfm">edit members</a> ] --->
            </cfif>
        </div>
    	<a href="http://www.ucdavis.edu/"><img src="images/expanded_logo_1_blue.gif" alt="Click to go to UC Davis Home" border="0" width="100" /></a>
    </td>
    <td style="width:20px;">
    	<!--- layout spacer --->
    	&nbsp;
    </td>
    <td valign="top">
    	
        <table>
        	<tr>
            	<td class="topNavCell">
                	
                	<a href="index.cfm">Home</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="news.cfm">News</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="neuromabs.cfm">NeuroMabs</a>
<!---                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="currentProjects.cfm">Current Projects</a>
--->                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="protocols.cfm">Protocols</a>
<!---                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="suggestions.cfm">Suggestions</a>
--->                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="publications.cfm">Publications</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="brain.cfm">BRAIN Initiative</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                   <a href="contactUs.cfm">Contact Us</a>
                </td>
            </tr>
            <tr>
            	<td>
                	
                    <table width="100%">
                    	<tr>
                        	<td class="userCell">
                            	<cfif session.authenticated>
									<cfoutput>#session.userQuery.name#</cfoutput>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									
                                    [ <a href="logout.cfm">log out</a> ]
								</cfif>
                            </td>
                            <cfparam name="form.keywords" default="">
                             <form action="publications.cfm" method="post">
                            <td class="searchCell">
                            	Search Publications : 
                                <input type="text" name="keywords" value="<cfoutput>#form.keywords#</cfoutput>" class="searchBox" style="height:18px;"/>
                                <input type="submit" value="go" class="searchBox" style="width:50px; height:22px;" />
                            </td>
                            </form>

                            <form action="neuromabs.cfm" method="post">
                            <td class="searchCell">
                            	Search for NeuroMabs : 
                                <input type="text" name="keywords" value="<cfoutput>#form.keywords#</cfoutput>" class="searchBox" style="height:18px;"/>
                                <input type="submit" value="go" class="searchBox" style="width:50px; height:22px;" />
                            </td>
                            </form>
                        </tr>
                    </table>
                
                	
                </td>
            </tr>
        </table>