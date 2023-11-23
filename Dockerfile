FROM python:3.11.2-slim


# là se trouvera ton projet dans le container
WORKDIR /app   

# copie le fichier requirements.txt dans le container
COPY requirement.txt .

# install les dépendances dans le container
RUN pip install --no-cache-dir -r requirement.txt

# copie le reste du projet dans le container, dans le dossier déinie par WORKDIR (donc ici, /app)
COPY . .

# expose le port 8000 du container (c'est le port par défaut)
EXPOSE 8000
CMD ["uvicorn", "main:app", "--reload"]
