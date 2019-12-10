<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>S'identifier</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">

    <h1>S'identifier</h1>
    <form:form method="POST" modelAttribute="utilisateur" action="/login">

        <form:input type="text"  path="username"  id="username" class="form-control form-control-sm mb-3" placeholder="Pseudo"></form:input>

        <form:input type="password" path="password" id="password" class="form-control form-control-sm mb-3" placeholder="Mot De Passe"></form:input>


        <input type="submit" class="btn btn-success" value="Valider"/>
        <input type="reset" class="btn btn-danger" value="Reset"/>
        <a class="btn btn-danger" href="/index">Cancel</a>

    </form:form>
</div>
</body>
</html>
