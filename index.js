function executeScript() {                                        
  var xhttp = new XMLHttpRequest();           
  xhttp.onreadystatechange = function() {                                               
    if (this.readyState == 4 && this.status == 200) 
  {                 
      console.log(this.responseText);           
    }                 };                                          xhttp.open("GET", "script.sh", true);  // Replace with the actual path to the script if necessary                                                   
  xhttp.send();                             
}
