package com.sol.mall;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@RequestMapping(value = "/", method = RequestMethod.GET)

	public String home(HttpServletRequest req, HttpServletResponse res) {

		// req.setAttribute("loginInfo", "loginArea.jsp");
		// return "member/loginPage";
		return "customer/customerMain2";
	}

}