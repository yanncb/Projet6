<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Modifier Longueur</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">

    <p>Modifier une longueur du secteur : </p>
    <p>Id : ${longueur.voie.id}</p>
    <p>Nom : ${longueur.voie.nom_voie}</p>
    <p>Adresse : ${longueur.voie.altitude}</p>
    <p>Pays : ${longueur.voie.type_roche}</p>

    <h2>Modifier Longueur : </h2>

    <form:form method="POST" modelAttribute="longueur" action="/modifier-longueur">

        <form:input type="hidden" path="voie.id"></form:input>

        <form:input type="hidden" path="id"></form:input>

        <form:input type="text" path="nom_longueur" class="form-control form-control-sm mb-3" placeholder="Nom"
                    autofocus="true"></form:input>

        <form:input type="text" path="cotation" class="form-control form-control-sm mb-3"
                    placeholder="cotation"></form:input>

        <input type="submit" class="btn btn-success" value="Ajouter"/>
        <input type="reset" class="btn btn-danger" value="Reset"/>
        <a class="btn btn-danger" href="/voie/${longueur.voie.id}">Cancel</a>

    </form:form>
</div>
</body>
</html>
