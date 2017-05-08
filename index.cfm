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
    </script>
  </body>
</html>
