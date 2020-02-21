<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8"  %>
<html>
<head>
    <title>Info Sur l'utilisateur souhaitant reserver votre topo</title>
</head>
<body>
<jsp:include page="header.jsp"/>

<div class="container">
    <div class="jumbotron text-center">
        <h1>Info Sur l'utilisateur souhaitant reserver votre topo</h1>
    </div>


    <h2>Utilisateur</h2>
    <p>Nom : ${utilisateur.nom}</p>
    <p>Pseudo: ${utilisateur.pseudo}</p>
    <p>Numero de téléphone de l'utilisateur : ${utilisateur.telephone}</p>
    <p>Mail: ${utilisateur.mail}</p>

    <a class="btn btn-danger" href="/liste-de-mes-topos">Retour à ma liste de topos</a>


</div>
</body>
</html>

