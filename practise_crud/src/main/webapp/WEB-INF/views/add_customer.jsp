<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${title}</title>
<%@include file="./base.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="/customercrud/static/css/style.css">
</head>
<body>
	<div id="customerFormContainer">
		<div class="page-wrapper p-t-100 p-t-15 font-poppins">
			<div class="wrapper wrapper--w680">
				<div class="card card-4">
					<div class="card-body">
						<h2 class="title">Add customer</h2>
						<form action="list-customer" name="customerForm" id="formId"
							method="POST" onsubmit="addCustomer(event)">
							<div class="row row-space">
								<div class="col-2">
								<input type="hidden" value="0" name="id" id="userId" >
									<div class="input-group">
										<label class="label">*first name</label> <input
											class="input--style-4" type="text" name="firstName"
											id="firstname" onblur="validateFirstNameField()"
											oninput="validateFirstNameField()"> <span
											id="firstname-message"></span>
									</div>
								</div>
								<div class="col-2">
									<div class="input-group">
										<label class="label">*last name</label> <input
											class="input--style-4" type="text" name="lastName"
											id="lastname" oninput="validateLastnameField()"
											onblur="validateLastnameField()"> <span
											id="lastname-message"></span>
									</div>
								</div>
							</div>
							<div class="row row-space">
								<div class="col-2">
									<div class="input-group">
										<label class="label">*Phone Number</label> <input
											class="input--style-4" type="text" name="mobile"
											id="contactnumber" onblur="validateContactNumberField()"
											oninput="validateContactNumberField()"> <span
											id="contact-message"></span>
									</div>
								</div>
								<div class="col-2">
									<div class="input-group">
										<label class="label">*Age</label> <input
											class="input--style-4" type="text" name="age" id="age"
											onblur="validateAgeField()" oninput="validateAgeField()">
										<span id="age-message"></span>
									</div>
								</div>
							</div>
							<div class="row row-space">
								<div class="col-2">
									<div class="input-group">
										<label class="label">*Birthday</label>
										<div class="input-group-icon">
											<input class="birthday-style" type="date" name="dateOfBirth"
												id="dob" oninput="validateDateField()"
												onblur="validateDateField()"> <i
												class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
											<span id="dob-message"></span>
										</div>
									</div>
								</div>
								<div class="col-2">
									<div class="input-group">
										<label class="label">*Gender</label>
										<div class="p-t-10">
											<label class="radio-container m-r-45">Male <input
												type="radio" checked="checked" value="1" name="gender"
												onclick="validateForm()"> <span class="checkmark"></span>
											</label>
											<label class="radio-container">Female <input
												type="radio" name="gender" value="0"
												onclick="validateForm()"> <span class="checkmark"></span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-13">
								<div class="input-group">
									<label class="label">*Email</label> <input
										class="input--style-4" type="email" name="email" id="email"
										oninput="validateEmailField()" onblur="validateEmailField()">
									<span id="email-message"></span>
								</div>
							</div>
							<div class="col-13">
								<div class="input-group">
									<label class="label">*Address1</label> <input
										class="input--style-4" type="text" name="address1"
										id="address1" onblur="validateAddress1Field()"
										oninput="validateAddress1Field()"> <span
										id="address1-message"></span>
								</div>
							</div>
							<div class="col-13">
								<div class="input-group">
									<label class="label">Address2</label> <input
										class="input--style-4" type="text" name="address2"
										id="address2" onblur="validateAddress1Field()"
										oninput="validateAddress2Field()"> <span
										id="address2-message"></span>
								</div>
							</div>
							<div class="">
								<button class="btn btn--radius-2 btn--blue" id="add_customer"
									type="submit" disabled>Save</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
<div class="notification" id="notification">Customer added successfully</div>


	<!-- Main JS-->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="/customercrud/static/js/script.js"></script>
</body>
</html>