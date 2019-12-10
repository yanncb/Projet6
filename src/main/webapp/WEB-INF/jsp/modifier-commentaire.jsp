<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Modifier commentaire</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>


<div class="container">

    <p>Modifier uncommentaire : </p>
    <p>Id : ${commentaire.id}</p>

    <h2>Modifier commentaire : </h2>

    <form:form method="POST" modelAttribute="commentaire" action="/modifier-commentaire">

        <form:input type="hidden" path="site.id"></form:input>

        <form:input type="hidden" path="id"></form:input>

        <form:input type="text" path="utilisateur.pseudo" class="form-control form-control-sm mb-3" placeholder="Pseudo" autofocus="true"></form:input>

        <form:input type="text" path="texte" class="form-control form-control-sm mb-3" placeholder="texte"></form:input>

        <input type="submit" class="btn btn-success" value="Ajouter"/>
        <input type="reset" class="btn btn-danger" value="Reset"/>
        <a class="btn btn-danger" href="/site/${site.id}">Cancel</a>

    </form:form>
</div>
</body>
</html>
