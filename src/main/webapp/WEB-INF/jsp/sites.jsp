<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp"/>

<div class="container" style="margin-top:30px">
    <div class="jumbotron text-center" style="margin-bottom:0">
        <h1>Informations sur les sites d'escalade</h1>
    </div>

    <div class="col-sm-8">
        <h2>Sites</h2>

        <table class="table table-bordered">
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Adresse</th>
                <th>Pays</th>
                <th>Nombre de secteur</th>
                <th>Tag</th>
                <th>Nombre de voie</th>
                <th>Modification</th>
                <th>Suppresion</th>
            </tr>

            <c:forEach items="${sites}" var="site">
                <tr>
                    <th>${site.id}</th>
                    <th><a class="button" href="/site/${site.id}">${site.nom}</a></th>
                    <th>${site.adresse}</th>
                    <th>${site.pays}</th>
                    <th>${site.nbSecteurs()}</th>
                    <th>${site.tag}</th>
                    <th>${site.nbVoies()}</th>
                    <th><a href="modifier-site/${site.id}" class="btn btn-success">Modifier</a></th>
                    <th><a href="supprimer-site/${site.id}" class="btn btn-danger">Supprimer</a></th>
                </tr>
            </c:forEach>
        </table>
        <div>
            <a class="button" href="ajout-site" class="btn btn-secondary">Ajouter un site </a>
        </div>

    </div>
</div>
<jsp:include page="footer.jsp"/>

