<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Recherche</title>
</head>
<body>

<jsp:include page="header.jsp"/>

<div class="container" style="margin-top:5%">

    <form:form method="POST" modelAttribute="recherche" action="/recherche">

        <h2>Recherche de site de grimpe !!</h2><br/>

        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text" id="Pays">Pays</span>
            </div>
            <form:input path="pays" type="text" class="form-control" autofocus="true" aria-label="Default"
                        aria-describedby="inputGroup-sizing-default"/>
        </div>

        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text" id="cotation">Cotation</span>
            </div>
            <form:input path="cotation" type="text" class="form-control" aria-label="Default"
                        aria-describedby="inputGroup-sizing-default"/>
        </div>

        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text" id="nbSecteur">Nombre de secteurs</span>
            </div>
            <form:input path="nbSecteurs" type="text" class="form-control" aria-label="Default"
                        aria-describedby="inputGroup-sizing-default"/>
        </div>

        <button class="btn btn-primary btn-lg btn-block" type="submit">Search</button>
    </form:form>

    <table class="table  table-bordered">
        <tr>
            <th>Nom du site</th>
            <th>Pays</th>
            <th>Cotations</th>
            <th>Nombre de secteurs</th>
        </tr>

        <c:forEach items="${resultatSites}" var="site">
            <tr>
                <td><a href="/site/${site.id}">${site.nom}</a></td>
                <td>${site.pays}</td>
                <td><c:forEach items="${site.secteurs}" var="secteur">
                    <c:forEach items="${secteur.voieList}" var="voie">
                        <c:forEach items="${voie.longueurlist}" var="longueur">
                            ${longueur.cotation}<br/>
                        </c:forEach>
                    </c:forEach>
                </c:forEach></td>
                <td> ${site.nbSecteurs()}</td>
            </tr>
        </c:forEach>

    </table>
</div>
</body>
</html>
