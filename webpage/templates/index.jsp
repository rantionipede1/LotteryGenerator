<!DOCTYPE html> 
<html>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
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


            .lottery_form div {
                display: flex;
                align-items: center;
                justify-content: center;
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

        <form class="age_form" id="ageform" name="ageform" action="" style="display: block;">
            <fieldset>
                <legend> Enter your age below: </legend>
                <input class="age_input" name="userage" type="text" id="userage" >
                <div class="error_msg" id="ageerror"> </div>
                <input name="submitage" id="submitage" type="submit" value="Submit"  >
            </fieldset>
        </form>

        <form class="number_of_games_form" id ="numgamesform" name="number-of-games">
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
                <input type="submit" value="Submit" onclick="formSubmitted('number-of-games-form')">
            </fieldset>
        </form> 

        <form class="lottery_form" id = "lotteryform" name="lottery">
            <fieldset>
                <legend id = "game-number" style="margin:0 auto 0;"> Game: 1/5 </legend>
                <legend>Enter Lottery Number</legend>
                <div class = "flex-container">
                    <input class='number_field' type="number" pattern="[0-9]*"  value="" inputtype="numeric" autocomplete="lottery-form" id="num-1" required>
                    <input class='number_field' type="number" pattern="[0-9]*"  value="" inputtype="numeric" id="num-2" required>
                    <input class='number_field' type="number" pattern="[0-9]*"  value="" inputtype="numeric" id="num-3" required>
                    <input class='number_field' type="number" pattern="[0-9]*"  value="" inputtype="numeric" id="num-4" required>
                    <input class='number_field' type="number" pattern="[0-9]*"  value="" inputtype="numeric" id="num-5" required>
                    <input class='number_field' type="number" pattern="[0-9]*"  value="" inputtype="numeric" id="num-6" required>
                    <input class='number_field' type="number" pattern="[0-9]*"  value="" inputtype="numeric" id="num-7" required>
                </div>
                <div class='error_msg' id="lottery-error-message"> </div> 
                <div style="width:30%; margin: 0 auto 0;" >
                    <input type="submit" value="Generate" onclick="autoGenerate()">
                    <input type="submit" value="Submit" onclick="verifyNumbers">
                </div>
            </fieldset>           
        </form>

        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script type="text/javascript">

            function formSubmitted(elementId) {
                const element = document.getElementById(elementId);
                element.remove(); // Remove element
                if (element.id == 'ageform') {
                    showForm('numgamesform');
                } else if (element.id == 'numgamesform') {
                    showForm('lotteryform');
                }
            }

            function showForm(elementId) {
                const element = document.getElementById(elementId);
                element.style.display = "block";
            }

            function hideForm(elementId) {
                const element = document.getElementById(elementId);
                element.style.display = "none";
            }

            // jQuery Doc

            $(document).ready(function () {

                $.ajax({
                        url : 'InitServlet',
                        data : {},
                        success : function(returnValue) {
                            $('#ageerror').html(returnValue);
                            if (returnValue != "null") {
                                hideForm('ageform');
                                hideForm('numplaysform');
                                showForm('lotteryform');
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
            });

            function init() {
                showForm('ageform');
            }            
        </script>

    </body>
</html>
