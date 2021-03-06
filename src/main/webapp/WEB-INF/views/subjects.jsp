<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="loggedUserName" value="${pageContext.request.userPrincipal.name}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Subjects</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${contextPath}/resources/css/common.css"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
          integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css"
          href="https://cdn.datatables.net/v/bs4/dt-1.10.18/af-2.3.3/b-1.5.6/b-colvis-1.5.6/b-flash-1.5.6/b-print-1.5.6/cr-1.5.0/r-2.2.2/rr-1.2.4/sc-2.0.0/sl-1.3.0/datatables.min.css"/>

</head>
<%@include file="_header_admin.jsp" %>
<body>
<div class="container col-md-12">
    <h1 class="text-center">All Subjects</h1>
    <div class="col-md-12">
        <table id="subjects" class="table table-striped table-bordered">
            <thead>
            <th class="text-center">Id</th>
            <th class="text-center">Title</th>
            <th class="text-center">Actions</th>

            </tr>
            </thead>
            <c:forEach items="${subjectList}" var="item">
                <tr>
                    <td class="text-center">${item.id}</td>
                    <td class="text-center">${item.title}</td>
                    <td class="text-center">
                        <form id="deleteForm/${item.id}" method="POST"
                              action="${contextPath}/subjects/delete/${item.id}">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                        <form id="editForm/${item.id}" method="POST"
                              action="${contextPath}/subjects/edit/${item.id}">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                        <a onclick="document.forms['editForm/${item.id}'].submit()" class="btn btn-warning">
                            <i class="far fa-edit"></i> Edit</a>
                        <a onclick="document.forms['deleteForm/${item.id}'].submit()" class="btn btn-danger">
                            <i class="far fa-trash-alt"></i> Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <div class="col-md-12 text-center">

        <form id="addForm" method="POST"
              action="${contextPath}/subjects/add">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <a onclick="document.forms['addForm'].submit()" class="btn btn-success">
            <i class="far fa-plus"></i> Add</a>

    </div>

</div>
<script type="text/javascript" charset="utf8"
        src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.2.min.js"></script>
<script type="text/javascript" charset="utf8"
        src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
<script type="text/javascript"
        src="https://cdn.datatables.net/v/bs4/dt-1.10.18/af-2.3.3/b-1.5.6/b-colvis-1.5.6/b-flash-1.5.6/b-print-1.5.6/cr-1.5.0/r-2.2.2/rr-1.2.4/sc-2.0.0/sl-1.3.0/datatables.min.js"></script>
<script src="${contextPath}/resources/js/subject.js"></script>

</body>
</html>