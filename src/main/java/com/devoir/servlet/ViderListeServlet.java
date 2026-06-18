package com.devoir.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet qui vide la liste des équipements en session.
 */
@WebServlet("/viderListe")
public class ViderListeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().removeAttribute("listeEquipements");
        response.sendRedirect(request.getContextPath() + "/listeEquipements.jsp");
    }
}
