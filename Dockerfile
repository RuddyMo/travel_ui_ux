# Utilisez l'image node comme base
FROM node

# Définissez le répertoire de travail dans le conteneur
WORKDIR /app

# Copiez le package.json et le package-lock.json pour installer les dépendances
COPY package*.json ./

# Installez les dépendances
RUN npm install

# Copiez les fichiers du projet dans le conteneur
COPY . .

# Construisez votre application Next.js
RUN npm run build

# Exposez le port sur lequel l'application fonctionne
EXPOSE 3000

# Démarrez l'application
CMD ["npx", "serve", "-s", "out"]
