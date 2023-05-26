package com.company.controller;

import com.company.entity.Country;
import com.company.entity.EmploymentHistory;
import com.company.entity.User;
import com.company.form.EmploymentHistoryForm;
import com.company.service.CustomUserDetailServiceImpl;
import com.company.service.inter.CountryServiceInter;
import com.company.service.inter.EmploymentHistoryServiceInter;
import com.company.service.inter.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;


@Controller
public class ResumeController {
    @Autowired
    @Qualifier("userDetailsService")
    private CustomUserDetailServiceImpl userDetailsService;
    @Autowired
    UserServiceInter userService;
    @Autowired
    EmploymentHistoryServiceInter employmentHistoryService;
    @Autowired
    CountryServiceInter countryServiceInter;

    @GetMapping("/")
    public ModelAndView mainController() {
        ModelAndView mv = new ModelAndView("generater");
        String email = userDetailsService.getUserEmail();
        User user = userService.findByEmail(email);
        EmploymentHistory emp = employmentHistoryService.getAllEmploymentHistoryByUserId(user.getId()).get(0);
        mv.addObject("user", emp);
        mv.addObject("user1", user);
        return mv;
    }

    @RequestMapping(method = RequestMethod.POST, value = "/generateResume")
    public ModelAndView process(
            @RequestParam(value = "name", required = false) String name,
            @RequestParam(value = "surname", required = false) String surname,
            @RequestParam(value = "phoneNumber", required = false) String phoneNumber,
            @RequestParam(value = "email", required = false) String email,
            @RequestParam(value = "companyName", required = false) String companyName,
            @RequestParam(value = "beginDate", required = false)
            @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date begindate,
            @RequestParam(value = "endDate", required = false)
            @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date endDate,
            @RequestParam(value = "jobDescription", required = false) String jobDescription,
            @RequestParam(value = "profileSummary", required = false) String profileSummary,
            @RequestParam(value = "nationality", required = false) String nationality,
            @RequestParam(value = "birthplace", required = false) String birthplace,
            @RequestParam(value = "birthdate", required = false)
            @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date birthdate,
            @RequestParam(value = "skillName", required = false) String skillName
    ) {
        java.sql.Date beginDate = new java.sql.Date(begindate.getTime());
        java.sql.Date enddate = new java.sql.Date(endDate.getTime());
        java.sql.Date birthDate = new java.sql.Date(birthdate.getTime());
        User user = userService.findByEmail(email);
        Country c = countryServiceInter.getCountryByName(birthplace);
        User u = new User(user.getId(), name, surname, email, phoneNumber, beginDate, jobDescription, c, c, "Baku", user.getPassword(), skillName);
        userService.updateUser(u);
        EmploymentHistory emp1 = employmentHistoryService.getAllEmploymentHistoryByUserId(user.getId()).get(0);
        EmploymentHistory emp = new EmploymentHistory(emp1.getId(), companyName, beginDate, enddate, jobDescription, u);
        employmentHistoryService.updateEmpHistory(emp);

        ModelAndView mv = new ModelAndView("generater");
        mv.addObject("user", emp);
        mv.addObject("user1", u);
        return mv;
    }

    /* @RequestMapping(method = RequestMethod.POST,value = "/generateResume",params = "Download")
     public byte[] generatingPdf() {

     }
 */
    @ModelAttribute("test")
    public EmploymentHistoryForm getEmptyHistory() {
        return new EmploymentHistoryForm();
    }

}