import java.io.*;
import jakarta.servlet.*;             
import jakarta.servlet.http.*;        
import jakarta.servlet.annotation.*;  

@WebServlet("/NumPlaysServlet")   // URL for requests.
public class NumPlaysServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// Get current session. If session does not exist, verify input <= 5. Create new session and set attributes (plays) and (playsRemaining) to input value.
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
