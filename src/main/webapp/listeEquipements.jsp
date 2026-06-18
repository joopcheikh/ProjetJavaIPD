<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.devoir.metier.Equipement, java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Équipements</title>
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%);
            min-height: 100vh;
            padding: 30px 20px;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
        }

        /* ── Header ── */
        .header {
            background: linear-gradient(135deg, #0f3460, #533483);
            color: #fff;
            border-radius: 16px 16px 0 0;
            padding: 28px 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 12px;
        }

        .header h1 { font-size: 1.5rem; font-weight: 700; }
        .header p  { font-size: 0.88rem; opacity: 0.85; margin-top: 4px; }

        .badge-count {
            background: rgba(255,255,255,0.2);
            border: 1px solid rgba(255,255,255,0.35);
            color: #fff;
            border-radius: 20px;
            padding: 6px 18px;
            font-size: 0.88rem;
            font-weight: 600;
            white-space: nowrap;
        }

        /* ── Card body ── */
        .card-body {
            background: #fff;
            border-radius: 0 0 16px 16px;
            padding: 30px 40px 40px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.4);
        }

        /* ── Barre d'actions ── */
        .actions-bar {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 20px;
        }

        .btn {
            padding: 10px 22px;
            border: none;
            border-radius: 8px;
            font-size: 0.9rem;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: opacity 0.2s, transform 0.15s;
        }
        .btn:hover  { opacity: 0.88; transform: translateY(-1px); }
        .btn:active { transform: translateY(0); }

        .btn-primary   { background: linear-gradient(135deg,#0f3460,#533483); color:#fff; }
        .btn-danger    { background: #e53935; color: #fff; margin-left: 10px; }
        .btn-secondary { background: #eceff1; color: #37474f; border: 1.5px solid #cfd8dc; margin-left: 10px; }

        /* ── Table ── */
        .table-wrapper {
            overflow-x: auto;
            border-radius: 10px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.07);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 650px;
        }

        thead tr {
            background: linear-gradient(135deg,#0f3460,#533483);
            color: #fff;
        }

        thead th {
            padding: 13px 16px;
            text-align: left;
            font-size: 0.85rem;
            font-weight: 600;
            letter-spacing: 0.4px;
        }

        tbody tr:nth-child(odd)  { background: #f9fafb; }
        tbody tr:nth-child(even) { background: #ffffff; }
        tbody tr:hover           { background: #e8eaf6; transition: background 0.15s; }

        tbody td {
            padding: 12px 16px;
            font-size: 0.92rem;
            color: #444;
            border-bottom: 1px solid #e8ecf0;
        }

        /* Numéro de ligne */
        td.num {
            color: #999;
            font-size: 0.82rem;
            text-align: center;
            width: 40px;
        }

        /* Badge type */
        .badge-type {
            background: #e8eaf6;
            color: #3949ab;
            border-radius: 12px;
            padding: 3px 10px;
            font-size: 0.8rem;
            font-weight: 600;
        }

        /* Prix */
        .prix { font-weight: 700; color: #2e7d32; }

        /* ── Empty state ── */
        .empty {
            text-align: center;
            padding: 50px 20px;
            color: #999;
        }
        .empty .icon { font-size: 3.5rem; }
        .empty p { margin-top: 12px; font-size: 1rem; }
    </style>
</head>
<body>

<%
    List<Equipement> liste = (List<Equipement>) session.getAttribute("listeEquipements");
    int total = (liste != null) ? liste.size() : 0;
%>

<div class="container">

    <!-- En-tête -->
    <div class="header">
        <div>
            <h1>&#128230; Liste des Équipements</h1>
            <p>Tous les équipements enregistrés dans la session</p>
        </div>
        <span class="badge-count"><%= total %> équipement<%= total > 1 ? "s" : "" %></span>
    </div>

    <!-- Corps -->
    <div class="card-body">

        <div class="actions-bar">
            <a href="<%= request.getContextPath() %>/saisieEquipement.jsp" class="btn btn-primary">
                &#43; Nouvel équipement
            </a>
            <a href="<%= request.getContextPath() %>/viderListe" class="btn btn-danger"
               onclick="return confirm('Vider toute la liste ?')">
                &#128465; Vider la liste
            </a>
            <a href="#" onclick="window.print(); return false;" class="btn btn-secondary">
                &#128438; Imprimer
            </a>
        </div>

        <% if (liste == null || liste.isEmpty()) { %>
            <div class="empty">
                <div class="icon">&#128230;</div>
                <p>Aucun équipement enregistré pour le moment.</p>
            </div>
        <% } else { %>
            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Code</th>
                            <th>Nom</th>
                            <th>Type</th>
                            <th>Marque</th>
                            <th>Fournisseur</th>
                            <th>Prix (FCFA)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% int i = 1; for (Equipement eq : liste) { %>
                        <tr>
                            <td class="num"><%= i++ %></td>
                            <td><strong><%= eq.getCode() %></strong></td>
                            <td><%= eq.getNom() %></td>
                            <td><span class="badge-type"><%= eq.getType() %></span></td>
                            <td><%= eq.getMarque() %></td>
                            <td><%= eq.getFournisseur() %></td>
                            <td class="prix"><%= String.format("%,.0f", eq.getPrix()) %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        <% } %>

    </div>
</div>

</body>
</html>
