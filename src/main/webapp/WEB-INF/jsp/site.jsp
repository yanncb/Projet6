<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<html>
<head>
    <title>Site</title>
</head>
<body>
<jsp:include page="header.jsp"/>

<div class="jumbotron text-center" style="margin-bottom:0">
    <h1>Informations du site d'escalade "${site.nom}"</h1>
</div>

<div class="container" style="margin-top:30px">

    <div class="col-sm-8">

        <h2>Secteurs :</h2>
        <br/>

        <table class="table  table-bordered">

            <tr>
                <th>Nom du secteur</th>
                <th>Modification</th>
                <th>Suppresion</th>
            </tr>

            <c:forEach items="${site.secteurs}" var="secteur">
                <tr>
                    <th><a href="/secteur/${secteur.id}">${secteur.secteurNom}</a></th>
                    <th><a href="/modifier-secteur/${secteur.id}" class="btn btn-success">Modifier</a></th>
                    <th><a href="/supprimer-secteur/${secteur.id}/${site.id}" class="btn btn-danger">Supprimer</a>
                    </th>
                </tr>
            </c:forEach>
        </table>

        <div>
            <a href="/ajout-secteur?siteId=${site.id}" class="btn btn-secondary">Ajouter un secteur </a>
        </div>
        <br/>

        <table class="table  table-bordered">

            <tr>
                <th>Pseudo du membre</th>
                <th>Date</th>
                <th>Commentaire</th>
                <th>Modification</th>
                <th>Suppresion</th>
            </tr>

            <c:forEach items="${site.commentaires}" var="commentaire">
                <tr>
                    <td>${commentaire.utilisateur.nom}</td>
                    <td>${commentaire.date}</td>
                    <td>${commentaire.texte}</td>

                    <sec:authorize access="hasRole('ADMIN')">

                        <td><a href="/modifier-commentaire/${commentaire.id}" class="btn btn-success">Modifier</a></td>
                    </sec:authorize>

                        <%--                <sec:authorize access="hasAnyAuthority('ROLE_ADMIN')">--%>

                    <td><a href="/supprimer-commentaire/${commentaire.id}/${site.id}"
                           class="btn btn-danger">Supprimer</a>
                    </td>
                </tr>

                <%--                    </sec:authorize>--%>
            </c:forEach>

        </table>

        <div>
            <a href="/ajout-commentaire?siteId=${site.id}" class="btn btn-secondary">Ajouter un commentaire </a>
        </div>


    </div>
</div>
</body>
</html>
