# DUT-2 - Depot de Travaux Pratiques

Ce depot regroupe plusieurs mini-projets realises autour de Java, Java Web, SQL, XML et JavaScript.
La structure est celle d'un workspace Eclipse avec plusieurs modules independants.

## Vue d'ensemble

- **Java SE**: exercices de POO, threads, serialisation JSON, introspection, Swing.
- **Java Web (Jakarta / JSP / Servlet)**: formulaires HTML/JSP et servlet simple.
- **Base de donnees**: scripts SQL/PLSQL (cursors, fonctions, triggers, gestion d'erreurs).
- **XML**: DTD, XSD, XSLT et exemples de validation/transformation.
- **JavaScript**: mini Todo List en HTML/CSS/JS.

## Structure du depot

### Projets Java Web (Eclipse Dynamic Web Project)

- `MonProjetWeb`: servlet `FirstServlet` + pages JSP (`test.jsp`, `page2.jsp`).
- `WebApp`: squelette web avec `index.html` et `index.jsp`.
- `ContactWebApp`: formulaire HTML de creation de contact.
- `FormulaireContactAppli`: formulaire de contact en JSP.
- `ContactFormulaireApp`, `FormulaireContactApp`: projets web de base (principalement configuration).

Ces projets sont configures pour Eclipse/Tomcat (fichiers `.project`, `.classpath`, `web.xml`).

### Projets Java SE

- `TP2`: classe `Compteur` (POO de base).
- `TP_2`: compteur thread-safe (`synchronized`) avec execution multi-thread (`Task`, `TestJava`).
- `TP2_2`: serialisation JSON avec Jackson (`Contact`, `TestJava`).
- `TP_java_2`: lecture JSON avec Jackson (`Contact`, `Program`).
- `TP_GUI`: interface Swing simple (formulaire nom/email).
- `Tp_java_DB`: connexion JDBC SQLite (`ventes.db`) + requete sur `produits`.
- `Tp_java_introspection`: reflection Java sur interface `OperationCommerciale`.
- `GUI`: module Java contenant des classes du driver MySQL (bundled).

### Projets SQL

Dossier `TP_SQL`:

- `tp1`: 8 scripts
- `tp2`: 5 scripts
- `tp3`: 18 scripts
- `tp4`: 6 scripts
- `tp5`: 1 fichier notebook SQL (`exo.sqlnb`)

Contenu principal: blocs PLSQL, curseurs, fonctions stockees, triggers, exceptions.

### Projets XML

Dossier `TP_xml`:

- Exercices XML (`Exercice2.xml`, `Exercice3.xml`, etc.)
- DTD (`tp_serie2/Exercice1dtd.dtd`, `Exercice2DTD.dtd`)
- XSD (`tp_serie2/Test.xsd`, `tp_serie3/Exercice*.xsd`)
- XSLT (`tp_serie2/tp_serie3/Biblio.xsl`)
- `package.json` (dependances `bootstrap`, `react-bootstrap`)

### Projet JavaScript

- `tp_js/atelier II/exercice1.html`
- `tp_js/atelier II/exercice1.js`

Mini Todo List: ajout/suppression de taches cote navigateur.

## Stack technique

- **Java**: Java SE 17/23 selon les projets
- **Jakarta EE / JSP / Servlet**
- **Tomcat**: references Eclipse vers Tomcat v11 sur les projets web
- **JDBC**: SQLite (`sqlite-jdbc`) et classes MySQL presentes dans `GUI`
- **JSON**: Jackson (`jackson-core`, `jackson-databind`, `jackson-annotations`)
- **SQL/PLSQL**
- **XML / DTD / XSD / XSLT**
- **HTML / CSS / JavaScript**

## Prerequis

- Eclipse IDE (Java + Enterprise Web)
- JDK 17 ou plus
- Apache Tomcat (v11 recommande pour les projets web en Jakarta)
- Un client SQL compatible PLSQL pour les scripts `TP_SQL`

## Lancer les projets

### 1) Import dans Eclipse

1. Ouvrir Eclipse
2. `File > Import > Existing Projects into Workspace`
3. Selectionner la racine de ce depot

### 2) Projets Java SE

1. Ouvrir la classe contenant `main` (ex: `TP_2/src/com/info/ests/TestJava.java`)
2. `Run As > Java Application`

### 3) Projets Java Web

1. Configurer un serveur Tomcat dans Eclipse
2. Ajouter le projet web au serveur (`MonProjetWeb`, `ContactWebApp`, etc.)
3. `Run on Server`
4. Ouvrir l'URL locale generee par Eclipse/Tomcat

### 4) Scripts SQL

1. Ouvrir les scripts du dossier `TP_SQL`
2. Executer dans votre environnement SQL/PLSQL
3. Adapter si besoin les noms de tables/types selon votre schema

### 5) TP JavaScript

1. Ouvrir `tp_js/atelier II/exercice1.html` dans un navigateur

## Notes

- Plusieurs fichiers semblent etre des exercices en cours d'apprentissage, avec du code volontairement simple.
- Des problemes d'encodage peuvent apparaitre sur certains textes accentues selon l'editeur/console.
- Le depot contient des artefacts Eclipse (`.project`, `.classpath`, `.settings`) utiles pour une reprise rapide dans l'IDE.
