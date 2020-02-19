<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Reserver topo</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">

    <h1>Reserver Topo</h1>
    <form:form method="POST" modelAttribute="topo" action="/reserver-topo">

        <form:input type="hidden" path="id" ></form:input>

<%--        TODO !!! a faire marche--%>
        <form:input type="hidden" path="${topo.utilisateurPossedantTopo.utilisateurId}" ></form:input>


        <form:input type="texte" path="nom" class="form-control form-control-sm mb-3" placeholder="${topo.nom}"
                    autofocus="true"></form:input>

        <form:input type="texte" path="dateParution" class="form-control form-control-sm mb-3"
                    placeholder="${topo.dateParution}"></form:input>

        <form:input type="texte" path="lieu" class="form-control form-control-sm mb-3" placeholder="${topo.lieu}"></form:input>

        <form:input type="texte" path="description" class="form-control form-control-sm mb-3"
                    placeholder="${topo.description}"></form:input>

        <form:input type="boolean" path="dispo" class="form-control form-control-sm mb-3"
                    placeholder="${topo.dispo}"></form:input>

        <form:input type="texte" path="utilisateurReserveTopo" class="form-control form-control-sm mb-3" placeholder="${utilisateurEmprunteur.name}"></form:input>


        <input type="submit" class="btn btn-success" value="Modifier"/>
        <input type="reset" class="btn btn-danger" value="Reset"/>
        <a class="btn btn-danger" href="/liste-de-mes-topos">Cancel</a>


    </form:form>

</div>
</body>
</html>
