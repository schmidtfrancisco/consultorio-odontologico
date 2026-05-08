package web;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String usuario = req.getParameter("usuario");
        String contrasena = req.getParameter("contrasena");
        String rol = req.getParameter("rol");

        boolean credencialesOk =
                ("secretario".equals(rol) && "paula.ramos".equals(usuario) && "1234".equals(contrasena))
             || ("odontologo".equals(rol) && "mbravo".equals(usuario) && "1234".equals(contrasena));

        if (!credencialesOk) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp?error=1");
            return;
        }

        HttpSession sesion = req.getSession(true);
        sesion.setAttribute("rol", rol);
        sesion.setAttribute("usuario", usuario);
        if ("secretario".equals(rol)) {
            sesion.setAttribute("nombre", "Paula");
            sesion.setAttribute("apellido", "Ramos");
            sesion.setAttribute("sector", "Recepción");
        } else {
            sesion.setAttribute("nombre", "María");
            sesion.setAttribute("apellido", "Bravo");
            sesion.setAttribute("especialidad", "Ortodoncia");
        }
        resp.sendRedirect(req.getContextPath() + "/dashboard.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect(req.getContextPath() + "/login.jsp");
    }
}
