<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Liste de tous les topos disponible</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
    <div class="jumbotron text-center" >
        <h1>Liste de tous les topos disponible</h1>
    </div>


    <h2>Topos</h2>
    <div class="row" style="margin-bottom: 10px; border: black solid 2px">
        <div class="col">ID</div>
        <div class="col">Nom</div>
        <div class="col-2">Date de parution</div>
        <div class="col">Lieu</div>
        <div class="col">Disponibilité</div>
        <div class="col">Reservé par</div>
        <div class="col">Reservé</div>
        <div class="col">Modification</div>
        <div class="col">Suppresion</div>
        <div class="col">Reservation topo</div>
    </div>
    <c:forEach items="${topos}" var="topo">
        <div class="row" style="margin-bottom: 10px">
            <div class="col">${topo.id}</div>
            <div class="col">${topo.nom}</div>
            <div class="col-2">${topo.dateParution}</div>
            <div class="col">${topo.lieu}</div>
            <div class="col">${topo.dispo}</div>
            <div class="col">${topo.utilisateurReserveTopo.pseudo}</div>
            <div class="col">${topo.reservation}</div>
            <div class="col"><a href="modifier-topo/${topo.id}" class="btn btn-success">Modifier</a></div>
            <div class="col"><a href="supprimer-topo/${topo.id}" class="btn btn-danger">Supprimer</a></div>
            <div class="col"><a href="reserver-topo/${topo.id}" class="btn btn-secondary">Reserver Topo</a></div>
        </div>
    </c:forEach>
        <div>
            <a class="button" href="/ajout-topo" class="btn btn-secondary">Ajouter un topo </a>
        </div>


</div>
</body>
</html>

