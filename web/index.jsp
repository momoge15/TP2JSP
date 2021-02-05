<%--
    Document   : index
    Created on : 16 sept. 2009, 16:54:32
    Author     : michel buffa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<!-- Ne pas oublier cette ligne sinon tous les tags de la JSTL seront ignorés ! -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionnaire d'utilisateurs</title>
        <link href="boostrap.css" rel="stylesheet" />
    </head>
    <body class="">
        <h1>Gestionnaire d'utilisateurs</h1>


        <!-- Message qui s'affiche lorsque la page est appelé avec un paramètre http message -->
        <c:if test="${!empty param['message']}">
            <h2 class="h1">Reçu message : ${param.message}</h2>
        </c:if>


        <h2>Menu de gestion des utilisateurs</h2>
        <ul>
            <li><a href="ServletUsers?action=listerLesUtilisateurs">Afficher/raffraichir la liste de tous les utilisateurs</a></li>
            <p>
        </ul>
            <h2>Liste des fonctionnalités à implémenter dans la Servlet (note : après chaque action cette page sera
                rappelée par la servlet avec la liste des utilisateurs raffraichie et un message de confirmation</h2>
        <div class="">
                    <div><a href="ServletUsers?action=creerUtilisateursDeTest">1-Créer 4 utilisateurs de test</a></div>
        <div class="row col-xl-12">
            <div class="col-xl-7">
                <div class="row">
                    <div class="col-xl-3">
                <div class="btn btn-danger col-md-12">2-Créer un utilisateur</div>
            <form action="ServletUsers" method="get" style="border: dashed 2px black; margin: auto; margin-top: 10px">
                <div class="form-group">
                    <label>Nom </label> <input class="form-control" type="text" name="nom"/>
                </div>
                Prénom : <input class="form-control" type="text" name="prenom"/><br>
                Login : <input class="form-control" type="text" name="login"/><br>
                <!-- Astuce pour passer des paramètres à une servlet depuis un formulaire JSP !-->
                <input type="hidden" name="action" value="creerUnUtilisateur"/>
                <input class="btn btn-success col-12" type="submit" value="Créer l'utilisateur" name="submit"/>
            </form>
            </div>
            <div class="col-xl-3" style="margin-top: 20px">
                <div  class="btn btn-danger col-md-12">3-Afficher les détails d'un utilisateur</div>
            <form style="border: dashed 2px black; margin: auto; margin-top: 10px" action="ServletUsers" method="get" >
                 <div class="form-group">
                login : <input class="form-control" type="text" name="login"/><br>
                 </div>
                <input type="hidden" class="form-control btn-success" name="action" value="chercherParLogin"/>
                <input type="submit" class="form-control btn-success" value="Chercher" name="submit"/>
            </form>
                
            </div>
               

            <div class="col-xl-3" style="margin-top: 20px" >
                
                <div class="btn btn-danger col-md-12">4-Modifier les détails d'un utilisateur :</div>
            <form action="ServletUsers" method="get" style="border: dashed 2px black; margin: auto; margin-top: 10px">
                Login : <input class="form-control" type="text" name="login"/><br>
                Nom : <input class="form-control" type="text" name="nom"/><br>
                Prénom : <input class="form-control" type="text" name="prenom"/><br>
                <input type="hidden" class="form-control btn btn-success" name="action" value="updateUtilisateur"/>
                <input type="submit" class="form-control btn btn-success" value="Mettre à jour" name="submit"/>
            </form>
            
            </div>
            
            <div class="col-md-3">
                <div class="btn btn-danger col-md-12" >5-Supprimer utilisateur</div>
            <form action="ServletUsers" method="get" style="border: dashed 2px black; margin: auto; margin-top: 10px">
                login : <input class="form-control" type="text" name="login"/><br>
                <input class="form-control btn btn-success" type="hidden" name="action" value="supprimerParLogin"/>
                <input class="form-control btn btn-success" type="submit" value="Supprimer" name="submit"/>
            </form>

            </div>       
                    
                </div>
             
                

                 
            
                    
                </div>
            
      
                
            </div>
            
            
            
            
            <div class="col-md-3">
                
                 <c:if test="${param['action'] == 'listerLesUtilisateurs'}" >
                     <div>
                         <h2  class="h1 btn btn-danger col-md-12">Liste des utilisateurs</h2>
                         
                     </div> 

            <table class="table table-striped">
                <!-- La ligne de titre du tableau des comptes -->
                <tr>
                    <th><b>Login</b></th>
                    <th><b>Nom</b></th>
                    <th><b>Prénom</b></th>
                </tr>

                <!-- Ici on affiche les lignes, une par utilisateur -->
                <!-- cette variable montre comment on peut utiliser JSTL et EL pour calculer -->
                <c:set var="total" value="0"/>

                <c:forEach var="u" items="${requestScope['listeDesUsers']}">
                    <tr>
                        <td>${u.login}</td>
                        <td>${u.firstName}</td>
                        <td>${u.lastName}</td>
                        <!-- On compte le nombre de users -->
                        <c:set var="total" value="${total+1}"/>
                    </tr>
                </c:forEach>

                <!-- Affichage du solde total dans la dernière ligne du tableau -->
                <tr><td><b>TOTAL</b></td><td></td><td><b>${total}</b></td><td></td></tr>
            </table>

        </c:if>
                
            </div>
            
        </div>

        <!-- Fin du menu -->

        <!-- Zone qui affiche les utilisateurs si le paramètre action vaut listerComptes -->
       
    </body>
</html>
