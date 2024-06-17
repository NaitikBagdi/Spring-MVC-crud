$(document).ready(function() {
	$('input, select').on('change keyup', validateForm);

	// Check in adding time
	$('#email').blur(function() {
		var email = $('#email').val();
		var userId = $('#userId').val();
		if (email === '') {
			$('#email-message').html('<span style="color:red;">*Email id is required</span>');
			validateForm();
			return;
		}

		// Perform AJAX request if the input is not empty
		$.ajax({
			type: "POST",
			url: "/customercrud/emailExist",
			data: { email: email, id: userId },
			success: function(response) {
				if (response.trim() !== '') {
					$('#email-message').html('<span style="color:red;">' + response + '</span>');
				} else {
					$('#email-message').html('');
				}
				validateForm();
			}
		});

	});

});

// Check in update time
$('#contactnumber').blur(function() {
	var contactnumber = $('#contactnumber').val();
	var userId = $('#userId').val();
	if (contactnumber === '') {
		$('#contact-message').html('<span style="color:red;">*Contact number is required</span>');
		validateForm();
		return;
	}
	// Perform AJAX request if the input is not empty
	$.ajax({
		type: "POST",
		url: "/customercrud/mobileNumberExist",
		data: { mobile: contactnumber, id: userId },
		success: function(response) {
			if (response.trim() !== '') {
				$('#contact-message').html('<span style="color:red;">' + response + '</span>');
			}
			validateForm();
		}
	});

});

function addCustomer(event) {
	event.preventDefault(); // Prevent the form from submitting normally
	// Show loader
	var spinner = '<div class="spinner-border" role="status"><span class="sr-only"></span></div>';
	$('#add_customer').html(spinner);

	// AJAX request to submit the form data
	$.ajax({
		url: "list-customer",
		type: "POST",
		data: $("#formId").serialize(), // Serialize form data
		success: function(response) {
			// Hide loader on success
			console.log(response);

			if (response === "success") {
				$('#add_customer').text("Save");
				var firstName = $('#firstname').val(); // Use .val() to get the value of an input field
				var lastName = $('#lastname').val();

				var message = firstName + " " + lastName + ": Added successfully"; // Construct the message

				// Show the message
				showMessage(message, function() {
					// After 3 seconds, redirect to the specified URL
					setTimeout(function() {
						window.location.href = "/customercrud/home";
					}, 1000); // 3000 milliseconds = 3 seconds
				});

				function showMessage(message, callback) {
					const notificationDiv = document.createElement('div');
					notificationDiv.innerHTML = message;
					notificationDiv.style.position = 'fixed';
					notificationDiv.style.top = '5%';
					notificationDiv.style.left = '50%';
					notificationDiv.style.transform = 'translate(-50%, -50%)';
					notificationDiv.style.backgroundColor = 'lightgreen';
					notificationDiv.style.color = 'white';
					notificationDiv.style.borderRadius = '10px'; // Adding border radius
					notificationDiv.style.padding = '20px';
					notificationDiv.style.zIndex = '1000'; // Ensure it's above other content
					document.body.appendChild(notificationDiv);

					setTimeout(function() {
						// Remove the notification after 3 seconds
						notificationDiv.style.display = 'none';
						if (callback && typeof callback === 'function') {
							callback(); // Execute the callback function
						}
					}, 2000); // 3000 milliseconds = 3 seconds
				}

			} else {
				// Handle other responses or do nothing
			}
		},
		error: function(xhr, status, error) {
			// Hide loader on error	
			$('#add_customer').text("Save");
		}
	});
}


function updateCustomer(event) {
	event.preventDefault(); // Prevent the form from submitting normally
	// Show loader
	var spinner = '<div class="spinner-border" role="status"><span class="sr-only"></span></div>';
	$('#update_customer').html(spinner);
	/*$("#add_customer").show();*/
	// AJAX request to submit the form data
	$.ajax({
		url: "/customercrud/update-user",
		type: "POST",
		data: $("#updateForm").serialize(), // Serialize form data
		success: function(response) {
			// Hide loader on success
			console.log(response);
			$('#update_customer').text("Save");

			if (response === "success") {
				var firstName = $('#firstname').val(); // Use .val() to get the value of an input field
				var lastName = $('#lastname').val();

				var message = firstName + " " + lastName + ": Update successfully"; // Construct the message

				// Show the message
				showMessage(message, function() {
					// After 3 seconds, redirect to the specified URL
					setTimeout(function() {
						window.location.href = "/customercrud/home";
					}, 500); // 3000 milliseconds = 3 seconds
				});

				function showMessage(message, callback) {
					const notificationDiv = document.createElement('div');
					notificationDiv.innerHTML = message;
					notificationDiv.style.position = 'fixed';
					notificationDiv.style.top = '5%';
					notificationDiv.style.left = '50%';
					notificationDiv.style.transform = 'translate(-50%, -50%)';
					notificationDiv.style.backgroundColor = 'lightgreen';
					notificationDiv.style.color = 'white';
					notificationDiv.style.borderRadius = '10px'; // Adding border radius
					notificationDiv.style.padding = '20px';
					notificationDiv.style.zIndex = '1000'; // Ensure it's above other content
					document.body.appendChild(notificationDiv);

					setTimeout(function() {
						// Remove the notification after 3 seconds
						notificationDiv.style.display = 'none';
						if (callback && typeof callback === 'function') {
							callback(); // Execute the callback function
						}
					}, 1000); // 3000 milliseconds = 3 seconds
				}
			} else {
				// Handle other responses or do nothing
			}
		},
		error: function(xhr, status, error) {
			// Hide loader on error
		}
	});
}
function validateFirstNameField() {
	var firstName = $('#firstname').val();
	var lettersRegex = /^[A-Za-z]+$/;
	if (firstName === '') {
		$('#firstname-message').html('<span style="color:red;">*First name required</span>');
	} else if (firstName.length < 2) {
		$('#firstname-message').html('<span style="color:red;">First name minimum 2 characters</span>');
	} else if (firstName.length > 30) {
		$('#firstname-message').html('<span style="color:red;">First name maximum 30 characters</span>');
	} else if (!lettersRegex.test(firstName)) {
		$('#firstname-message').html('<span style="color:red;">First name must contain only letters</span>');
	} else {
		$('#firstname-message').html('');
	}
	validateForm();
}

