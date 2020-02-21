<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Ajout secteur</title>
</head>
<body>
<jsp:include page="header.jsp"/>

<div class="container">

    <h1>Ajout secteur</h1>

    <form:form method="POST" modelAttribute="secteur" action="/ajout-secteur">
        <p>Ajouter un seteur pour le site :</p>
        <p>Id : ${secteur.site.id}</p>
        <p>Nom : ${secteur.site.nom}</p>
        <p>Adresse : ${secteur.site.adresse}</p>
        <p>Pays : ${secteur.site.pays}</p>

        <form:input type="hidden" path="site.id"/>

        <form:input type="text" path="secteurNom" class="form-control form-control-sm mb-3" placeholder="Nom"
                    autofocus="true"/>


        <input type="submit" class="btn btn-success" value="Ajouter"/>
        <input type="reset" class="btn btn-danger" value="Reset"/>
        <a class="btn btn-danger" href="/site/${secteur.site.id}">Cancel</a>


    </form:form>
</div>
</body>
</html>
