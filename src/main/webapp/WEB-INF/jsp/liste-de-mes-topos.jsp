<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Liste des mes topos</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="container" style="margin-top:30px">
    <div class="jumbotron text-center" style="margin-bottom:0">
        <h1>Informations sur mes topos</h1>
    </div>

    <div class="col-sm-8">
        <h2>Topos</h2>

        <table class="table table-bordered">
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Date de parution</th>
                <th>Lieu</th>
                <th>Disponibilité</th>
                <th>Reservé par </th>
                <th>Demande de reservation  </th>
                <th>Modification</th>
                <th>Suppresion</th>
            </tr>

            <c:forEach items="${topos}" var="topo">
                <tr>
                    <th>${topo.id}</th>
                    <th>${topo.nom}</th>
                    <th>${topo.dateParution}</th>
                    <th>${topo.lieu}</th>
                    <th>${topo.dispo}</th>
                    <th>${topo.utilisateurReserveTopo.pseudo}</th>
                    <th>${topo.demandeReservation}</th>
                    <th><a href="modifier-topo/${topo.id}" class="btn btn-success">Modifier</a></th>
                    <th><a href="supprimer-topo/${topo.id}" class="btn btn-danger">Supprimer</a></th>
                </tr>
            </c:forEach>
        </table>
        <div>
            <a class="button" href="/ajout-topo" class="btn btn-secondary">Ajouter un topo </a>
        </div>


    </div>
</div>
</body>
</html>

