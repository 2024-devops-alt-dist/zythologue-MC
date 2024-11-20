# Zythologue

Brief sur la conception de la base de doonées, avec MCD, MLD, MPD, et le dictionnaire de données des différentes tables.

## Prérequis

Avant de pouvoir lancer ce projet, assurez-vous d'avoir les éléments suivants installés sur votre machine :
- Docker
- Docker Compose
- DBeaver (ou tout autre client SQL pour interagir avec PostgreSQL)

## Lancer le projet avec Docker et se connecter avec DBeaver

### 1. Cloner le repository

Clonez le repository et accédez au répertoire du projet :

```bash
git clone https://github.com/votre-utilisateur/nom-du-repository.git
cd nom-du-repository ```bash

   
###2. Construisez et démarrez les conteneurs Docker avec Docker Compose :
    ```bash
   docker-compose up --build

3. Configurer DBeaver pour se connecter à PostgreSQLonnées 
Une fois que les conteneurs sont lancés, vous pouvez vous connecter à la base de données PostgreSQL via DBeaver en suivant ces étapes :

Ouvrir DBeaver.

Créer une nouvelle connexion :

Cliquez sur "Database" dans la barre de menu et sélectionnez "New Database Connection".
Choisissez PostgreSQL comme type de base de données, puis cliquez sur Next.

Configurer la connexion :
Host : localhost
Port : 5432 (par défaut pour PostgreSQL)
Database : postgres
Username : postgres 
Password : postgres
Exemple de configuration dans DBeaver :

Tester la connexion :
Cliquez sur "Test Connection" pour vérifier si DBeaver peut se connecter à la base de données. Si la connexion réussit, cliquez sur Finish pour enregistrer la connexion.

4. Exécuter les scripts SQL dans DBeaver
Après vous être connecté à la base de données dans DBeaver, vous pouvez maintenant exécuter les scripts SQL pour créer les tables et insérer les données :

Ouvrir le script create_tables.sql :
Dans DBeaver, allez dans File > Open et ouvrez le fichier create_tables.sql.
Cliquez sur le bouton Exécuter la requête (ou appuyez sur Ctrl+Enter) pour créer les tables dans la base de données.

Ouvrir le script insert_data.sql :
Ouvrez ensuite le fichier insert_data.sql de la même manière.
Cliquez sur Exécuter la requête pour insérer les données dans les tables que vous venez de créer.


