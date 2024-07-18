package hsf301.fe.edu.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
@RequestMapping("/rentals")
public class CarRentalController {
	
	private ICarRentalService carRentalService;
	private ICarService carService;
	private ICustomerService customerService;
	
	public CarRentalController() {
		carRentalService = new CarRentalService();
		carService = new CarService();
		customerService = new CustomerService();
	}

	@RequestMapping("/add")
	public ModelAndView add(HttpServletRequest request, HttpServletResponse response) {
		List<Customer> customers = customerService.findAll();
		List<Car> cars = carService.findAll();
		request.setAttribute("customers", customers);
		request.setAttribute("cars", cars);
		return new ModelAndView("addRental");
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView create(HttpServletRequest request, HttpServletResponse response) {
        int customerId = Integer.parseInt(request.getParameter("customer"));
        int carId = Integer.parseInt(request.getParameter("car"));
        Date pickupDate = Date.valueOf(request.getParameter("pickupDate"));
        Date returnDate = Date.valueOf(request.getParameter("returnDate"));
        LocalDate pickupLocalDate = pickupDate.toLocalDate();
        LocalDate returnLocalDate = returnDate.toLocalDate();

        boolean isCarRented = carRentalService.checkCarIsRentedInThisDate(carId, pickupLocalDate, returnLocalDate);
        if (isCarRented) {
            List<Customer> customers = customerService.findAll();
            List<Car> cars = carService.findAll();
            request.setAttribute("customers", customers);
            request.setAttribute("cars", cars);
            request.setAttribute("errorMessage", "The car is already rented in the selected date range.");
            return new ModelAndView("addRental");
        }

        Customer customer = customerService.findById(customerId);
        Car car = carService.findById(carId);

        double rentPrice;
        long daysBetween = ChronoUnit.DAYS.between(pickupLocalDate, returnLocalDate);
        rentPrice = car.getRentPrice() * daysBetween;
        String status = "Completed";

        CarRental rental = new CarRental(car, customer, pickupLocalDate, returnLocalDate, rentPrice, status);
        carRentalService.save(rental);

        List<CarRental> carRentals = carRentalService.findAll();
        request.setAttribute("carRentals", carRentals);
        return new ModelAndView("carRentalManagement");
    }

	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
    public ModelAndView update(HttpServletRequest request, HttpServletResponse response) {
        int rentalID = Integer.parseInt(request.getParameter("rentalID"));
        Customer customer = customerService.findById(Integer.parseInt(request.getParameter("customer")));
        Car car = carService.findById(Integer.parseInt(request.getParameter("car")));
        Date pickupDate = Date.valueOf(request.getParameter("pickupDate"));
        Date returnDate = Date.valueOf(request.getParameter("returnDate"));
        LocalDate pickupLocalDate = pickupDate.toLocalDate();
        LocalDate returnLocalDate = returnDate.toLocalDate();
        long daysBetween = ChronoUnit.DAYS.between(pickupLocalDate, returnLocalDate);
        double rentPrice = car.getRentPrice() * daysBetween;
        String status = "Completed";
        CarRental rental = new CarRental(rentalID, car, customer, pickupLocalDate, returnLocalDate, rentPrice, status);
        carRentalService.update(rental); 
        List<CarRental> carRentals =  carRentalService.findAll();
        request.setAttribute("carRentals", carRentals);    
        return new ModelAndView("carRentalManagement");
        }
	
	@RequestMapping(value="/edit", method = RequestMethod.POST)
	public ModelAndView edit(HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
        String rentalID = request.getParameter("rentalID");
        List<Customer> customers = customerService.findAll();
		List<Car> cars = carService.findAll();
		request.setAttribute("customers", customers);
		request.setAttribute("cars", cars);
        if ("Edit".equals(action)) {
            request.setAttribute("rental", carRentalService.findById(Integer.parseInt(rentalID)));
            return new ModelAndView("editRental");
        } else if ("Delete".equals(action)) {
        	carRentalService.delete(Integer.parseInt(rentalID));
            return new ModelAndView("redirect:/admin/rentals");
        }
        return new ModelAndView("redirect:/admin/rentals");
	}
}