function validateLastnameField() {
	var lastName = $('#lastname').val();
	var lettersRegex = /^[A-Za-z]+$/;
	if (lastName == '') {
		$('#lastname-message').html('<span style="color:red;">*Last name is required</span>');
	} else if (lastName.length < 2) {
		$('#lastname-message').html('<span style="color:red;">Last name minimum 2 characters</span>');
	} else if (lastName.length > 30) {
		$('#lastname-message').html('<span style="color:red;">Last name maximum 30 characters</span>');
	} else if (!lettersRegex.test(lastName)) {
		$('#lastname-message').html('<span style="color:red;">Last name must contain only letters</span>');
	} else {
		$('#lastname-message').html('');
	}
	validateForm();
}
function validateDateField() {
	var dob = $('#dob').val();
	if (dob == '') {
		$('#dob-message').html('<span style="color:red;">*Date of birth is required</span>');
	} else {
		$('#dob-message').html('');
	}
	validateForm();
}

function validateAgeField() {
	var age = $('#age').val();
	var ageRegex = /^[0-9]+$/;
	if (age == '') {
		$('#age-message').html('<span style="color:red;">*Age is required</span>');
	} else if (!ageRegex.test(age)) {
		$('#age-message').html('<span style="color:red;">Age must contain only numbers</span>');
	} else if (age < 1) {
		$('#age-message').html('<span style="color:red;">Minimum age 1 required</span>');
	} else if (age.length > 2) {
		$('#age-message').html('<span style="color:red;">Age must be only 2 digit</span>');
	} else {
		$('#age-message').html('');
	}
	validateForm();
}

function validateContactNumberField() {
	var contactNumber = $('#contactnumber').val();
	var numberRegex = /^[0-9]+$/;
	if (contactNumber === '') {
		$('#contact-message').html('<span style="color:red;">*Required</span>');
	} else if (!numberRegex.test(contactNumber)) {
		$('#contact-message').html('<span style="color:red;">Contact number must contain only numbers</span>');
	} else if (contactNumber.length < 10) {
		$('#contact-message').html('<span style="color:red;">Contact number minimum 10 characters</span>');
	} else if (contactNumber.length > 17) {
		$('#contact-message').html('<span style="color:red;">Contact number maximum 17 characters</span>');
	} else {
		$('#contact-message').html('');
	}
	validateForm();
}

function validateEmailField() {
	var email = $('#email').val();
	var emailRegex = /^[_A-Za-z0-9-]+(\.[_A-Za-z0-9-]+)*@gmail.com$/;
	if (email === '') {
		$('#email-message').html('<span style="color:red;">*Email id is required</span>');
	} else if (!emailRegex.test(email)) {
		$('#email-message').html('<span style="color:red;">Invalid email format</span>');
	} else {
		$('#email-message').html('');
	}
	validateForm();
}

function validateAddress1Field() {
	var address1 = $('#address1').val();
	if (address1 === '') {
		$('#address1-message').html('<span style="color:red;">*Address1 is required</span>');
	} else if (address1.length < 2) {
		$('#address1-message').html('<span style="color:red;">Address minimum 2 characters</span>');
	} else if (address1.length > 70) {
		$('#address1-message').html('<span style="color:red;">Address maximum 70 characters</span>');
	} else {
		$('#address1-message').html('');
	}
	validateForm();
}

function validateAddress2Field() {
	var address2 = $('#address2').val();
	if (address2.length < 2) {
		$('#address2-message').html('<span style="color:red;">Address2 minimum 2 characters</span>');
	} else if (address2.length > 70) {
		$('#address2-message').html('<span style="color:red;">Address2 maximum 70 characters</span>');
	} else {
		$('#address2-message').html('');
	}
}

function validateForm() {
	var firstNameValid = $('#firstname-message').html() === '';
	var lastNameValid = $('#lastname-message').html() === '';
	var contactNumberValid = $('#contact-message').html() === '';
	var ageValid = $('#age-message').html() === '';
	var emailValid = $('#email-message').html() === '';
	var address1Valid = $('#address1-message').html() === '';
	var address2Valid = $('#address2-message').html() === '';

	var firstName = $('#firstname').val();
	var lastName = $('#lastname').val();
	var contactNumber = $('#contactnumber').val();
	var age = $('#age').val();
	var birthday = $('#dob').val();
	var email = $('#email').val();
	var address1 = $('#address1').val();
	var gender = $('input[name="gender"]:checked').val();

	var addCustomer = $('#add_customer');
	var updateCustomer = $('#update_customer');

	if (firstNameValid && lastNameValid && contactNumberValid && ageValid && emailValid && address1Valid && address2Valid &&
		firstName !== '' && lastName !== '' && contactNumber !== '' && age !== '' && birthday !== '' && gender !== undefined && email !== '' && address1 !== '') {
		addCustomer.prop('disabled', false);
		updateCustomer.prop('disabled', false);
	} else {
		addCustomer.prop('disabled', true);
		updateCustomer.prop('disabled', true);
	}
}

function confirmDelete(userId) {

	var confirmation = confirm(" Are you sure you want to delete this user?");
	if (confirmation) {
		window.location.href = "delete/" + userId;
	}
}
