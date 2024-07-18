package hsf301.fe.edu.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fucar.login.AccountLogin;
import com.fucar.pojo.CarRental;
import com.fucar.pojo.Customer;
import com.fucar.service.CarRentalService;
import com.fucar.service.CustomerService;
import com.fucar.service.ICarRentalService;
import com.fucar.service.ICustomerService;

@Controller
@RequestMapping("/customers")
public class CustomerController {


    private ICustomerService customerService;
    private ICarRentalService carRentalService;

    public CustomerController() {
        customerService = new CustomerService();
        carRentalService = new CarRentalService();
    }

    @RequestMapping("/add")
    public ModelAndView add(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("addCustomer");
    }

    @RequestMapping(value="/edit", method = RequestMethod.POST)
    public ModelAndView edit(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        String customerID = request.getParameter("customerID");
        if ("Edit".equals(action)) {
            Customer customer = customerService.findById(Integer.parseInt(customerID));
            request.setAttribute("customer", customer);

            String birthdayString = formatDate(customer.getBirthday());
            String licenceDateString = formatDate(customer.getLicenceDate());

            request.setAttribute("birthdayString", birthdayString);
            request.setAttribute("licenceDateString", licenceDateString);

            return new ModelAndView("editCustomer");
        } else if ("Delete".equals(action)) {
            customerService.delete(Integer.parseInt(customerID));
            return new ModelAndView("redirect:/admin/customers");
        }
        return new ModelAndView("redirect:/admin/customers");
    }
    
    @RequestMapping(value="/edit2", method = RequestMethod.POST)
    public ModelAndView edit2(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");
        String customerID = request.getParameter("customerID");
        Customer customer = customerService.findById(Integer.parseInt(customerID));
        request.setAttribute("customer", customer);
        return new ModelAndView("editCustomer");
    }

    @RequestMapping(value="/update", method = RequestMethod.POST)
    public ModelAndView update(HttpServletRequest request, HttpServletResponse response) {
        int customerID = Integer.parseInt(request.getParameter("customerID"));
        String customerName = request.getParameter("customerName");
        String mobile = request.getParameter("mobile");
        String birthdayStr = request.getParameter("birthday");
        String identityCard = request.getParameter("identityCard");
        String licenceNumber = request.getParameter("licenceNumber");
        String licenceDateStr = request.getParameter("licenceDate");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date birthday = null;
        Date licenceDate = null;
        try {
            birthday = sdf.parse(birthdayStr);
            licenceDate = sdf.parse(licenceDateStr);
        } catch (Exception e) {
        }

        Customer customer = customerService.findById(customerID);
        customer.setCustomerName(customerName);
        customer.setMobile(mobile);
        customer.setBirthday(birthday);
        customer.setIdentityCard(identityCard);
        customer.setLicenceNumber(licenceNumber);
        customer.setLicenceDate(licenceDate);
        customer.setEmail(email);
        customer.setPassword(password);

        customerService.update(customer);

        request.setAttribute("info", customer);
        List<CarRental> historyRental = carRentalService.findByCustomerIdOrderByPickupDateDesc(customerID);
        request.setAttribute("historyRental", historyRental);

        return new ModelAndView("customer");
    }

    @RequestMapping(value="/back", method = RequestMethod.POST)
    public ModelAndView back(HttpServletRequest request, HttpServletResponse response) {
        int customerID = Integer.parseInt(request.getParameter("customerID"));
        Customer customer = customerService.findById(customerID);
        request.setAttribute("info", customer);
        List<CarRental> historyRental = carRentalService.findByCustomerIdOrderByPickupDateDesc(AccountLogin.curUserLogin.getCustomerID());
        request.setAttribute("historyRental", historyRental);
        return new ModelAndView("customer");
    }

    private String formatDate(Date date) {
        if (date == null) {
            return "";
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }
}
