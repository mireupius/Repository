package com.sol.mall;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
<<<<<<< HEAD
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
=======
>>>>>>> refs/remotes/origin/union2

	@RequestMapping(value = "/", method = RequestMethod.GET)
<<<<<<< HEAD
	public String home(HttpServletRequest req, HttpServletResponse res) {
		
		
		//req.setAttribute("loginInfo", "loginArea.jsp");
		//return "member/loginPage";
		return "customer/customerMain2";
=======
	public String home() {

		return "home";
>>>>>>> refs/remotes/origin/union2
	}

<<<<<<< HEAD
}
=======
}
>>>>>>> refs/remotes/origin/union2
