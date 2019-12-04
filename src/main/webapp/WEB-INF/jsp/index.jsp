<%--<!DOCTYPE html>--%>

<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Hello ${name}!</title>--%>
<%--</head>--%>

<%--<body>--%>

<%--<h2>Hello ${name} ${voies}!</h2>--%>

<%--</body>--%>

<%--</html>--%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Voie List</title>
</head>
<body>
<h1>Voie List</h1>

<br/><br/>
<div>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Longueur</th>
            <th>Numero Voie</th>
            <th>Altitude</th>
            <th>Difficulte</th>
            <th>Type roche</th>
        </tr>
        <c:forEach  items="${voies}" var ="voie">
            <tr>
                <td>${voie.id}</td>
                <td>${voie.longueur}</td>
                <td>${voie.numero_voie}</td>
                <td>${voie.altitude}</td>
                <td>${voie.difficulte}</td>
                <td>${voie.type_roche}</td>

            </tr>
        </c:forEach>
    </table>
</div>
</body>

</html>