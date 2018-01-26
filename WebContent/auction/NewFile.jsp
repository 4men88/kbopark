<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Datepicker - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $(document).ready(function(){
	  $("#datepicker1").datepicker({
	  numberOfMonths: 2,
	  onSelect: function(selected) {
	  $("#datepicker2").datepicker("option","minDate", selected)
	  }
	  });
	  
	  $("#datepicker2").datepicker({
	  numberOfMonths: 2,
	  onSelect: function(selected) {
	  $("#datepicker1").datepicker("option","maxDate", selected)
	  }
	  });
	  
	  });
  </script>
</head>
<body>
 
<p>Date: <input type="text" id="mdatepicker1"></p>
 
 
</body>
</html>