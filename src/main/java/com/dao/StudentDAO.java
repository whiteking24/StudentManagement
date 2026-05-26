package com.dao;

import com.model.Student;
import com.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

    Connection con;

    public StudentDAO() {
        con = DBConnection.getConnection();
    }

    // INSERT
    public void insertStudent(Student s) {

        try {

            String query =
                    "INSERT INTO students(name,email,course) VALUES(?,?,?)";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, s.getName());
            ps.setString(2, s.getEmail());
            ps.setString(3, s.getCourse());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // SELECT ALL
    public List<Student> getAllStudents() {

        List<Student> list = new ArrayList<>();

        try {

            String query = "SELECT * FROM students";

            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Student s = new Student();

                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                s.setCourse(rs.getString("course"));

                list.add(s);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // DELETE
    public void deleteStudent(int id) {

        try {

            String query = "DELETE FROM students WHERE id=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, id);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // GET BY ID
    public Student getStudentById(int id) {

        Student s = new Student();

        try {

            String query = "SELECT * FROM students WHERE id=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                s.setCourse(rs.getString("course"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return s;
    }

    // UPDATE
    public void updateStudent(Student s) {

        try {

            String query =
                    "UPDATE students SET name=?,email=?,course=? WHERE id=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, s.getName());
            ps.setString(2, s.getEmail());
            ps.setString(3, s.getCourse());
            ps.setInt(4, s.getId());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}