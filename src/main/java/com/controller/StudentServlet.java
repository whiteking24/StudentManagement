package com.controller;

import com.dao.StudentDAO;
import com.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/student")
public class StudentServlet extends HttpServlet {

    StudentDAO dao;

    public void init() {
        dao = new StudentDAO();
    }

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch (action) {

            case "new":
                request.getRequestDispatcher("addStudent.jsp")
                        .forward(request, response);
                break;

            case "insert":

                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String course = request.getParameter("course");

                Student s = new Student(name, email, course);

                dao.insertStudent(s);

                response.sendRedirect("student");
                break;

            case "delete":

                int id =
                        Integer.parseInt(request.getParameter("id"));

                dao.deleteStudent(id);

                response.sendRedirect("student");
                break;

            case "edit":

                int editId =
                        Integer.parseInt(request.getParameter("id"));

                Student student = dao.getStudentById(editId);

                request.setAttribute("student", student);

                request.getRequestDispatcher("editStudent.jsp")
                        .forward(request, response);

                break;

            case "update":

                int updateId =
                        Integer.parseInt(request.getParameter("id"));

                String updateName =
                        request.getParameter("name");

                String updateEmail =
                        request.getParameter("email");

                String updateCourse =
                        request.getParameter("course");

                Student updateStudent =
                        new Student(updateId,
                                updateName,
                                updateEmail,
                                updateCourse);

                dao.updateStudent(updateStudent);

                response.sendRedirect("student");

                break;

            default:

                List<Student> list = dao.getAllStudents();

                request.setAttribute("listStudent", list);

                request.getRequestDispatcher("listStudent.jsp")
                        .forward(request, response);
        }
    }
}