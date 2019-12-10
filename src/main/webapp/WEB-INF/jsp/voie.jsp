<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Voies</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="jumbotron text-center" style="margin-bottom:0">
    <h1>Longueurs presente sur les ${voie.nom_voie} du sites d'escalade : ${voie.secteur.site.nom}</h1>
</div>


<div class="container" style="margin-top:30px">
    <a class="button" href="/secteur/{}"  >Secteur </a><a class="button" href="/sites">Sites </a>


    <div class="col-sm-8">
        <br/>
        <h3>Descriptif des longueurs : </h3>
        <br/>

        <table class="table table-bordered" >
            <tr>
                <th>ID</th>
                <th>Nom de la longueur</th>
                <th>Cotation</th>
                <th>Modification</th>
                <th>Suppresion</th>
            </tr>
            <c:forEach items="${longueur}" var="longueur">
                <tr>
                    <th>${longueur.id}</th>
                    <th>${longueur.nom_longueur}</th>
                    <th>${longueur.cotation}</th>
                    <th><a href="/modifier-longueur/${longueur.id}" class="btn btn-success">Modifier</a></th>
                    <th><a href="/supprimer-longueur/${longueur.id}" class="btn btn-danger">Supprimer</a></th>
                </tr>
            </c:forEach>
        </table>
        <div>
            <a class="button" href="/ajout-longueur?voieId=${voie.id}" class="btn btn-secondary">Ajouter une longueur </a>
        </div>

    </div>
</div>

</body>
</html>
