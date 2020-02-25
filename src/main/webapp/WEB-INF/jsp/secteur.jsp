<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="header.jsp"/>

<div class="jumbotron text-center" style="margin-bottom:0">
    <h1>Secteur ${secteur.secteurNom} du site ${secteur.site.nom} </h1>
</div>

<div class="container" style="margin-top:30px">

    <div class="col-sm-8">

        <h2>Voies contenu dans le secteur : </h2>
        <br/>

        <table class="table  table-bordered">
            <tr>
                <th>numero voie</th>
                <th>nombre de longueur</th>
                <th>altitude</th>
                <th>type_roche</th>
                <th>Modification</th>
                <th>Suppression</th>
            </tr>

            <c:forEach items="${voies}" var="voie">
                <tr>
                <th><a href="/voie/${voie.id}">${voie.nom_voie}</a></th>
                <th><a>${voie.nbLongueur()}</a></th>
                <th><a>${voie.altitude}</a></th>
                <th><a>${voie.type_roche}</a></th>
                <sec:authorize access="hasRole('MEMBRE')">

                    <th><a href="/modifier-voie/${voie.id}/${secteur.id}" class="btn btn-success">Modifier</a></th>
                    <th><a href="/supprimer-voie/${voie.id}/${secteur.id}" class="btn btn-danger">Supprimer</a></th>
                    </tr>
                </sec:authorize>
            </c:forEach>

        </table>
        <div>
            <a href="/ajout-voie?secteurId=${secteur.id}">Ajouter une voie </a>
        </div>

    </div>
</div>
<jsp:include page="footer.jsp"/>
