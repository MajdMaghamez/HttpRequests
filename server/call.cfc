<cfcomponent output="false">
  
  <!--- this function is used for feeding the HttpRequest with responseText respond property --->
  
  <cffunction name="DisplayMessage" access="remote" returnformat="plain">
    <cfargument name="name" type="string">
    <cfreturn "Hello #arguments.name#, how are you ?">
  </cffunction>
  
  <!--- this function is used for feeding the HttpRequest with responseXML respond property --->
  
  <cffunction name="DisplayTodayDate" access="remote" returnformat="WDDX">
    <cfset var l = {}>
    <cfset l.Today = {
      Day   =   "#DatePart('d', NOW())# ",
      Month =   "#DatePart('m', NOW())# ",
      Year  =   "#DatePart('yyyy', NOW())# ",
    }
    
    <cfreturn l.Today>
  </cffunction>
  
</cfcomponent>
