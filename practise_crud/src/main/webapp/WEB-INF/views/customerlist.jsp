<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Data</title>
<%@include file="./base.jsp"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Include Font Awesome CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
body {
	counter-reset: Serial;
}

tbody {
	counter-reset: Serial;
}

tr td:first-child:before {
	counter-increment: Serial;
	content: counter(Serial);
}

.heading {
	display: flex;
	font-size: 40px;
	align-items: center;
	justify-content: center;
}
td {
  max-width: 200px; /* Adjust the value to suit your layout */
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
/* Add tooltip styling */
      
</style>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div class="container mt-4">
		<div class="row">
			<div class="col-md-12">
				<strong class="heading">Customer details</strong>
				<div class="container text-right">
					<a href="add-customer" class="btn btn-outline-success mb-1 ml-auto">Add
						Customer</a>
				</div>
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col">ID</th>
							<th scope="col">First Name</th>
							<th scope="col">Last Name</th>
							<th scope="col">Date of Birth</th>
							<th scope="col">Mobile Number</th>
							<th scope="col">Address</th>
							<th scope="col">Age</th>
							<th scope="col">Gender</th>
							<th scope="col">Email</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${users}" var="user">
							<tr>
								<td></td>
								<td title="${user.firstName}">${user.firstName}</td>
								<td title="${user.lastName}">${user.lastName}</td>
								<td title="${user.dateOfBirth}">${user.dateOfBirth}</td>
								<td title="${user.mobile}">${user.mobile}</td>
								<td title="${user.address1}">${user.address1}<br>${user.address2}</td>
								<td title="${user.age}">${user.age}</td>
								<td><c:choose>
									<c:when test="${user.gender == 1}">
                           						 Male
                        			</c:when>
										<c:when test="${user.gender == 0}">
                            				Female
                        			</c:when>
									</c:choose>
									</td>
								<td title="${user.email}">${user.email}</td>
								<td><a href="javascript:void(0);"
									onclick="confirmDelete(${user.id});"><i
										class="fas fa-trash text-danger mr-2" style="cursor: pointer;"></i></a>
									<a href="update/${user.id}"><i
										class="fas fa-pen-to-square text-primary"
										style="cursor: pointer;"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script src="/customercrud/static/js/script.js"></script>
</body>
</html>
