<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp"/>

<div class="container">

    <h1>Ajout TOPO</h1>
    <form:form method="POST" modelAttribute="topo" action="/ajout-topo">


        <form:input type="text" path="nom" class="form-control form-control-sm mb-3" placeholder="Nom"
                    autofocus="true"/>

        <form:input type="text" path="description" class="form-control form-control-sm mb-3"
                    placeholder="description"/>

        <form:input type="text" path="lieu" class="form-control form-control-sm mb-3"
                    placeholder="Adresse"/>

        <form:input type="date" path="dateParution" class="form-control form-control-sm mb-3"
                    placeholder="Date de parution"/>

        <form:select type="number" class="form-control" path="dispo">
            <option>true</option>
            <option>false</option>
        </form:select><br/>
        <%--            <option value="0">Non Disponible</option>--%>
        <%--            <option value="1">En attente de validation</option>--%>
        <%--            <option value="2">Disponible</option>--%>
        <%--            <option value="3">Non reservable</option>--%>


        <input type="submit" class="btn btn-success" value="Ajouter"/>
        <input type="reset" class="btn btn-danger" value="Reset"/>
        <a class="btn btn-danger" href="/sites">Cancel</a>


    </form:form>
</div>
<jsp:include page="footer.jsp"/>