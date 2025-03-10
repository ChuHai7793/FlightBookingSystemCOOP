package com.example.flightbookingmanagement.service;

import com.example.flightbookingmanagement.dao.impl.AdminDAOImpl;
import com.example.flightbookingmanagement.dao.impl.CustomerDAOImpl;
import com.example.flightbookingmanagement.dao.impl.UserDAOImpl;
import com.example.flightbookingmanagement.model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class AdminService {

    static private AdminDAOImpl adminDAO;
    static private UserDAOImpl userDAO;

    public AdminService() {

        adminDAO = new AdminDAOImpl();
        userDAO = new UserDAOImpl();
    }


    public void showAllStaffs(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        List<User> staffs = adminDAO.getAllStaffs();
        for(User staff : staffs){
            System.out.println(staff);
        }
        HttpSession session = request.getSession(false);
        session.setAttribute("staffs", staffs);
//        request.setAttribute("staffs", staffs);
        response.sendRedirect("../admin/manage_staff.jsp");
    }


    public void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("staffId"));
        User chosen_staff = userDAO.getUserById(userId);
        request.setAttribute("chosen_staff", chosen_staff);
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/manage_staff.jsp");
        dispatcher.forward(request, response);
    }

    //-------------------------------------- UPDATE CUSTOMER TO DATABASE ------------------------------------------
    public void updateStaff(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        int staffId = Integer.parseInt(request.getParameter("staffId"));
        String name = request.getParameter("name");
        String birth_date = request.getParameter("birth_date");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");


        User chosen_staff = userDAO.getUserById(staffId);

        // Update thông tin user
        chosen_staff.setFullName(name);
        chosen_staff.setBirthDate(birth_date);
        chosen_staff.setAddress(address);
        chosen_staff.setEmail(email);
        chosen_staff.setPhone(phone);

        adminDAO.updateStaff(chosen_staff);


    }

}
