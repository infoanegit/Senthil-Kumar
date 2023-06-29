<cfcomponent>
    <cfset this.name="zdghsdgha">
    <cfset this.sessionmanagement = "true">
    <cfset this.dataSource="sen_dsn">
   

    <cffunction name="onApplicationStart">
            <cfset application.userObj= createObject("component","tagcloud")>
        </cffunction>
    
    <cffunction name="onRequestStart">
      
    
        <cfif (NOT isDefined('session.role') AND listLast(cgi.SCRIPT_NAME, '/') EQ 'list.cfm') OR (NOT isDefined('session.role') AND listLast(cgi.SCRIPT_NAME, '/') EQ 'form.cfm') >
            <cflocation  url="index.cfm" addtoken="false">
        <cfelseif ( isDefined('session.role') AND listLast(cgi.SCRIPT_NAME, '/') EQ 'index.cfm')
        OR (( isDefined('session.role') AND  session.role EQ 'User')  AND listLast(cgi.SCRIPT_NAME, '/') EQ 'form.cfm')> 
            <cflocation  url="list.cfm" addtoken="false">
        
        <cfelseif (isDefined('session.role') AND ((  session.role EQ 'Admin' OR session.role EQ 'Editor') 
          AND listLast(cgi.SCRIPT_NAME, '/') EQ 'index.cfm'))> 
            <cflocation  url="list.cfm" addtoken="false">
        <cfelseif (isDefined('session.role') AND ((  session.role EQ 'Admin' OR session.role EQ 'Editor') 
          AND listLast(cgi.SCRIPT_NAME, '/') EQ 'index.cfm'))> 
            <cflocation  url="list.cfm" addtoken="false">
        </cfif>
    </cffunction>


</cfcomponent>