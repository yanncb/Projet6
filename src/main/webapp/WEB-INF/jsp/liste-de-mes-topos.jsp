<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp"/>

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
                    <th>Reservé par</th>
                    <th>Demande de reservation</th>
                    <th>Modification</th>
                    <th>Suppression</th>
                </tr>

                <c:forEach items="${topos}" var="topo">
                    <tr>
                        <th>${topo.id}</th>
                        <th>${topo.nom}</th>
                        <th>${topo.dateParution}</th>
                        <th>${topo.lieu}</th>
                        <th>${topo.dispo}</th>
                        <th>
                            <a href="/infosUtilisateurReservantTopo/${topo.utilisateurReserveTopo.pseudo}"> ${topo.utilisateurReserveTopo.pseudo}
                        </th>
                        <th>${topo.demandeReservation}</th>
                        <th><a href="modifier-topo/${topo.id}" class="btn btn-success">Modifier</a></th>
                        <th><a href="supprimer-topo/${topo.id}" class="btn btn-danger">Supprimer</a></th>

                        <c:if test="${topo.demandeReservation.equals('En cours')}">
                            <th><a href="accepter-reservation/${topo.id}" class="btn btn-success">Accepter reservation</a>
                            </th>
                            <th><a href="refuser-reservation/${topo.id}" class="btn btn-danger">Refuser reservation</a></th>
                        </c:if>
                    </tr>
                </c:forEach>
            </table>
            <div>
            <a href="/ajout-topo" class="btn btn-secondary">Ajouter un topo </a>
        </div>
    </div>

    </div>
</div>
<jsp:include page="footer.jsp"/>

