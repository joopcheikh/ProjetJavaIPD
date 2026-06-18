package com.devoir.servlet;

import com.devoir.metier.Equipement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet qui traite le formulaire de saisie d'un équipement,
 * stocke l'objet en session et l'ajoute à la liste globale.
 */
@WebServlet("/traiterEquipement")
public class EquipementServlet extends HttpServlet {

    @Override
    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // Récupération des paramètres du formulaire
        String code        = request.getParameter("code");
        String nom         = request.getParameter("nom");
        String type        = request.getParameter("type");
        String marque      = request.getParameter("marque");
        String fournisseur = request.getParameter("fournisseur");
        String prixStr     = request.getParameter("prix");

        // Validation basique du prix
        double prix = 0.0;
        try {
            if (prixStr != null && !prixStr.isBlank()) {
                prix = Double.parseDouble(prixStr);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("erreur", "Le prix doit être un nombre valide.");
            request.getRequestDispatcher("/saisieEquipement.jsp").forward(request, response);
            return;
        }

        // Construction de l'objet métier
        Equipement equipement = new Equipement(code, nom, type, marque, fournisseur, prix);

        HttpSession session = request.getSession();

        // Stocker l'équipement courant (pour recuperationEquipement.jsp)
        session.setAttribute("equipement", equipement);

        // Ajouter à la liste de tous les équipements
        List<Equipement> listeEquipements =
                (List<Equipement>) session.getAttribute("listeEquipements");
        if (listeEquipements == null) {
            listeEquipements = new ArrayList<>();
        }
        listeEquipements.add(equipement);
        session.setAttribute("listeEquipements", listeEquipements);

        // Redirection vers la page de récupération
        request.getRequestDispatcher("/recuperationEquipement.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/saisieEquipement.jsp");
    }
}
