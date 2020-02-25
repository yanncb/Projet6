<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp"/>

<div class="container">

    <h1>Ajout Voie</h1>
    <form:form method="POST" modelAttribute="voie" action="/ajout-voie">

        <form:input type="hidden" path="id"/>

        <form:input type="hidden" path="secteur.id"/>

        <form:input type="text" path="nom_voie" class="form-control form-control-sm mb-3" placeholder="Numero voie"
                    autofocus="true"/>

        <%--        <form:input type="text" path="difficulte" class="form-control form-control-sm mb-3"--%>
        <%--                    placeholder="difficulte"></form:input>--%>

        <form:input type="text" path="altitude" class="form-control form-control-sm mb-3"
                    placeholder="altitude"/>

        <form:input type="text" path="type_roche" class="form-control form-control-sm mb-3"
                    placeholder="type de roche"/>

        <input type="submit" class="btn btn-success" value="Ajouter"/>
        <input type="reset" class="btn btn-danger" value="Reset"/>
        <a class="btn btn-danger" href="/secteur/${voie.secteur.id}">Cancel</a>


    </form:form>
</div>
<jsp:include page="footer.jsp"/>
