<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Liste de tous les topos disponible</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
    <div class="jumbotron text-center">
        <h1>Liste de tous les topos disponible</h1>
    </div>


    <h2>Topos</h2>
    <div class="row" style="margin-bottom: 10px; border: black solid 1px">
        <div class="col-1">ID</div>
        <div class="col-1">Nom</div>
        <div class="col-1">Date de parution</div>
        <div class="col-1">Lieu</div>
        <div class="col-1">Disponibilité</div>
        <div class="col-1">Reservé par</div>
        <div class="col-1">Reservé</div>
        <div class="col-1">Demande de reservation</div>
        <div class="col-1">Modification</div>
        <div class="col-2">Suppresion</div>
        <div class="col-1">Reservation topo</div>

    </div>
    <c:forEach items="${topos}" var="topo">
        <div class="row" style="margin-bottom: 10px">
            <div class="col-1">${topo.id}</div>
            <div class="col-1">${topo.nom}</div>
            <div class="col-1">${topo.dateParution}</div>
            <div class="col-1">${topo.lieu}</div>
            <div class="col-1">${topo.dispo}</div>
            <div class="col-1">${topo.utilisateurReserveTopo.pseudo}</div>
            <div class="col-1">${topo.reservation}</div>
            <div class="col-1">${topo.demandeReservation}</div>
            <div class="col-1"><a href="modifier-topo/${topo.id}" class="btn btn-success">Modifier</a></div>
            <div class="col-2"><a href="supprimer-topo/${topo.id}" class="btn btn-danger">Supprimer</a></div>
            <c:if test="${topo.dispo.equals(true)}">
            <div class="col-1"><a href="reserver-topo/${topo.id}" class="btn btn-secondary">Reserver Topo</a></div>
            </c:if>
            <c:if test="${topo.dispo.equals(false)}">
                <div class="col-1"><a href="reserver-topo/${topo.id}" class="btn btn-secondary disabled">Reserver Topo</a></div>
            </c:if>
        </div>
    </c:forEach>
    <div>
        <a href="/ajout-topo" class="btn btn-secondary">Ajouter un topo </a>
    </div>


</div>
</body>
</html>

