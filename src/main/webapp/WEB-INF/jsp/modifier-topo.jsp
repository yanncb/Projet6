<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Modifier topo</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">

    <h1>Modifier Site</h1>
    <form:form method="POST" modelAttribute="topo" action="/modifier-topo">

        <form:input type="hidden" path="id" autofocus="true"></form:input>

        <form:input type="text" path="nom" class="form-control form-control-sm mb-3" placeholder="Nom du topo"
                    autofocus="true"></form:input>

        <form:input type="Date" path="dateParution" class="form-control form-control-sm mb-3" placeholder="Date de parution"></form:input>

        <form:input type="text" path="lieu" class="form-control form-control-sm mb-3" placeholder="lieu"></form:input>

        <form:input type="text" path="description" class="form-control form-control-sm mb-3" placeholder="Description"></form:input>

<%--        <form:input type="boolean" path="dispo" class="form-control form-control-sm mb-3" placeholder="Est disponible pour être prêté ?"></form:input>--%>
        <form:select type="boolean" class="form-control" path="dispo">
            <option>true</option>
            <option>false</option>
        </form:select><br/>

        <input type="submit" class="btn btn-success" value="Modifier"/>
        <input type="reset" class="btn btn-danger" value="Reset"/>
        <a class="btn btn-danger" href="/liste-de-mes-topos">Cancel</a>


    </form:form>

</div>
</body>
</html>
