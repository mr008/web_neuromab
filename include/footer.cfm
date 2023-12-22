<CFSET Year = DateFormat(Now(), "YYYY")>
        
    </td>
</tr>
<tr>
	<td colspan="3" style="height:25px;"></td>
</tr>
<tr>
	<td colspan="2"></td>
	<td colspan="1" style="text-align:center" class="footerText">
    	&copy; Copyright <CFOUTPUT>#Year#</CFOUTPUT>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <cfif session.isAdmin>
			<cfif session.editMode>
				<a href="contentHandler.cfm?action=editOff">[turn edit mode off]</a>
			<cfelse>
	            <a href="contentHandler.cfm?action=editOn">[turn edit mode on]</a>
			</cfif>
		</cfif>
        
    </td>
</tr>
</table>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-90307-7']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<script type="text/javascript">
     $(window).load(function() {
         $('#featured').orbit({
			animation: 'fade',
			animationSpeed: 800,
			timer: true,
			advanceSpeed: 8000,
     		pauseOnHover: false,
     		startClockOnMouseOut: false,
     		startClockOnMouseOutAfter: 1000,
     		directionalNav: true,
    		captions: true,
     		captionAnimation: 'fade',
     		captionAnimationSpeed: 800,
     		bullets: false,
     		bulletThumbs: false,
     		bulletThumbLocation: ''
		 });
     });
</script>

</body>
</html>


<cfsetting showdebugoutput="no">
<!---
<cfinclude template="../../serverinclude/server.cfm">--->