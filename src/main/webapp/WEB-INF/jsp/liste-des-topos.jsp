<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="header.jsp"/>

<div class="container">
    <div class="jumbotron text-center">
        <h1>Liste de tous les topos disponible</h1>
    </div>


    <h2>Topos</h2>
    <div class="row" style="margin-bottom: 10px; border: black solid 1px">
        <div class="col-sm">ID</div>
        <div class="col-sm">Nom</div>
        <div class="col-sm">Date de parution</div>
        <div class="col-sm">Lieu</div>
        <div class="col-sm">Disponibilité</div>
        <div class="col-sm">Reservé par</div>
        <div class="col-sm">Reservé</div>
        <div class="col-sm">Demande de reservation</div>
        <div class="col-sm">Modification</div>
        <div class="col-sm">Suppression</div>
        <div class="col-sm">Reservation topo</div>

    </div>
    <c:forEach items="${topos}" var="topo">
        <div class="row" style="margin-bottom: 10px">
            <div class="col-sm">${topo.id}</div>
            <div class="col-sm">${topo.nom}</div>
            <div class="col-sm">${topo.dateParution}</div>
            <div class="col-sm">${topo.lieu}</div>
            <div class="col-sm">${topo.dispo}</div>
            <div class="col-sm">${topo.utilisateurReserveTopo.pseudo}</div>
            <div class="col-sm">${topo.reservation}</div>
            <div class="col-sm">${topo.demandeReservation}</div>
            <sec:authorize access="hasRole('MEMBRE')">
            <div class="col-sm"><a href="modifier-topo/${topo.id}" class="btn btn-success">Modifier</a></div>
            <div class="col-sm"><a href="supprimer-topo/${topo.id}" class="btn btn-danger">Supprimer</a></div>
            </sec:authorize>
            <c:if test="${topo.dispo.equals(true)}">
                <div class="col-sm"><a href="reserver-topo/${topo.id}" class="btn btn-secondary">Reserver Topo</a></div>
            </c:if>
            <c:if test="${topo.dispo.equals(false)}">
                <div class="col-sm"><a href="reserver-topo/${topo.id}" class="btn btn-secondary disabled">Reserver
                    Topo</a></div>
            </c:if>
        </div>
    </c:forEach>
    <div>
        <a href="/ajout-topo" class="btn btn-secondary">Ajouter un topo </a>
    </div>


</div>
<jsp:include page="footer.jsp"/>

