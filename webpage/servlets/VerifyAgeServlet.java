
import java.io.*;
import jakarta.servlet.*;             // Tomcat 10
import jakarta.servlet.http.*;        // Tomcat 10
import jakarta.servlet.annotation.*;  // Tomcat 10
//import javax.servlet.*;             // Tomcat 9
//import javax.servlet.http.*;        // Tomcat 9
//import javax.servlet.annotation.*;  // Tomcat 9
 
@WebServlet("/VerifyAgeServlet")   // Configure the request URL for this servlet (Tomcat 7/Servlet 3.0 upwards)
public class VerifyAgeServlet extends HttpServlet {

   // check if provided String parameter is numeric. 
   public static boolean isNumeric(String strNum) {
      if (strNum == null) {
         return false;
      }
      try {
         double d = Double.parseDouble(strNum); // should instead check if input is an integer
      } catch (NumberFormatException nfe) {
         return false;
      }
      return true;
   }

   // The doGet() runs once per HTTP GET request to this servlet.
   @Override
   public void doGet(HttpServletRequest request, HttpServletResponse response)
         throws IOException, ServletException {
      
      // parameters are passed as text ..
      String userAgeText = request.getParameter("userName").trim();
      double userAge;

      // check if input is valid, else provide default value
      if (isNumeric(userAgeText)) {
         userAge = Double.parseDouble(userAgeText);
      } else {
         userAge = 18; 
      }
      
      if (userAge >= 18) {
         // Set the response type of the response message
         response.setContentType("text/plain");
         // Write to response. Pass results to frontend.
         response.getWriter().write("true");
      } else {
         response.setContentType("text/plain");
         response.getWriter().write("false");
      }

   }
}