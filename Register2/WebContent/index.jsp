<%@ page  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="js/bootstrap.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script type="text/javascript">

	function registerCheckFunction(){
		var userID = $('#userID').val();
		
		$.ajax({
			type: "POST",
			url : "./UserRegisterCheckServlet",
			data : {userID : userID},
			success : function(result){
				if(result == 1){
					$('#checkModalMessage').html("Available ID");
				}else{
					$('#checkModalMessage').html("Inavailable ID");
				}
				$('#checkModal').modal("show");
			}
		});
	}
	
	function passwordCheckFunction(){
		var userPassword1 = $("#userPassword1").val();
		var userPassword2 = $("#userPassword2").val();
		if(userPassword1 != userPassword2){
			$("#passwordCheckMessage").html("The passwords you input are different each other");
		}else{
			$("#passwordCheckMessage").html("");
		}
	}
	
	
	
	
	
	
	</script>
    <title>Hello World!</title>
  </head>
  <body>
  		<div class="container" style="margin:40px;">
  			<form method="Post" action="./UserRegisterServlet">
  				<table class="table">
				  <thead class="thead-light">
				    <tr style="text-align:center">
				      <th scope="col"></th>
				      <th colspan="3" scope="col">New Account Form</th>
				      <th scope="col"></th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <td style="width:100px;">ID</td>
				      <td><input class="form-control" type="text" maxlength="20" id = "userID" name ="userID" placeholder="Please input ID"></td>
				      <td><button class="btn btn-primary" onclick="registerCheckFunction();" type="button">Check Button</button></td>
				    </tr>
				    <tr>
				      <td style="width:100px;">Password</td>
				      <td><input class="form-control" type="password" maxlength="20" onkeyup="passwordCheckFunction();" id = "userPassword1" name ="userPassword1" placeholder="Please input Password"></td>
				    </tr>
				    <tr>
				      <td style="width:100px;">Password Check</td>
				      <td><input class="form-control" type="password" maxlength="20" onkeyup="passwordCheckFunction();" id = "userPassword2" name ="userPassword2" placeholder="Please check Password"></td>
				    </tr>
				    <tr>
				      <td style="width:100px;">Name</td>
				      <td><input class="form-control" type="text" maxlength="20" id = "userName" name ="userName" placeholder="Please input Name"></td>
				    </tr>
				    <tr>
				      <td style="width:100px;">Age</td>
				      <td><input class="form-control" type="text" maxlength="20" id = "userAge" name ="userAge" placeholder="Please input Age"></td>
				    </tr>
				    <tr>
				      <td style="width:100px;">Gender</td>
				      <td>
				      	<div class="form-group" style="text=align:center;">
				      		<div class="btn-group" data-toggle="buttons">
				      			<label class="btn btn-primary active">
				      				<input type="radio" id="userGender" name ="userGender" value="Male" autocomplete="off" checked >Male
				      			</label>
				      			<label class="btn btn-primary">
				      				<input type="radio" id="userGender" name ="userGender" value="Female" autocomplete="off"  >Female
				      			</label>	
				      		</div>
				     	 </div>
				      </td>
				    </tr>
				    <tr>
				      <td style="width:100px;">Email</td>
				      <td><input class="form-control" type="email" maxlength="20" id = "userEmail" name ="userEmail" placeholder="Please input Email"></td>
				    </tr>
				    <tr>
				    	<td><input style="width:140px;" type="submit" class="btn btn-primary" value="New Account"></td>
				    	<td style="color:red;" id="passwordCheckMessage" colspan="3"></td>
				    </tr>
				  </tbody>
				</table>
  			</form>
  		</div>
  		
  		<%
  			String messageContent = null;
  			if(session.getAttribute("messageContent")!= null){
  				messageContent = (String)session.getAttribute("messageContent");
  			}
  			String messageType = null;
  			if(session.getAttribute("messageType")!=null){
  				messageType = (String)session.getAttribute("messageType");
  			}
  			
  			if(messageContent != null){
  				%>
  				<div class="modal" id="messageModal" tabindex="-1" role="dialog">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title"><%= messageType %></h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <p><%= messageContent %></p>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				  </div>
				</div>
				<script>
					$('#messageModal').modal("show");
				</script>
  				<%
  				session.removeAttribute("messageType");
  				session.removeAttribute("messageContent");
  			}
  		%>
  		
  		<div class="modal" id="checkModal" tabindex="-1" role="dialog">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title panel-warning">Check Message</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div id="checkModalMessage" class="modal-body">
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				  </div>
				</div>
  </body>
</html>