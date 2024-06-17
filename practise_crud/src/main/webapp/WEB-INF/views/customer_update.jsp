<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="./base.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/customercrud/static/css/style.css">
</head>
<body>
	<div class="page-wrapper p-t-100 p-t-15 font-poppins">
		<div class="wrapper wrapper--w680">
			<div class="card card-4">
				<div class="card-body">
					<h2 class="title">Edit Customer</h2>
					<form action="${pageContext.request.contextPath}/update-user"
						id="updateForm" method="POST" onsubmit="updateCustomer(event)">
						<input type="hidden" value="${user.id}" name="id" id="userId">
						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<label class="label">*first name</label> <input
										class="input--style-4" type="text" name="firstName"
										id="firstname" value="${user.firstName}"
										onblur="validateFirstNameField()"
										oninput="validateFirstNameField()"> <span
										id="firstname-message"></span>
								</div>
							</div>
							<div class="col-2">
								<div class="input-group">
									<label class="label">*last name</label> <input
										class="input--style-4" type="text" name="lastName"
										id="lastname" oninput="validateLastnameField()"
										onblur="validateLastnameField()" value="${user.lastName}">
									<span id="lastname-message"></span>
								</div>
							</div>
						</div>
						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<label class="label">*Phone Number</label> <input
										class="input--style-4" type="text" name="mobile"
										id="contactnumber" onblur="validateContactNumberField()"
										oninput="validateContactNumberField()" value="${user.mobile}">
									<span id="contact-message"></span>
								</div>
							</div>
							<div class="col-2">
								<div class="input-group">
									<label class="label">*Age</label> <input class="input--style-4"
										type="text" name="age" id="age" onblur="validateAgeField()"
										oninput="validateAgeField()" value="${user.age}"> <span
										id="age-message"></span>
								</div>
							</div>
						</div>
						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<label class="label">*Birthday</label>
									<div class="input-group-icon">
										<input class="birthday-style" type="date" name="dateOfBirth"
										id="dob" value="${user.dateOfBirth}" oninput="validateDateField()"
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
											type="radio" checked="checked" name="gender"
											value="1" ${user.gender == 1 ? 'checked' : ''}> <span class="checkmark"></span>
										</label> <label class="radio-container">Female <input
											type="radio" name="gender" value="0" ${user.gender == 0 ? 'checked' : ''}> <span
											class="checkmark"></span>
										</label>
									</div>
								</div>
							</div>
						</div>
						<div class="col-13">
							<div class="input-group">
								<label class="label">*Email</label> <input
									class="input--style-4" type="email" name="email" id="email"
									onblur="validateEmailField()" oninput="validateEmailField()"
									value="${user.email}"> <span id="email-message"></span>
							</div>
						</div>
						<div class="col-13">
							<div class="input-group">
								<label class="label">*Address1</label> <input
									class="input--style-4" type="text" name="address1"
									id="address1" oninput="validateAddress1Field()"
									onblur="validateAddress1Field()" value="${user.address1}">
								<span id="address1-message"></span>
							</div>
						</div>
						<div class="col-13">
							<div class="input-group">
								<label class="label">Address2</label> <input
									class="input--style-4" type="text" name="address2"
									id="address2" oninput="validateAddress2Field()"
									onblur="validateAddress1Field()" value="${user.address2}">
								<span id="address2-message"></span>
							</div>
						</div>
						<div class="p-t-15">
							<button class="btn btn--radius-2 btn--blue" type="submit"
								id="update_customer" value="${user.age}" disabled>Save</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="/customercrud/static/js/script.js"></script>
</body>
</html>