<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Ajout site</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">

    <h1>Ajout Site</h1>
    <form:form method="POST" modelAttribute="site" action="/ajout-site">



        <form:input type="text" path="nom" class="form-control form-control-sm mb-3" placeholder="Nom" autofocus="true"></form:input>

        <form:input type="text" path="pays" class="form-control form-control-sm mb-3" placeholder="Pays"></form:input>

        <form:input type="text" path="adresse" class="form-control form-control-sm mb-3" placeholder="Adresse"></form:input>

        <form:input type="text" path="tag" class="form-control form-control-sm mb-3" placeholder="Tag"></form:input>


        <input type="submit" class="btn btn-success" value="Ajouter"/>
        <input type="reset" class="btn btn-danger" value="Reset"/>
        <a class="btn btn-danger" href="/sites">Cancel</a>


    </form:form>
</div>
</body>
</html>
