package user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Servlet과 통신 시작");
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		String userID = request.getParameter("userID");
		String userPassword1 = request.getParameter("userPassword1");
		String userPassword2 = request.getParameter("userPassword2");
		String userName = request.getParameter("userName");
		String userAge = request.getParameter("userAge");
		String userEmail = request.getParameter("userEmail");
		String userGender = request.getParameter("userGender");
		
		if(userID == null || userID.equals("") ||userPassword1 == null || userPassword1.equals("") ||userPassword2 == null || userPassword2.equals("") ||
				userName == null || userName.equals("") ||userAge == null || userAge.equals("") ||
				userEmail == null || userEmail.equals("") ||userGender == null || userGender.equals("") ) {
			
			
			request.getSession().setAttribute("messageType", "Error message");
			request.getSession().setAttribute("messageContent", "You should fill the whole form");
			response.sendRedirect("index.jsp");
			
			System.out.println("첫번째 if문 들어옴");
			System.out.println(userID + userPassword1 + userPassword2 + userName + userAge + userEmail + userGender);
			
			return;
		}
		if(!userPassword1.equals(userPassword2)) {
			request.getSession().setAttribute("messageType", "Error message");
			request.getSession().setAttribute("messageContent", "The passwords you input are different each other");
			response.sendRedirect("index.jsp");
			
			System.out.println("두번째 if문 들어옴");
			
			return;
		}
		
		int result = new UserDAO().register(userID, userPassword1, userName, userAge, userGender, userEmail);
		
		if(result == 1) {
			request.getSession().setAttribute("messageType", "Success message");
			request.getSession().setAttribute("messageContent", "Success to create New Account");
			response.sendRedirect("index.jsp");
			return;
		}else {
			request.getSession().setAttribute("messageType", "Fail message");
			request.getSession().setAttribute("messageContent", "Fail to create New Account");
			response.sendRedirect("index.jsp");
			return;
		}
		
	}

}
