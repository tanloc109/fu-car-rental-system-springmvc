package hsf301.fe.edu.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fucar.pojo.Car;
import com.fucar.pojo.CarProducer;
import com.fucar.service.CarProducerService;
import com.fucar.service.CarService;
import com.fucar.service.ICarProducerService;
import com.fucar.service.ICarService;

@Controller
@RequestMapping("/cars")
public class CarController {
	
	private ICarService carService;
	private ICarProducerService carProducerService;
	
	public CarController() {
		carService = new CarService();
		carProducerService = new CarProducerService();
	}
	
	@RequestMapping("/add")
	public ModelAndView add(HttpServletRequest request, HttpServletResponse response) {
		List<CarProducer> producers = carProducerService.findAll();
		request.setAttribute("producers", producers);
		return new ModelAndView("addCar");
	}
	
	@RequestMapping(value="/create", method = RequestMethod.POST)
	public ModelAndView create(HttpServletRequest request, HttpServletResponse response) {
	    String carName = request.getParameter("carName");
	    int carModelYear = Integer.parseInt(request.getParameter("carModelYear"));
	    String color = request.getParameter("color");
	    int capacity = Integer.parseInt(request.getParameter("capacity"));
	    String description = request.getParameter("description");
	    Date importDate = Date.valueOf(request.getParameter("importDate"));
	    int producerID = Integer.parseInt(request.getParameter("producer"));
	    CarProducer producer = carProducerService.findById(producerID);
	    double rentPrice = Double.parseDouble(request.getParameter("rentPrice"));
	    String status = request.getParameter("status");
	    
	    Car car = new Car(carName, carModelYear, color, capacity, description, importDate.toLocalDate(), producer, rentPrice, status);
	    carService.save(car);
	    
	    return new ModelAndView("redirect:/admin/cars");
	}
	
	@RequestMapping(value="/update", method = RequestMethod.POST)
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response) {
	    int carID = Integer.parseInt(request.getParameter("carID"));
	    String carName = request.getParameter("carName");
	    int carModelYear = Integer.parseInt(request.getParameter("carModelYear"));
	    String color = request.getParameter("color");
	    int capacity = Integer.parseInt(request.getParameter("capacity"));
	    String description = request.getParameter("description");
	    Date importDate = Date.valueOf(request.getParameter("importDate"));
	    int producerID = Integer.parseInt(request.getParameter("producer"));
	    CarProducer producer = carProducerService.findById(producerID);
	    double rentPrice = Double.parseDouble(request.getParameter("rentPrice"));
	    String status = request.getParameter("status");

	    Car car = new Car(carID, carName, carModelYear, color, capacity, description, importDate.toLocalDate(), producer, rentPrice, status);
	    carService.update(car);
	    
	    return new ModelAndView("redirect:/admin/cars");
	}

	@RequestMapping(value="/edit", method = RequestMethod.POST)
	public ModelAndView edit(HttpServletRequest request, HttpServletResponse response) {
		String action = request.getParameter("action");
        String carID = request.getParameter("carID");
        if ("Edit".equals(action)) {
        	List<CarProducer> producers = carProducerService.findAll();
        	request.setAttribute("producers", producers);
            request.setAttribute("car", carService.findById(Integer.parseInt(carID)));
            return new ModelAndView("editCar");
        } else if ("Delete".equals(action)) {
            carService.delete(Integer.parseInt(carID));
            return new ModelAndView("redirect:/admin/cars");
        }
        return new ModelAndView("redirect:/admin/cars");
	}
}
