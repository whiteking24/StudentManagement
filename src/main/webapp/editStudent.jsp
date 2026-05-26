<%@ page import="com.model.Student" %>
<%
Student s = (Student) request.getAttribute("student");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow">
                <div class="card-header bg-warning text-dark text-center">
                    <h3>Edit Student</h3>
                </div>
                <div class="card-body">
                    <form action="student" method="get">
                        <input type="hidden" name="action" Value="update">
                        <input type="hidden" name="id" value="<%= s.getId() %>">
                        <div class="mb-3">
                            <label>Name</label>
                            <input type="text" name="name" class="form-control" value="<%= s.getName() %>" required>
                        </div>
                        <div class="mb-3">
                            <label>Email</label>
                            <input type="email" name="email" class="form-control" value="<%= s.getEmail() %>" required>
                        </div>
                        <div class="mb-3">
                            <label>Course</label>
                            <input type="text" name="course" class="form-control" value="<%= s.getCourse() %>" required>
                        </div>
                        <button type="submit" class="btn btn-warning w-100">
                            Update Student
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>