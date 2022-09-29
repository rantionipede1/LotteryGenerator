<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html> 
<html>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="ISO-8859-1"> 
    <head> 
        <title>Lottery</title> 
        <style>
            .page_logo {
                display:block;
                padding: 0;
                margin: 0;
                overflow-wrap: normal;
                font-size: 3em;
                font-family: tahoma;
                color: blue;
            }

            [class*="_form"] {
                display:none;
                margin: 0em auto 3em;
                padding: 1em auto;
            }

            [class*="_form"] legend {
                display:block;
                text-align: center;
                margin: 1em auto;

                font-family: arial;
                font-size: 1em;
                overflow-wrap: break-word;
            }

            [class*="_form"] fieldset {
                position: block;
                margin: 0;
                padding: 0;
                border: 0;
            }

            [class*="_form"] input[type="submit"] {
                display: block;
                width: 200px;
                height: 50px;
                margin: 20px auto;
                
                background-color: #183EFA;
                color: white;
                font-size: 1em;
                border-radius: 8px;
                transition-duration: 0.4s;
                border: none;
            }

            input[type="submit"]:active {
                transform: scale(.93);
            }

            .age_input {
                display:block;
                margin-left: auto;
                margin-right: auto;
                text-align: center;
            }

            .number_input {
                display:block;
                margin-left: auto;
                margin-right: auto;
            }

            .number_select {
                display:block;
                margin-left: auto;
                margin-right: auto;
            }

            .number_field {
                margin: .2em;
                padding: 8px 0 4px;
                width: 2em;
                height: 2em;

                font-size: 100%;
                text-align: center;
                font-family: arial;
                color: blue;

                appearance: textfield;
                border: 2px solid #BBBBFF;
                border-radius: 4px;
            }

			.tab {
			  margin: 0 auto 0;
			  width:30%;
			  display: flex;
			  overflow: hidden;
			  justify-content:space-around;
			  align-items: center;
			}
			
			.tab button {
			  background-color: rgba(255,255,255, 0.3);
			  float: left;
			  border: none;
			  outline: none;
			  cursor: pointer;
			  padding: 14px 16px;
			  transition: 0.3s;
			}
			
			.tab button:hover {
			  background-color: #ddd;
			}
			
			/* Create an active/current tablink class */
			.tab button.active {
			  background-color: #ccc;
			}
			
            .lftabcontent {
            	display: none;
            	text-align: center;
            }	
			
            .manual_content {
                display: flex;
                align-items: center;
                justify-content: center;
            }
            
            .generated_content {
            	margin: .5em auto;
            	text-align: center;
            	font-size: 2em;
            	font-family: arial;
            	color: blue;
            }
            
            .error_msg {
                margin: 0 auto 0;
                padding: 0;
                text-align: center;
                font-family: arial;
                color: red;
            }
        </style>
    </head>
    <body>
        <a class='page_logo' href="../cmsc495/index.jsp" style="text-decoration: none;" id="logo">
            Lottery Generator 
        </a>

        <form class="age_form" id="ageform" name="ageform" action="">
            <fieldset>
                <legend> Enter your age below: </legend>
                <input class="age_input" name="userage" type="text" id="userage" >
                <div class="error_msg" id="ageerror"> </div>
                <input name="submitage" id="submitage" type="submit" value="Submit"  >
            </fieldset>
        </form>

        <form class="number_of_plays_form" id ="numplaysform" name="number-of-plays">
            <fieldset>
                <legend> How many games would you like to play? (Max: 5 games): </legend>
                <select class="number_select" name="plays" id="plays" style="background-color: white;">
                    <option value="1" selected="selected">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
                <div class="error_msg" id="numplayserror"> </div>
                <input type="submit" value="Submit" >
            </fieldset>
        </form> 

        <form class="lottery_form" id = "lotteryform" name="lottery">
            <fieldset>
                <legend id = "gamenumber" style="margin:0 auto 0;"> Game: 1/5 </legend>
                
                <div class="tab">
					 <button class="tablinks" id="generatetab" onclick="showGenerate(event)">Generate</button>
					 <button class="tablinks" id="manualtab" onclick="showManual(event)">Manual Input</button>
				</div>
                <div style="display:flex; justify-content:space-around; align-items: center; width:50%; margin: 0 auto 0;">
	                <div class='lftabcontent' id='generated'>
	                	<legend> Auto-generate </legend>
		                <div class = "generated_content" id="generated_content">
		                    1 1 1 1 1 1 1
		                </div>
		                <input type="submit" value="Generate" onclick="autoGenerate()">
	                </div>
	                <div class='lftabcontent' id='manual'>
	                	<legend> Manual Input </legend>
						<div class = "manual_content" id="manual_content"">
						    <input class='number_field' type="number" pattern="[0-9]*"  value="" inputtype="numeric" autocomplete="lottery-form" id="num-1" required>
						    <input class='number_field' type="number" pattern="[0-9]*"  value="" inputtype="numeric" id="num-2" required>
						    <input class='number_field' type="number" pattern="[0-9]*"  value="" inputtype="numeric" id="num-3" required>
						    <input class='number_field' type="number" pattern="[0-9]*"  value="" inputtype="numeric" id="num-4" required>
						    <input class='number_field' type="number" pattern="[0-9]*"  value="" inputtype="numeric" id="num-5" required>
						    <input class='number_field' type="number" pattern="[0-9]*"  value="" inputtype="numeric" id="num-6" required>
						    <input class='number_field' type="number" pattern="[0-9]*"  value="" inputtype="numeric" id="num-7" required>
						</div>
						<input type="submit" value="Submit" onclick="verifyNumbers">
					</div>
				</div>
                
                <div class='error_msg' id="lottery-error-message"> </div> 

            </fieldset>           
        </form>

        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script type="text/javascript">
        
        	var plays;
        	var playsRemaining;

            function formSubmitted(elementId) {
                const element = document.getElementById(elementId);
                element.remove(); // Remove element
                if (element.id == 'ageform') {
                    showElement('numplaysform');
                } else if (element.id == 'numplaysform') {
                	updateLotteryForm();
                    showElement('lotteryform');
                }
            }

            function showElement(elementId) {
                const element = document.getElementById(elementId);
                element.style.display = "block";
            }

            function hideElement(elementId) {
                const element = document.getElementById(elementId);
                element.style.display = "none";
            }
            
            function showGenerate (event) {
            	event.preventDefault();
            	document.getElementById('manual').style.display = 'none';
            	document.getElementById('generated').style.display = 'block'
            }
            
            function showManual (event) {
            	event.preventDefault();
            	document.getElementById('manual').style.display = 'block';
            	document.getElementById('generated').style.display = 'none'
            }
          
            function updateLotteryForm() {
            	document.getElementById('gamenumber').innerHTML = "Game: ${plays-(playsRemaining-1)}/${plays}";
  				//display "Plays remaining: (playsRemaining)/(plays)"
  				//set input fields to default value;
            }

            // jQuery Doc

            $(document).ready(function () {
               
                $.ajax({
                    url : 'SessionServlet',
                    data : {},
                    success : function(returnValue) {
                        if (returnValue != "") {
                        	const data = returnValue.split(',');
                        	playsRemaining = data[0];
                        	plays = data[1];
                        	
                            formSubmitted('numplaysform');
                        } else {
                        	showElement('ageform');
                        }
                    }
            	});
                

                $('#ageform').submit(function(event) {
                    event.preventDefault();

                    $.ajax({
                        url : 'VerifyAgeServlet',
                        data : {
                            userName : $("#userage").val()
                        },
                        success : function(returnValue) {
                            if (returnValue == "true") {
                                formSubmitted("ageform");
                            } else {
                                $('#ageerror').html("Sorry, you are not yet old enough to play!");
                            }
                        }
                    }); 
                });


                $('#numplaysform').submit(function(event) {
                    event.preventDefault();
					
                 	var val = $("#plays").val();
                    $.ajax({
                        url : 'NumPlaysServlet',
                        data : {
                            plays : val
                        },
                        success : function(returnValue) {
                            if (returnValue == "true") {
                            	playsRemaining = parseInt(val);
                            	plays = parseInt(val);
                            	hideElement('numplaysform');
                            	showElement('lotteryform');
                            	
                            	var play = (plays-(playsRemaining-1)).toString();
                            	var total = plays.toString();
                            	
                            	document.getElementById('gamenumber').innerHTML = "Game: " + play + "/" + total;
                            	document.getElementById('numplaysform').remove();
                            	showElement('lotteryform');
                                
                            } else {
                                $('#numplayserror').html("Error ...");
                            }
                        }
                    }); 
                });
            });  
        </script>

    </body>
</html>
