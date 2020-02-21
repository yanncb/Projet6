<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="header.jsp"/>

<div class="container">

    <h1>Ajout Site</h1>
    <form:form method="POST" modelAttribute="site" action="/ajout-site">


        <form:input type="text" path="nom" class="form-control form-control-sm mb-3" placeholder="Nom"
                    autofocus="true"/>

        <form:input type="text" path="pays" class="form-control form-control-sm mb-3" placeholder="Pays"/>

        <form:input type="text" path="adresse" class="form-control form-control-sm mb-3"
                    placeholder="Adresse"/>

        <c:if test="${utilisateur.authorities.equals('ROLE_ADMIN')}">
            <form:input type="text" path="tag" class="form-control form-control-sm mb-3" placeholder="Tag"/>
        </c:if>

        <input type="submit" class="btn btn-success" value="Ajouter"/>
        <input type="reset" class="btn btn-danger" value="Reset"/>
        <a class="btn btn-danger" href="/sites">Cancel</a>


    </form:form>
</div>
<jsp:include page="footer.jsp"/>
