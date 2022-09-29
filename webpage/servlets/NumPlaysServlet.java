import java.io.*;
import jakarta.servlet.*;             
import jakarta.servlet.http.*;        
import jakarta.servlet.annotation.*;  

@WebServlet("/NumPlaysServlet")   // Configure the request URL for this servlet (Tomcat 7/Servlet 3.0 upwards)
public class NumPlaysServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

   @Override
   public void doGet(HttpServletRequest request, HttpServletResponse response)
         throws IOException, ServletException {
	   
	   HttpSession session = request.getSession();
	   String data = (String) request.getParameter("plays");
	   int numPlays;
	   
	   if ((session != null) && (session.getAttribute("plays") == null)) {
		   session = request.getSession(true);
		   numPlays = Integer.parseInt(data.trim());	// TO-DO: verify if provided data is in integer format first!
		   
		   if (numPlays <= 5) {							// verify maximum 5 plays.
			   session.setAttribute("plays", numPlays);
			   session.setAttribute("playsRemaining", numPlays);
			   response.setContentType("text/plain");
			   response.getWriter().write("true");
		   }
	   }
   }
}
