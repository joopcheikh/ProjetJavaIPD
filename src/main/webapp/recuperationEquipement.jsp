<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.devoir.metier.Equipement" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Récupération de l'Équipement</title>
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .container {
            background: #ffffff;
            border-radius: 16px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.4);
            width: 100%;
            max-width: 580px;
            overflow: hidden;
        }

        /* ── Header ── */
        .header {
            background: linear-gradient(135deg, #1b5e20, #2e7d32);
            color: #fff;
            padding: 30px 40px;
            text-align: center;
        }

        .header .icon { font-size: 2.2rem; }

        .header h1 {
            font-size: 1.5rem;
            font-weight: 700;
            margin-top: 8px;
        }

        .header p {
            margin-top: 6px;
            font-size: 0.9rem;
            opacity: 0.85;
        }

        /* ── Card body ── */
        .card-body {
            padding: 35px 40px 40px;
        }

        /* Badge de succès */
        .badge-success {
            display: inline-block;
            background: #e8f5e9;
            color: #2e7d32;
            border: 1px solid #a5d6a7;
            border-radius: 20px;
            padding: 5px 16px;
            font-size: 0.82rem;
            font-weight: 600;
            margin-bottom: 24px;
        }

        /* ── Table de données ── */
        .data-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 28px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 12px rgba(0,0,0,0.07);
        }

        .data-table thead tr {
            background: linear-gradient(135deg, #0f3460, #533483);
            color: #fff;
        }

        .data-table thead th {
            padding: 13px 18px;
            text-align: left;
            font-size: 0.85rem;
            font-weight: 600;
            letter-spacing: 0.4px;
        }

        .data-table tbody tr:nth-child(odd)  { background: #f9fafb; }
        .data-table tbody tr:nth-child(even) { background: #ffffff; }

        .data-table tbody tr:hover { background: #e8eaf6; }

        .data-table tbody td {
            padding: 13px 18px;
            font-size: 0.93rem;
            color: #444;
            border-bottom: 1px solid #e8ecf0;
        }

        .data-table tbody td:first-child {
            font-weight: 600;
            color: #0f3460;
            width: 40%;
        }

        /* Prix mis en valeur */
        .prix-value {
            font-weight: 700;
            color: #2e7d32;
            font-size: 1rem;
        }

        /* ── Boutons ── */
        .actions {
            display: flex;
            gap: 12px;
        }

        .btn {
            flex: 1;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 0.95rem;
            font-weight: 600;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            transition: opacity 0.2s, transform 0.15s;
        }

        .btn:hover  { opacity: 0.88; transform: translateY(-1px); }
        .btn:active { transform: translateY(0); }

        .btn-primary {
            background: linear-gradient(135deg, #0f3460, #533483);
            color: #fff;
        }

        .btn-secondary {
            background: #eceff1;
            color: #37474f;
            border: 1.5px solid #cfd8dc;
        }

        /* ── Message si pas d'équipement ── */
        .no-data {
            text-align: center;
            padding: 30px 0;
            color: #777;
        }

        .no-data .icon { font-size: 3rem; }
        .no-data p { margin-top: 10px; font-size: 0.95rem; }
    </style>
</head>
<body>

<%
    /* Récupération de l'objet Equipement depuis la session */
    Equipement eq = (Equipement) session.getAttribute("equipement");
%>

<div class="container">

    <% if (eq != null) { %>

        <!-- En-tête succès -->
        <div class="header">
            <div class="icon">&#9989;</div>
            <h1>Équipement Enregistré</h1>
            <p>Les données ont été récupérées avec succès</p>
        </div>

        <div class="card-body">

            <div class="badge-success">&#10003;&nbsp; Récupération via la classe Equipement</div>

            <!-- Tableau récapitulatif -->
            <table class="data-table">
                <thead>
                    <tr>
                        <th>Champ</th>
                        <th>Valeur</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Code</td>
                        <td><%= eq.getCode() %></td>
                    </tr>
                    <tr>
                        <td>Nom</td>
                        <td><%= eq.getNom() %></td>
                    </tr>
                    <tr>
                        <td>Type</td>
                        <td><%= eq.getType() %></td>
                    </tr>
                    <tr>
                        <td>Marque</td>
                        <td><%= eq.getMarque() %></td>
                    </tr>
                    <tr>
                        <td>Fournisseur</td>
                        <td><%= eq.getFournisseur() %></td>
                    </tr>
                    <tr>
                        <td>Prix</td>
                        <td class="prix-value">
                            <%= String.format("%,.0f", eq.getPrix()) %>&nbsp;FCFA
                        </td>
                    </tr>
                </tbody>
            </table>

            <!-- Boutons d'action -->
            <div class="actions">
                <a href="<%= request.getContextPath() %>/saisieEquipement.jsp"
                   class="btn btn-primary">&#43; Nouvel équipement</a>
                <a href="<%= request.getContextPath() %>/listeEquipements.jsp"
                   class="btn btn-secondary">&#128230; Voir la liste</a>
            </div>

        </div>

    <% } else { %>

        <!-- En-tête erreur -->
        <div class="header" style="background: linear-gradient(135deg,#b71c1c,#c62828);">
            <div class="icon">&#9888;</div>
            <h1>Aucun Équipement Trouvé</h1>
            <p>La session ne contient pas de données</p>
        </div>

        <div class="card-body">
            <div class="no-data">
                <div class="icon">&#128269;</div>
                <p>Veuillez d'abord remplir le formulaire de saisie.</p>
            </div>
            <div class="actions">
                <a href="<%= request.getContextPath() %>/saisieEquipement.jsp"
                   class="btn btn-primary">&#8592; Aller au formulaire</a>
            </div>
        </div>

    <% } %>

</div>

</body>
</html>
