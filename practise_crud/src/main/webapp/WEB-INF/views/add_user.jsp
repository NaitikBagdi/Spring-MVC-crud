<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="./base.jsp"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	
</head>
<body>
	<h2 class="text-center">Form</h2>
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
			
			<!-- Display success or error messages -->
				<c:if test="${not empty successMessage}">
					<div class="alert alert-success">${successMessage}</div>
				</c:if>
				<c:if test="${not empty errorMessage}">
					<div class="alert alert-danger">${errorMessage}</div>
				</c:if>

				<form action="list-user" method="post">
					<div class="form-group">
						<label for="firstName">First Name:</label> <input type="text"
							class="form-control" id="firstName" name="firstName">
					</div>
					<div class="form-group">
						<label for="lastName">Last Name:</label> <input type="text"
							class="form-control" id="lastName" name="lastName">
					</div>
					<div class="form-group">
						<label for="dob">Date of Birth:</label> <input type="date"
							class="form-control" id="dob" name="dateOfBirth">
					</div>
					<div class="form-group">
						<label for="mobile">Mobile:</label> <input type="text"
							class="form-control" id="mobile" name="mobile">
					</div>
					<div class="form-group">
						<label for="address1">Address 1:</label> <input type="text"
							class="form-control" id="address1" name="address1">
					</div>
					<div class="form-group">
						<label for="address2">Address 2:</label> <input type="text"
							class="form-control" id="address2" name="address2">
					</div>
					<div class="form-group">
						<label for="age">Age:</label> <input type="number"
							class="form-control" id="age" name="age">
					</div>
					<div class="form-group">
						<label for="gender">Gender:</label> <select class="form-control"
							id="gender" name="gender">
							<option value="male">Male</option>
							<option value="female">Female</option>
							<option value="other">Other</option>
						</select>
					</div>
					<div class="form-group">
						<label for="email">Email:</label> <input type="email"
							class="form-control" id="email" name="email">
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>