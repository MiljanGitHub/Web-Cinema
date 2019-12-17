<%@page import="model.Movie"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%ArrayList<Movie> filteredMovies = (ArrayList<Movie>) request.getAttribute("filteredMovies"); %>
 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Movies</title>
</head>
<body>
	<h3>Available movies</h3>
	<table border="1">
		<tr>
			<th>Name</th>
			<th>Duration</th>
			<th>Production year</th>
			<th>Description</th>		
		</tr>
		
		<!-- filteri u formi koja je u tabeli -->
		<form action="MovieServlet" method="get">
			<tr>
				<td align="center">
					<input type="text" name="nameFilter" value="<% request.getAttribute("nameFilter"); %>">
				 	
    					 <fieldset>
        						<legend>Sorting order</legend>
        						
        						
        						<input type="radio" id="nameAsc" name="byName" value="asc">
    							<label for="nameAsc">Ascending</label>

    							<input type="radio" id="nameDsc" name="byName" value="dsc">
    							<label for="nameDsc">Descending</label>

        					
    					</fieldset> 
					
				
				</td>
				
				<td align="center">
					from:&nbsp;<input type="text" name="fromDurationFilter" value="<%= request.getAttribute("fromDurationFilter")%>"><br/>
					to:&nbsp;<input type="text" name="toDurationFilter" value="<%= request.getAttribute("toDurationFilter")%>">
					<fieldset>
        						<legend>Sorting order</legend>
        						
        						
        						<input type="radio" id="durationAsc" name="byDuration" value="asc">
    							<label for="durationAsc">Ascending</label>

    							<input type="radio" id="durationDsc" name="byDuration" value="dsc">
    							<label for="durationDsc">Descending</label>

        					
    				</fieldset> 
				
				
				</td>
				
				<td align="center">
					from:&nbsp;<input type="text" name="fromProductionFilter" value="<%= request.getAttribute("fromProductionFilter")%>"></br>
					to:&nbsp;<input type="text" name="toProductionFilter" value="<%= request.getAttribute("toProductionFilter")%>">
					
					<fieldset>
        						<legend>Sorting order</legend>
        						
        						
        						<input type="radio" id="productionYearAsc" name="byProductionYear" value="asc">
    							<label for="productionYearAsc">Ascending</label>

    							<input type="radio" id="productionYearDsc" name="byProductionYear" value="dsc">
    							<label for="productionYearDsc">Descending</label>

        					
    				</fieldset> 
				
				
				</td>
				
				<td align="center"><input type="text" name="descriptionFilter" value="<%= request.getAttribute("descriptionFilter")%>">
					<fieldset>
        						<legend>Sorting order</legend>
        						
        						
        						<input type="radio" id="descriptionAsc" name="byDescription" value="asc">
    							<label for="descriptionAsc">Ascending</label>

    							<input type="radio" id="descriptionDsc" name="byDescription" value="dsc">
    							<label for="descriptionDsc">Descending</label>

        					
    				</fieldset> 
				
				</td>
				
				
				<td align="center"><input type="submit" value="Filter"></td>
				
				<td align="center"><input type="submit" value="Sort"></td>
			</tr>
			
			
		</form>
		
		<%for (Movie m : filteredMovies){ %>
			
			<tr>
				<td><a href="#?id=<%= m.getId() %>"> <%= m.getName() %></a></td>
				<td><%=m.getDuration() %></td>
				<td><%=m.getProductionYear() %></td>
				<td><%=m.getDescription() %></td>
			</tr>
			
		
		<%} %>
	
	</table>
</body>
</html>