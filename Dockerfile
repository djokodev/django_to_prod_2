# J'ai une qustion au niveau de la difference entre apline et slim comment choisir etc j'aimerais ton avis
FROM python:3.12-slim

# Crée un utilisateur système sans privilèges root
RUN useradd -m -r appuser && \
    mkdir /app && \
    chown -R appuser /app

WORKDIR /app

# Configuration pour éviter les fichiers pyc et afficher les logs immédiatement
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1 

RUN pip install --upgrade pip 

COPY requirements.txt  /app/

RUN pip install --no-cache-dir -r requirements.txt

# Copie le code de l’application avec les bons droits
COPY --chown=appuser:appuser . .

# Utilise l'utilisateur non-root
USER appuser

EXPOSE 8000
