<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp"/>

<div class="container">

    <h1>Reserver Topo</h1>
    <form:form method="POST" modelAttribute="topo" action="/refuser-reservation">

        <form:input type="hidden" path="id"/>

        <p>Utilisateur id : ${topo.utilisateurPossedantTopo.utilisateurId}</p>
        <p>Nom du topo : ${topo.nom}</p>
        <p>Date de parution : ${topo.dateParution}</p>
        <p>Lieu du topo : ${topo.lieu}</p>
        <p>Description : ${topo.description}</p>
        <p>Est disponible ? : ${topo.dispo}</p>
        <p>Nom du membre voulant reserver le topo : ${topo.utilisateurReserveTopo.pseudo}</p>

        <input type="submit" class="btn btn-danger" value="Refuser la réservation"/>
        <a class="btn btn-danger" href="/liste-des-topos">Annuler</a>


    </form:form>

</div>
<jsp:include page="footer.jsp"/>
