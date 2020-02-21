<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp"/>
<div class="container">

    <h1>Modification d'une voie</h1>

    <form:form method="POST" modelAttribute="voie" action="/modifier-voie">

        <form:input type="hidden" path="id"/>

        <form:input type="hidden" path="secteur.id"/>


        <form:input type="text" path="nom_voie" class="form-control form-control-sm mb-3" placeholder="Numero voie"
                    autofocus="true"/>

        <%--        <form:input type="text" path="difficulte" class="form-control form-control-sm mb-3" placeholder="difficulte"></form:input>--%>

        <form:input type="text" path="altitude" class="form-control form-control-sm mb-3"
                    placeholder="altitude"/>

        <form:input type="text" path="type_roche" class="form-control form-control-sm mb-3"
                    placeholder="type de roche"/>

        <input type="submit" class="btn btn-success" value="Modifier"/>
        <input type="reset" class="btn btn-danger" value="Reset"/>
        <a class="btn btn-danger" href="/secteur/${voie.secteur.id}">Cancel</a>


    </form:form>

</div>


<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<jsp:include page="footer.jsp"/>