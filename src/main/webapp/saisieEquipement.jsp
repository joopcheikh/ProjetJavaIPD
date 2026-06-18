<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Saisie d'un Équipement</title>
    <style>
        /* ── Reset & base ── */
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
            max-width: 560px;
            overflow: hidden;
        }

        /* ── Header ── */
        .header {
            background: linear-gradient(135deg, #0f3460, #533483);
            color: #fff;
            padding: 30px 40px;
            text-align: center;
        }

        .header h1 {
            font-size: 1.6rem;
            font-weight: 700;
            letter-spacing: 0.5px;
        }

        .header p {
            margin-top: 6px;
            font-size: 0.9rem;
            opacity: 0.85;
        }

        /* ── Form body ── */
        .form-body {
            padding: 35px 40px 40px;
        }

        /* Message d'erreur */
        .error-msg {
            background: #fdecea;
            border-left: 4px solid #e53935;
            color: #c62828;
            padding: 12px 16px;
            border-radius: 6px;
            margin-bottom: 22px;
            font-size: 0.9rem;
        }

        /* ── Form groups ── */
        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: 600;
            font-size: 0.875rem;
            color: #333;
            margin-bottom: 6px;
        }

        label .required {
            color: #e53935;
            margin-left: 3px;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 11px 14px;
            border: 1.5px solid #d0d7e3;
            border-radius: 8px;
            font-size: 0.95rem;
            color: #333;
            background: #f9fafb;
            transition: border-color 0.25s, box-shadow 0.25s;
            outline: none;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        select:focus {
            border-color: #0f3460;
            box-shadow: 0 0 0 3px rgba(15, 52, 96, 0.15);
            background: #fff;
        }

        /* ── Two-column row ── */
        .row-2 {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
        }

        /* ── Submit button ── */
        .btn-submit {
            width: 100%;
            padding: 13px;
            margin-top: 8px;
            background: linear-gradient(135deg, #0f3460, #533483);
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            letter-spacing: 0.4px;
            transition: opacity 0.2s, transform 0.15s;
        }

        .btn-submit:hover  { opacity: 0.9; transform: translateY(-1px); }
        .btn-submit:active { transform: translateY(0); }
    </style>
</head>
<body>

<div class="container">

    <!-- En-tête -->
    <div class="header">
        <h1>&#128295; Saisie d'un Équipement</h1>
        <p>Remplissez les informations ci-dessous</p>
    </div>

    <!-- Corps du formulaire -->
    <div class="form-body">

        <%-- Affichage d'un éventuel message d'erreur --%>
        <% if (request.getAttribute("erreur") != null) { %>
            <div class="error-msg">&#9888;&nbsp;<%= request.getAttribute("erreur") %></div>
        <% } %>

        <form action="<%= request.getContextPath() %>/traiterEquipement" method="post" novalidate>

            <!-- Code & Nom -->
            <div class="row-2">
                <div class="form-group">
                    <label for="code">Code <span class="required">*</span></label>
                    <input type="text" id="code" name="code"
                           placeholder="ex : EQ-001" required
                           value="<%= request.getParameter("code") != null ? request.getParameter("code") : "" %>">
                </div>
                <div class="form-group">
                    <label for="nom">Nom <span class="required">*</span></label>
                    <input type="text" id="nom" name="nom"
                           placeholder="ex : Ordinateur portable" required
                           value="<%= request.getParameter("nom") != null ? request.getParameter("nom") : "" %>">
                </div>
            </div>

            <!-- Type -->
            <div class="form-group">
                <label for="type">Type <span class="required">*</span></label>
                <select id="type" name="type" required>
                    <option value="" disabled
                        <%= (request.getParameter("type") == null || request.getParameter("type").isEmpty()) ? "selected" : "" %>>
                        -- Sélectionnez un type --
                    </option>
                    <option value="Informatique"  <%= "Informatique".equals(request.getParameter("type"))  ? "selected" : "" %>>Informatique</option>
                    <option value="Bureautique"   <%= "Bureautique".equals(request.getParameter("type"))   ? "selected" : "" %>>Bureautique</option>
                    <option value="Audiovisuel"   <%= "Audiovisuel".equals(request.getParameter("type"))   ? "selected" : "" %>>Audiovisuel</option>
                    <option value="Mobilier"      <%= "Mobilier".equals(request.getParameter("type"))      ? "selected" : "" %>>Mobilier</option>
                    <option value="Médical"       <%= "Médical".equals(request.getParameter("type"))       ? "selected" : "" %>>Médical</option>
                    <option value="Autre"         <%= "Autre".equals(request.getParameter("type"))         ? "selected" : "" %>>Autre</option>
                </select>
            </div>

            <!-- Marque & Fournisseur -->
            <div class="row-2">
                <div class="form-group">
                    <label for="marque">Marque <span class="required">*</span></label>
                    <input type="text" id="marque" name="marque"
                           placeholder="ex : Dell"
                           value="<%= request.getParameter("marque") != null ? request.getParameter("marque") : "" %>">
                </div>
                <div class="form-group">
                    <label for="fournisseur">Fournisseur <span class="required">*</span></label>
                    <input type="text" id="fournisseur" name="fournisseur"
                           placeholder="ex : Tech Solutions"
                           value="<%= request.getParameter("fournisseur") != null ? request.getParameter("fournisseur") : "" %>">
                </div>
            </div>

            <!-- Prix -->
            <div class="form-group">
                <label for="prix">Prix (FCFA) <span class="required">*</span></label>
                <input type="number" id="prix" name="prix"
                       placeholder="ex : 450000" min="0" step="0.01" required
                       value="<%= request.getParameter("prix") != null ? request.getParameter("prix") : "" %>">
            </div>

            <button type="submit" class="btn-submit">Enregistrer l'équipement &#8594;</button>

        </form>
    </div><!-- /.form-body -->

</div><!-- /.container -->

</body>
</html>
