<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp"/>

<div class="container">

    <p>Modifier un secteur pour le site :</p>
    <p>Id : ${secteur.site.id}</p>
    <p>Nom : ${secteur.site.nom}</p>
    <p>Adresse : ${secteur.site.adresse}</p>
    <p>Pays : ${secteur.site.pays}</p>

    <h1>Modification secteur</h1>

    <p>Nom du secteur : ${secteur.secteurNom}</p>
    <p>id du secteur : ${secteur.id}</p>
    <form:form method="POST" modelAttribute="secteur" action="/modifier-secteur">

        <form:input type="hidden" path="site.id"/>

        <form:input type="hidden" path="id"/>

        <form:input type="text" path="secteurNom" class="form-control form-control-sm mb-3" placeholder="Nom"
                    autofocus="true"/>

        <input type="submit" class="btn btn-success" value="Modifier"/>
        <input type="reset" class="btn btn-danger" value="Reset"/>
        <a class="btn btn-danger" href="/sites}">Cancel</a>


    </form:form>
</div>
<jsp:include page="footer.jsp"/>
