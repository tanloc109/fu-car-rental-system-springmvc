package hsf301.fe.edu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fucar.login.AccountLogin;
import com.fucar.login.LoginService;
import com.fucar.pojo.Account;
import com.fucar.pojo.CarRental;
import com.fucar.service.AccountService;
import com.fucar.service.CarRentalService;
import com.fucar.service.CustomerService;
import com.fucar.service.IAccountService;
import com.fucar.service.ICarRentalService;
import com.fucar.service.ICustomerService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

    private LoginService loginService;
    private ICustomerService customerService;
    private ICarRentalService carRentalService;
    private IAccountService accountService;
   
    public LoginController() {
    	loginService = new LoginService();
    	customerService = new CustomerService();
    	carRentalService = new CarRentalService();
        accountService =  new AccountService();
	}

	@RequestMapping(value = "/")
    public ModelAndView test(HttpServletResponse response) {
        return new ModelAndView("login");
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (loginService.checkLogin(username, password)) {
            Account account = AccountLogin.curUserLogin.getAccount();
            if (account != null) {
                if ("Admin".equals(account.getRole())) {
                	try {
						response.sendRedirect("/FUCarRentingSystemMVC/admin/");
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
                	return null;
                } else if ("Customer".equals(account.getRole())) {
                	List<CarRental> historyRental = carRentalService.findByCustomerIdOrderByPickupDateDesc(AccountLogin.curUserLogin.getCustomerID());
                    request.setAttribute("historyRental", historyRental);
                    request.setAttribute("info", AccountLogin.curUserLogin);
                	return new ModelAndView("customer");
                }
            }
        }
        request.setAttribute("loginFail", "Your username or password invalid ! Please try again.");
        return new ModelAndView("login");
    }
    
    @RequestMapping(value = "/logout")
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
    	AccountLogin.curUserLogin = null;
        request.setAttribute("logoutSuccess", "Your are logged out successfully.");
        return new ModelAndView("login");
    }
}
