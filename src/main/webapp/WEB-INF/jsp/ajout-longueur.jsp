<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp"/>

<div class="container">

    <p>Informations Voie</p>

    <form:form method="POST" modelAttribute="longueur" action="/ajout-longueur">

        <p>Ajouter une longueur pour la voie : </p>
        <p>Id : ${longueur.voie.id}</p>
        <p>Nom : ${longueur.voie.nom_voie}</p>
        <p>Altitude : ${longueur.voie.altitude}</p>
        <p>Type de roche : ${longueur.voie.type_roche}</p>

        <h2>Ajout Longueur</h2>

        <form:input type="hidden" path="voie.id"/>

        <form:input type="text" path="nom_longueur" class="form-control form-control-sm mb-3" placeholder="Nom"
                    autofocus="true"/>

        <form:input type="text" path="cotation" class="form-control form-control-sm mb-3"
                    placeholder="cotation"/>


        <input type="submit" class="btn btn-success" value="Ajouter"/>
        <input type="reset" class="btn btn-danger" value="Reset"/>
        <a class="btn btn-danger" href="/voie/${longueur.voie.id}">Cancel</a>


    </form:form>
</div>
<jsp:include page="footer.jsp"/>