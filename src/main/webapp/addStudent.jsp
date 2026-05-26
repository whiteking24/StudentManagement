<!DOCTYPE html>
<html>
<head>
    <title>Add Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow">
                <div class="card-header bg-success text-white text-center">
                    <h3>Add Student</h3>
                </div>
                <div class="card-body">
                    <form action="student" method="get">
                        <input type="hidden"
                               name="action"
                               value="insert">
                        <div class="mb-3">
                            <label>Name</label>
                            <input type="text"
                                   name="name"
                                   class="form-control"
                                   required>
                        </div>
                        <div class="mb-3">
                            <label>Email</label>
                            <input type="email"
                                   name="email"
                                   class="form-control"
                                   required>
                        </div>
                        <div class="mb-3">
                            <label>Course</label>
                            <input type="text"
                                   name="course"
                                   class="form-control"
                                   required>
                        </div>
                        <button type="submit"
                                class="btn btn-success w-100">
                            Save Student
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>