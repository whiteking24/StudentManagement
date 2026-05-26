<%@ page import="java.util.*,com.model.Student" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="card shadow">
        <div class="card-header bg-primary text-white">
            <h2 class="text-center">
                Student Management System
            </h2>
        </div>
        <div class="card-body">
            <div class="d-flex justify-content-between mb-3">
                <h4>Student List</h4>
                <a href="student?action=new"
                   class="btn btn-success">
                    Add Student
                </a>
            </div>
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Course</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    List<Student> list =
                            (List<Student>) request.getAttribute("listStudent");
                    for(Student s : list){
                %>
                <tr>
                    <td><%= s.getId() %></td>
                    <td><%= s.getName() %></td>
                    <td><%= s.getEmail() %></td>
                    <td><%= s.getCourse() %></td>
                    <td>
                        <a href="student?action=edit&id=<%= s.getId() %>"
                           class="btn btn-warning btn-sm">
                            Edit
                        </a>
                        <a href="student?action=delete&id=<%= s.getId() %>"
                           class="btn btn-danger btn-sm">
                            Delete
                        </a>
                    </td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>