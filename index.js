const executeScript = () => {
  const xhttp = new XMLHttpRequest();

  xhttp.onreadystatechange = () => {
    if (xhttp.readyState === 4) {
      if (xhttp.status === 200) {
        console.log(xhttp.responseText);
      } else {
        console.error(`Error ${xhttp.status}: ${xhttp.statusText}`);
      }
    }
  };

  xhttp.open("GET", "script.sh", true); // Replace with the actual path to the script if necessary
  xhttp.send();
}

// Optional error handling for XMLHttpRequest constructor
if (typeof XMLHttpRequest === "undefined") {
  console.error("XMLHttpRequest is not supported");
} else {
  executeScript();
}
