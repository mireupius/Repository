package com.sol.mall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
<<<<<<< HEAD
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req, HttpServletResponse res) {
		
		req.setAttribute("loginInfo", "loginArea.jsp");
		return "member/loginPage";
	}
=======
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(HttpServletRequest req, HttpServletResponse res) {
//	
//		return "main";
//	}
>>>>>>> refs/remotes/origin/hs2
	
}
