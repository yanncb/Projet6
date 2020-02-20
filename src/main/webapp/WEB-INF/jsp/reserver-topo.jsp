<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Reserver topo</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">

    <h1>Reserver Topo</h1>
    <form:form method="POST" modelAttribute="topo" action="/reserver-topo">

        <form:input type="hidden" path="id" ></form:input>

        Utilisateur id : ${utilisateurPossedantTopo.utilisateurId}
        Nom du topo : ${topo.nom}
        Date de parution : ${topo.dateParution}
        Lieu du topo : ${topo.lieu}
        Description : ${topo.description}
        Est disponible ? : ${topo.dispo}

        <input type="submit" class="btn btn-success" value="Confirmer la réservation"/>
        <a class="btn btn-danger" href="/liste-de-mes-topos">Annuler la demande de réservation</a>


    </form:form>

</div>
</body>
</html>
