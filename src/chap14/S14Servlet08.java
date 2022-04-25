package chap14;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import chap14.javaBeans.*;

/**
 * Servlet implementation class S14Servlet06
 */
@WebServlet("/S14Servlet08")
public class S14Servlet08 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public S14Servlet08() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sql = "SELECT FirstName, LastName, BirthDate FROM Employees ";
		
		// 직원 명단 List로 출력하기
		List<Employee> list = new ArrayList<>();
		
		ServletContext application = getServletContext();
		DataSource ds = (DataSource) application.getAttribute("dbpool");
		
		try (
			Connection con = ds.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);) {
			
			while (rs.next()) {
				Employee employee = new Employee();
					
				String firstName = rs.getString("FirstName");
				String lastName = rs.getString("LastName");
				String birthDate = rs.getString("BirthDate");
					
				employee.setFirstName(firstName);
				employee.setLastName(lastName);
				employee.setBirthDate(birthDate);
				
				list.add(employee);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("employee", list);
		
		String path = "/WEB-INF/view/chap14/ex06.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}