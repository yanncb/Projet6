# Titre du projet

![forthebadge](https://forthebadge.com/images/badges/gluten-free.svg)

Avec l’objectif de fédérer les licenciés, l’association “​Les amis de l’escalade”
souhaite développer sa présence en ligne. À ce titre, plusieurs axes d’amélioration
ont été identifiés dont la création d’un site communautaire.
Ce site aura pour but la mise en relation et le partage d’informations. Il permettra
de donner de la visibilité à l’association afin d’encourager des grimpeurs
indépendants à y adhérer.

## Pour commencer

Entrez ici les instructions pour bien débuter avec votre projet...

### Pré-requis

Ce qu'il est requis pour commencer avec votre projet...

- Java
- Spring Boot
- Base de donnée PostgresSql
- JSP

### Installation
Pour installer PostGres vous pouvez vous referer au guide : https://www.veremes.com/installation-postgresql-windows.
Une fois installé vous devrais ouvrir cmd.exe sous Windows et entrer ces informations.

1 - Creation d'une bdd et d'un utilisateur propriétaire de la bdd psql -U postgres -a -f données.sql.

Renseigner le mot de passe de l'utilisateur postgres (dans mon cas, c'est admin).

Ensuite Installer le serveur TomCat, un tutoriel est disponible : http://objis.com/tutoriel-tomcat-n1-installation-tomcat-8/

Configuration : Se rendre dans le fichier conf/tomcat-users.xml, ajouter 

  <role rolename="manager-gui"/>
  <role rolename="admin"/>
  <user username="admin" password="admin" roles="manager-gui,admin"/>
  Pour creer un role et pouvoir acceder à l'interface manager.
  
Déployer le fichier war

Se rendre sur l'URL : http://localhost:8080/manager
Il suffit de spécifier l’emplacement de votre fichier war de manière à l’uploader sur votre serveur tomcat qui le déploiera automatiquement. Depuis le manager tomcat, dans la zone de déploiement « WAR file to deploy » comme ci-dessous :

tomcat-manager2

– dans la zone «Select WAR file to upload» cliquer sur le bouton «Parcourir»;
– une fenêtre de sélection de fichier s’ouvre;
– sélectionner le fichier war à déployer;
– valider;
– enfin cliquer sur le bouton « Deploy» dans la page du manager.

Dans la zone « Message» du manager, il est indiqué la réussite ou l’échec du déploiement. Ceci est la manière la plus simple pour déployer un war sous tomcat.

Une autre manière de faire est de déposer le fichier war directement dans le dossier webapps du dossier d’installation de Tomcat. Tomcat déploiera automatiquement l’application issue du fichier war.

## Démarrage

Allez sur l'URL : http://localhost:8080/amis-escalade-0.0.1-SNAPSHOT/

## Fabriqué avec

- Java
- Spring Boot
- Base de donnée PostgresSql
- JSP
- IntelliJ

## Auteurs

Listez le(s) auteur(s) du projet ici !
* **Yann CABERAS** _alias_ [yanncb](https://github.com/yanncb)




