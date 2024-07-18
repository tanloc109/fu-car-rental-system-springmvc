package hsf301.fe.edu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fucar.pojo.Car;
import com.fucar.pojo.CarRental;
import com.fucar.pojo.Customer;
import com.fucar.service.CarRentalService;
import com.fucar.service.CarService;
import com.fucar.service.CustomerService;
import com.fucar.service.ICarRentalService;
import com.fucar.service.ICarService;
import com.fucar.service.ICustomerService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private ICustomerService customerService;
	private ICarService carService;
	private ICarRentalService carRentalService;

	public AdminController() {
		customerService = new CustomerService();
		carService = new CarService();
		carRentalService = new CarRentalService();
	}
	
	@RequestMapping("/")
	public ModelAndView admin(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("adminPage");
	}

	@RequestMapping("/customers")
	public ModelAndView customers(HttpServletRequest request, HttpServletResponse response) {
		List<Customer> customers = customerService.findAll();
		request.setAttribute("customers", customers);
		return new ModelAndView("customerManagement");
	}

	@RequestMapping("/cars")
	public ModelAndView cars(HttpServletRequest request, HttpServletResponse response) {
		List<Car> cars = carService.findAll();
		request.setAttribute("cars", cars);
		return new ModelAndView("carManagement");
	}

	@RequestMapping("/rentals")
	public ModelAndView rentals(HttpServletRequest request, HttpServletResponse response) {
		List<CarRental> carRentals = carRentalService.findAll();
		request.setAttribute("carRentals", carRentals);
		return new ModelAndView("carRentalManagement");
	}

	@RequestMapping("/reports")
	public ModelAndView reports(HttpServletRequest request, HttpServletResponse response) {
		return new ModelAndView("rentalDashboard");
	}
	
	@RequestMapping("/back")
	public void back(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.sendRedirect("/FUCarRentingSystemMVC/admin/");
	}

}
