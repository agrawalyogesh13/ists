<!DOCTYPE html>
<html>
<head>
    <style type="text/css">
        .solution{
            display:none;
            border: 1px solid black;
        }
    </style>
</head>

<body>
    <button id="btnsolution1" onclick="show(1)" value="Show" >Show Solution</button>
    <div class="solution" id="solution1">
        <p>This is Solution 1</p>
    </div>
    <button id="btnsolution2" onclick="show(2)">Show Solution</button>
    <div class="solution" id="solution2">
        <p>This is Solution 2</p>
    </div>
    <button id="btnsolution3" onclick="show(3)">Show Solution</button>
    <div class="solution" id="solution3">
        <p>This is Solution 3</p>
    </div>
    <script type="text/javascript">
        
        function show(x){
            var button = document.getElementById("btnsolution"+x);
            
            if(button.innerHTML=="Show Solution"){
                button.innerHTML="HideSolution";
                document.getElementById("solution"+x).style.display = "table";
            }
            else{
                button.innerHTML="Show Solution";
                document.getElementById("solution"+x).style.display = "none";
            }   
        }
        
    </script>
    
</body>
</html>