package hsf301.fe.edu.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fucar.pojo.CarRental;
import com.fucar.service.CarRentalService;
import com.fucar.service.ICarRentalService;

@Controller
@RequestMapping("/report")
public class RentalDashboardController {
	
	private ICarRentalService carRentalService;
	
	public RentalDashboardController() {
		carRentalService = new CarRentalService();
	}

	@RequestMapping("/rentals")
    public ModelAndView customers(HttpServletRequest request, HttpServletResponse response) {
        String startRaw = request.getParameter("start"); 
        String endRaw = request.getParameter("end"); 
        LocalDate start = LocalDate.parse(startRaw);
        LocalDate end = LocalDate.parse(endRaw);
        List<CarRental> rentals = carRentalService.findByPeriodDate(start, end);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.setAttribute("rentals", rentals);
        return new ModelAndView("rentalDashboard");
    }
	
}
