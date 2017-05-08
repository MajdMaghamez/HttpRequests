<cfsetting SHOWDEBUGOUTPUT="FALSE">
<!DOCTYPE HTML>
<html>
  <head>
    <meta charset="utf-8">
  </head>
  <body>
    <div>
      <label for="name">Enter your name:</label>
      <input type="text" id="name" />
      <button type="button" onClick="sendAjaxRequest1()">Send</button>
    </div>
    
    <br/><div id="demo1"></div><br/>
    
    <div>
      <button type="button" onClick="sendAjaxRequest2()">Show Date</button>
    </div>
    
    <br/><div id="demo2"></div><br/>
    
    <script type="text/javascript">
    
      // this is an example of an ajax post request that returns a string
      function sendAjaxRequest1 ()
      {
        var name = document.getElementById("name").value;
        var httpRequest = new XMLHttpRequest();
        
        httpRequest.onreadystatechange = function () {
         if ( this.readyState == 4 && this.status == 200 ) {
          document.getElementById("demo1").innerHTML = this.responseText;
         } 
        };
        
        httpRequest.open ( "POST", "server/call.cfc?method=DisplayMessage", true );
        httpRequest.setRequestHeader( "Content-type", "application/x-www-form-urlencoded" );
        httpRequest.send ( "name=" + name );
      };
      
      // this is an example of an ajax get request that returns an xml
      function sendAjaxRequest2 ()
      {
        var httpRequest = new XMLHttpRequest();
        
        httpRequest.onreadystatechange = function () {
          if ( this.readyState == 4 && this.status == 200 ) {
            var data = this.responseXML;
            var jObject = ParseXML ( data );
            var Date = "<p>" + jObject[0][1].Value + "/ " + jObject[2][1].Value + "/ " + jObject[1][1].Value + "</p>";
            document.getElementById("demo2").innerHTML = Date;
          }
        };
        
        httpRequest.open ( "GET", "server/call.cfc?method=DisplayTodayDate", true );
        httpRequest.overrideMimeType('application/xml');
        httpRequest.send();
      };
      
      function ParseXML ( XML )
      {
        var jArray = [];
        var XMLVariables = XML.getElementsByTagName("var");
        
        for ( var i = 0; i < XMLVariables.length; i++ ) {
          var ObjectArray = [];
          
          var Name = XMLVariables[i].getAttribute("name");
          var ObjectName = { Date : Name };
          
          var Values = XMLVariables[i].getElementsByTagName("string");
          var ObjectValue = { Value : Values[0].innerHTML };
          
          ObjectArray.push( ObjectName );
          ObjectArray.push( ObjectValue );
          jArray.push(ObjectArray);
        }
        return jArray;
      }
    </script>
  </body>
</html>
