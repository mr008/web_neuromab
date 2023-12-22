<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>
<!--- Dump out the server scope. --->
<cfdump var="#SERVER#" />
 

<!--- Store the ColdFusion version. --->
<cfset strVersion = SERVER.ColdFusion.ProductVersion />
 

<!--- Store the ColdFusion level. --->
<cfset strLevel = SERVER.ColdFusion.ProductLevel />

</body>
</html>
