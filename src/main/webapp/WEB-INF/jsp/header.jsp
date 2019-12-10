<html lang="fr">
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <title>Les amis de l'escalade !! </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

</head>
<body>
<div class="jumbotron text-center" style="margin-bottom:0">
    <h1>Les amis de l'escalade</h1>
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="container">

        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/">Acceuil</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/sites">Sites</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/recherche">Recherche</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/liste-des-topos">Topos</a>
                </li>
            </ul>

            <sec:authorize var="loggedIn" access="isAuthenticated()" >

                    <div>
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link text-primary" href="/liste-de-mes-topos">Liste de mes topos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-primary" href="/logout">Se deconnecter</a>
                            </li>
                        </ul>
                    </div>
                </sec:authorize>


                <sec:authorize access="isAnonymous()">
                <div>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link text-primary" href="/login">S'identifier</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-primary" href="/inscription">S'inscrire</a>
                        </li>
                    </ul>
                </div>
                </sec:authorize>
        </div>
    </div>

    </div>
</nav>
