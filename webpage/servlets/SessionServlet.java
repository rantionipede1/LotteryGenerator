import java.io.*;
import jakarta.servlet.*;            
import jakarta.servlet.http.*;        
import jakarta.servlet.annotation.*;  

@WebServlet("/SessionServlet")   // URL for request
public class SessionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// returns the session values (plays) and (playsRemaining) if they exist. Empty string is resulted otherwise.

   @Override
   public void doGet(HttpServletRequest request, HttpServletResponse response)
         throws IOException, ServletException {
      
      String returnValue = "null";
      HttpSession session=request.getSession(false);
      
      if ((session != null) && (session.getAttribute("plays") != null)) {
         session = request.getSession();
         String playsData = String.valueOf(session.getAttribute("plays"));
         String playsRemainingData = String.valueOf(session.getAttribute("playsRemaining"));
         returnValue = playsRemainingData + "," + playsData;
         System.out.println("Session exists " +  returnValue);
         
         response.setContentType("text/plain");
         response.getWriter().write(returnValue);
      }

   }
}
