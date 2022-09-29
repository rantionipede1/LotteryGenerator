import java.io.*;
import jakarta.servlet.*;             // Tomcat 10
import jakarta.servlet.http.*;        // Tomcat 10
import jakarta.servlet.annotation.*;  // Tomcat 10
//import javax.servlet.*;             // Tomcat 9
//import javax.servlet.http.*;        // Tomcat 9
//import javax.servlet.annotation.*;  // Tomcat 9
 
@WebServlet("/SessionServlet")   // Configure the request URL for this servlet (Tomcat 7/Servlet 3.0 upwards)
public class SessionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
