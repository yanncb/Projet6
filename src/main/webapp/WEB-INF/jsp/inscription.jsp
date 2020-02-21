<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp"/>

<div class="container">

    <h1>Inscription</h1>
    <form:form method="POST" modelAttribute="utilisateur" action="/inscription">


        <form:input type="text" path="nom" class="form-control form-control-sm mb-3" placeholder="Nom"
                    autofocus="true"/>

        <form:input type="text" path="prenom" class="form-control form-control-sm mb-3"
                    placeholder="Prenom"/>

        <form:input type="text" path="telephone" class="form-control form-control-sm mb-3"
                    placeholder="Numero de telephone"/>

        <form:input type="text" path="mail" class="form-control form-control-sm mb-3" placeholder="Mail"/>

        <form:input type="text" path="pseudo" class="form-control form-control-sm mb-3"
                    placeholder="Pseudo"/>

        <form:input type="text" path="motDePasse" class="form-control form-control-sm mb-3"
                    placeholder="Mot De Passe"/>


        <input type="submit" class="btn btn-success" value="Ajouter"/>
        <input type="reset" class="btn btn-danger" value="Reset"/>
        <a class="btn btn-danger" href="/">Cancel</a>


    </form:form>
</div>
<jsp:include page="footer.jsp"/>
