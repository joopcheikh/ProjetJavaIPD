# Gestion d'Équipement - Cas Pratique Déploiement

Application web Java/JSP pour gérer un inventaire d'équipements.

## Lancer localement

```bash
mvn clean package cargo:run
```

Accès : http://localhost:8081/GestionEquipement/

## Déployer en ligne (gratuit)

### 1. Initialiser Git et pousser sur GitHub

```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/<ton-user>/<ton-repo>.git
git push -u origin main
```

### 2. Compiler le WAR (important avant Docker!)

```bash
mvn clean package
```

### 3. Déployer sur Railway.app (le plus simple)

1. Va sur https://railway.app
2. Clique "New Project" → "Deploy from GitHub repo"
3. Sélectionne ton repo GitHub
4. Railway détecte le `Dockerfile` et déploie automatiquement
5. Ton app sera accessible à une URL style `https://monapp-prod.up.railway.app/`

**Coût** : Gratuit avec $5 de crédit/mois (suffisant pour un projet test)

### 4. Alternative : Render.com

1. Va sur https://render.com
2. "New +" → "Web Service" → "Connect GitHub"
3. Sélectionne le repo
4. Render lance le build et déploie
5. Ton app est en ligne gratuitement (mais peut hibernater après 15 min d'inactivité)

### 5. Alternative : Google Cloud Run (serverless)

```bash
# Nécessite Docker installé et compte Google Cloud
docker build -t gestion-equipement .
docker tag gestion-equipement gcr.io/<ton-project-id>/gestion-equipement
docker push gcr.io/<ton-project-id>/gestion-equipement

# Puis déploie via Google Cloud Console
gcloud run deploy gestion-equipement \
  --image gcr.io/<ton-project-id>/gestion-equipement \
  --platform managed \
  --region europe-west1
```

## Pour l'exposé

**Étapes à montrer** :
1. Code source (VS Code)
2. Compilation locale (`mvn package`)
3. Test local (`mvn cargo:run`)
4. Container (`docker build` + `docker run`)
5. Push GitHub
6. Déploiement automatique sur Railway/Render
7. App live en ligne !

**Points clés** :
- IaC (Infrastructure as Code) avec Docker
- CI/CD automatique avec Git + Railway
- Pas de serveur physique à maintenir
- Scalabilité et haute disponibilité incluses

## Fichiers clés

- `pom.xml` : Configuration Maven et dépendances
- `Dockerfile` : Définition du container
- `src/main/java/` : Code backend (Servlets)
- `src/main/webapp/` : Frontend (JSP)
