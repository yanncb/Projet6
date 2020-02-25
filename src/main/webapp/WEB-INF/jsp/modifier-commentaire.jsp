<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp"/>


<div class="container">

    <p>Id : ${commentaire.id}</p>

    <h2>Modifier commentaire : </h2>

    <form:form method="POST" modelAttribute="commentaire" action="/modifier-commentaire">

        <form:input type="hidden" path="site.id"/>

        <form:input type="hidden" path="id"/>

        <form:input type="text" path="utilisateur.pseudo" class="form-control form-control-sm mb-3" placeholder="Pseudo"
                    autofocus="true"/>

        <form:input type="text" path="texte" class="form-control form-control-sm mb-3" placeholder="texte"/>

        <input type="submit" class="btn btn-success" value="Ajouter"/>
        <input type="reset" class="btn btn-danger" value="Reset"/>
        <a class="btn btn-danger" href="/site/${site.id}">Cancel</a>

    </form:form>
</div>
<jsp:include page="footer.jsp"/>
