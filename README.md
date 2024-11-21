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
git clone https://github.com/2024-devops-alt-dist/zythologue-MC
cd zythologue-MC
```


### 2. Construisez et démarrez les conteneurs Docker avec Docker Compose :
```bash
   docker-compose up --build
```

### 3. Configurer DBeaver pour se connecter à PostgreSQLonnées 
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

### 4. Exécuter les scripts SQL dans DBeaver
Après vous être connecté à la base de données dans DBeaver, vous pouvez maintenant exécuter les scripts SQL pour créer les tables et insérer les données :

Ouvrir le script create_tables.sql :
Dans DBeaver, allez dans File > Open et ouvrez le fichier create_tables.sql.
Cliquez sur le bouton Exécuter la requête (ou appuyez sur Ctrl+Enter) pour créer les tables dans la base de données.

Ouvrir le script insert_data.sql :
Ouvrez ensuite le fichier insert_data.sql de la même manière.
Cliquez sur Exécuter la requête pour insérer les données dans les tables que vous venez de créer.

Ouvrir le script request.sql :
Enfin ouvrez le fichier request.sql de la même manière et sélectionner la requête à lancer.


### 5. Retour repo Lucio 
Travail très propre avec le MCD, MLD, MPD. 

Son readme est bien réddigé malheureusement les lignes de commandes pour éxécuter le script pour les tables avec 
docker n'ont pas changé et il a oublié d'indiquer qu'il fallait changer de port pouvoir se connecter à sa db depuis DBeaver.  

En ce qui concerne le script, j'ai rencontré quelques difficultés pour créer et insérer la donnée car son script 
drop table n'est pas sur le même que create et je n'ai pas l'habitude de l'avoir séparé. J'ai du faire une mauvaise 
manipulation qui m'a fait perdre du temps. Ensuite petit problème aussi d'organisation des tables, il faut lancer 
les scripts à tour de rôle pour ne pas rencontrer d'erreur lors de l'insertion de données. En ce qui concerne les 
requêtes aucun vrai souci de rencontrés. 