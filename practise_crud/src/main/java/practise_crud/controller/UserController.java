package practise_crud.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import practise_crud.model.User;
import practise_crud.repository.UserRepository;
import practise_crud.service.UserServie;

@Controller
public class UserController {

	@Autowired
	private UserServie userService;

	@RequestMapping("/home")
	public String homePage(Model model) {
		List<User> userList = userService.getUserList();
		model.addAttribute("users", userList);
		return "customerlist";
	}

	@RequestMapping(value = "/update-user", method = RequestMethod.POST)
	public ResponseEntity<String> updateUser(@RequestParam("id") Long id, @RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName, @RequestParam("dateOfBirth") String dob,
			@RequestParam("mobile") String mobile, @RequestParam("address1") String address1,
			@RequestParam("address2") String address2, @RequestParam("age") int age,
			@RequestParam("gender") Integer gender, @RequestParam("email") String email, Model model) {

		if (userService.existUserEmail(email, id)) {
			model.addAttribute("errorMessage", "Email already exists!");
			ResponseEntity.ok("customer_update");
		} else if (userService.existMobileNumber(mobile, id)) {
			model.addAttribute("errorMessage", "Mobile number already exists!");
			ResponseEntity.ok("customer_update");
		}

		try {
			userService.updateUser(id, firstName, lastName, dob, mobile, address1, address2, age, gender, email);
			model.addAttribute("successMessage", "User updated successfully!");
		} catch (Exception e) {
			model.addAttribute("errorMessage", "Error updating user: ");
		}
		return ResponseEntity.ok("success");
	}

	@PostMapping("/emailExist")
	public ResponseEntity<String> checkEmailExist(@RequestParam("email") String email, @RequestParam("id") Long id) {
		if (id == null) {
			id = 0l;
		}
		if (userService.existUserEmail(email, id)) {
			return ResponseEntity.ok("Email already exists!");
		}
		return ResponseEntity.ok("");
	}

// Adding time check validation
	@PostMapping("/mobileNumberExist")
	public ResponseEntity<String> checkMobileNumberExist(@RequestParam("mobile") String mobile,
			@RequestParam("id") Long id) {
		if (id == null) {
			id = 0l;
		}
		if (userService.existMobileNumber(mobile, id)) {
			return ResponseEntity.ok("Mobile number already exists!");
		}
		return ResponseEntity.ok("");
	}

	/*
	 * @PostMapping("/emailExistUpdate") public ResponseEntity<String>
	 * checkEmailExistUpdate(@RequestParam("email") String email,
	 * 
	 * @RequestParam("id") Long id) { System.out.println("Received email: " + email
	 * + ", userId: " + id); if (userService.existUserEmail(email, id)) {
	 * System.out.println("Email already exists for user with ID: " + id); return
	 * ResponseEntity.ok("Email already exists!"); } return ResponseEntity.ok(""); }
	 */

	@PostMapping("/mobileNumberExistUpdate")
	public ResponseEntity<String> checkMobileNumberExistUpdate(@RequestParam("mobile") String mobile,
			@RequestParam("id") Long id) {
		if (userService.existMobileNumber(mobile, id)) {
			return ResponseEntity.ok("Mobile number already exists!");
		}
		return ResponseEntity.ok("");
	}

	// Save user and check email id exist or not
	@RequestMapping("/list-customer")
	public ResponseEntity<String> saveRecord(User user) {
		userService.createUser(user);
		return ResponseEntity.ok("success");
	}

	@RequestMapping("/add-customer")
	public String addUser(Model model) {
		model.addAttribute("title", "Add customer");
		return "add_customer";
	}

	@RequestMapping("/delete/{userId}")
	public RedirectView deleteUser(@PathVariable("userId") Long id, HttpServletRequest request) {
		this.userService.deleteUser(id);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/home");
		return redirectView;
	}

	@RequestMapping("/update/{userId}")
	public String updateDataRetrive(@PathVariable("userId") Long id, Model model) {
		User user = userService.getUserById(id);
		model.addAttribute("user", user);
		model.addAttribute("existingEmail",user.getEmail());
		return "customer_update";
	}

}