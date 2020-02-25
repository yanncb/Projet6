<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp"/>

<div class="container">

    <h1>S'identifier</h1>
    <form:form method="POST" modelAttribute="utilisateur" action="/login">

        <form:input type="text" path="username" id="username" class="form-control form-control-sm mb-3"
                    placeholder="Pseudo"/>

        <form:input type="password" path="password" id="password" class="form-control form-control-sm mb-3"
                    placeholder="Mot De Passe"/>


        <input type="submit" class="btn btn-success" value="Valider"/>
        <input type="reset" class="btn btn-danger" value="Reset"/>
        <a class="btn btn-danger" href="/">Cancel</a>

    </form:form>
</div>
<jsp:include page="footer.jsp"/>
