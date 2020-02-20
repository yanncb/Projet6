<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Acceptation reservation topo</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">

    <h1>Reserver Topo</h1>
    <form:form method="POST" modelAttribute="topo" action="/accepter-reservation">

        <form:input type="hidden" path="id" ></form:input>

    <p>Utilisateur id : ${utilisateurPossedantTopo.utilisateurId}</p>
    <p>Nom du topo : ${topo.nom}</p>
    <p>Date de parution : ${topo.dateParution}</p>
    <p>Lieu du topo : ${topo.lieu}</p>
    <p>Description : ${topo.description}</p>
    <p>Est disponible ? : ${topo.dispo}</p>
        <p>Nom du membre voulant reserver le topo :  ${topo.utilisateurReserveTopo.pseudo}</p>

        <input type="submit" class="btn btn-success" value="Confirmer la réservation"/>
        <a class="btn btn-danger" href="/liste-des-topos">Annuler la demande de réservation</a>


    </form:form>

</div>
</body>
</html>
