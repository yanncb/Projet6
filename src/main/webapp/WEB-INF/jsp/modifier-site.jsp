<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="header.jsp"/>

<div class="container">

    <h1>Modifier Site</h1>
    <form:form method="POST" modelAttribute="site" action="/modifier-site">

        <form:input type="hidden" path="id" autofocus="true"/>


        <form:input type="text" path="nom" class="form-control form-control-sm mb-3" placeholder="Nom du site"
                    autofocus="true"/>

        <form:input type="text" path="pays" class="form-control form-control-sm mb-3" placeholder="pays"/>

        <form:input type="text" path="adresse" class="form-control form-control-sm mb-3"
                    placeholder="adresse"/>


        <sec:authorize access="hasRole('admin')">
            <form:input type="text" path="tag" class="form-control form-control-sm mb-3" placeholder="tag"/>
        </sec:authorize>

        <input type="submit" class="btn btn-success" value="Modifier"/>
        <input type="reset" class="btn btn-danger" value="Reset"/>
        <a class="btn btn-danger" href="/sites">Cancel</a>


    </form:form>

</div>
<jsp:include page="footer.jsp"/>
