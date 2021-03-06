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

    <title>New Form</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${contextPath}/resources/css/common.css"/>


</head>
<%@include file="_header_admin.jsp" %>
<body>
<div class="container col-md-12">

    <h1 class="text-center">Add a new form</h1>
    <form:form method="POST" modelAttribute="formAttribute" class="form-signin">
        <div class="form-group ${status.error ? 'has-error' : ''}">
            <form:input type="text" path="title" class="form-control" placeholder="Title" autofocus="true"></form:input>
            <form:errors path="title"></form:errors>
        </div>

        <div class="form-group ${status.error ? 'has-error' : ''}">
            <form:select path="subjects" multiple="true" class="form-control">
                <form:options items="${subjectList}" itemValue="id" itemLabel="title"/>
            </form:select>
        </div>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
    </form:form>
</div>
</body>
</html>