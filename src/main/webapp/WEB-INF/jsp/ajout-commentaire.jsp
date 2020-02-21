<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp"/>

<div class="container">

    <h3>Informations Site</h3>

    <form:form method="POST" modelAttribute="commentaire" action="/ajout-commentaire">

        <p>Ajouter un commentaire sur le site : </p>

        <table class="table  table-bordered">

            <tr>Id : ${site.id}</tr>
            <br/>
            <tr>Nom : ${site.nom}</tr>
            <br/>

        </table>

        <h2>Ajout Commentaire</h2>

        ${utilisateur.name} <br/>

        <form:input name="commentaireId" type="hidden" path="id"/>

        <form:input name="siteId" type="hidden" path="siteId"/>

        <form:input type="text" path="texte" class="form-control form-control-sm mb-3"
                    placeholder="commentaire"/>


        <input type="submit" class="btn btn-success" value="Ajouter"/>
        <input type="reset" class="btn btn-danger" value="Reset"/>
        <a class="btn btn-danger" href="/site/${site.id}">Cancel</a>

    </form:form>
</div>
<jsp:include page="footer.jsp"/>