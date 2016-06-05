<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="false"%>
<html>
<head>
<title>Show Files</title>
</head>
<body>
	<h1>Show Files</h1>

	<span style="color: red;"> 
		<spring:hasBindErrors name="fileUploadForm">
			<c:forEach var="err" items="${errors.allErrors}">
				<c:out value="${err.field}" /> :
				<c:out value="${err.defaultMessage}" />
				<br />
			</c:forEach>
		</spring:hasBindErrors>
	</span>
	
	<br />
	<br />
	<h3>Add a new file</h3>

	<form:form method="POST" modelAttribute="fileUploadForm" action="uploadFile" id="idFileUploadForm">
		<table>
			<tr>
				<td><form:label path="description">Description:</form:label></td>
				<td><form:input path="description" /></td>
			</tr>
			<tr>
				<td><form:label path="price">Name:</form:label></td>
				<td><form:input path="price" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Save File" /></td>
			</tr>
			<tr>
				<td>${msgUpload}</td>
			</tr>
		</table>

	</form:form>

	<table>
		<tr>
			<th>Description</th>
			<th>Name</th>
			<th>Date Upload</th>
		</tr>
		<c:forEach var="file" items="${listFiles}">
			<tr>
				<td><c:out value="${file.description}" /></td>
				<td><c:out value="${file.name}" /></td>
				<td>
					<fmt:formatDate value="${file.dateUpload}" pattern="dd/MM/yyyy" />
				</td>
				<td>
<!-- 					<a class="deleteId" -->
<%-- 					href="deleteProduct?productId=${product.id}">Delete</a> <a --%>
<%-- 					href="updateProduct?productId=${product.id}">Update</a></td> --%>
			</tr>
		</c:forEach>
	</table>

<!-- 	<br /> Envoi d'un nouveau fichier -->
<!-- 	<form:form method="POST" action="uploadFile" enctype="multipart/form-data"> -->
<!-- 		<input type="file" name="file" /> -->
<!-- 		<input type="submit" value="Upload file" /> -->
<!-- 	</form:form> -->
</html>
