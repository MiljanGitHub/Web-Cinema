<%@page import="model.Role"%>
<%@page import="model.Movie"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%ArrayList<Movie> filteredMovies = (ArrayList<Movie>) request.getAttribute("filteredMovies"); %>
 <%User loggedInUser = (User) request.getSession().getAttribute("loggedInUser"); %>
 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Movies</title>
</head>
<body>
	<h3>Available movies</h3>
	
	<table border="1" style=width:100%>
		<tr>
			<th>Name</th>
			<th>Duration</th>
			<th>Production year</th>
			<th>Genres</th>
			<th>Distributor</th>
			<th>Country of origin</th>
					
		</tr>
		
		<!-- filteri u formi koja je u tabeli -->
		<form action="MovieServlet" method="get"> 
			<tr>
				<td align="center">
					<input type="text" name="nameFilter" value="<%= request.getAttribute("nameFilter") %>">
				 	
    					 <fieldset>
        						<legend>Sorting order</legend>
        						
        						
        						<input type="radio" id="nameAsc" name="byName" value="asc">
    							<label for="nameAsc">Ascending</label><br>

    							<input type="radio" id="nameDsc" name="byName" value="dsc">
    							<label for="nameDsc">Descending</label>

        					
    					</fieldset> 
					
				
				</td>
				
				<td align="center">
					from:&nbsp;<input type="text" name="fromDurationFilter" value="<%= request.getAttribute("fromDurationFilter")%>">
					to:&nbsp;<input type="text" name="toDurationFilter" value="<%= request.getAttribute("toDurationFilter")%>"><br/>
					<fieldset>
        						<legend>Sorting order</legend>
        						
        						
        						<input type="radio" id="durationAsc" name="byDuration" value="asc">
    							<label for="durationAsc">Ascending</label><br>

    							<input type="radio" id="durationDsc" name="byDuration" value="dsc">
    							<label for="durationDsc">Descending</label>

        					
    				</fieldset> 
				
				
				</td>
				
				<td align="center">
					from:&nbsp;<input type="text" name="fromProductionFilter" value="<%= request.getAttribute("fromProductionFilter")%>">
					to:&nbsp;<input type="text" name="toProductionFilter" value="<%= request.getAttribute("toProductionFilter")%>"></br>
					
					<fieldset>
        						<legend>Sorting order</legend>
        						
        						
        						<input type="radio" id="productionYearAsc" name="byProductionYear" value="asc">
    							<label for="productionYearAsc">Ascending</label><br>

    							<input type="radio" id="productionYearDsc" name="byProductionYear" value="dsc">
    							<label for="productionYearDsc">Descending</label>

        					
    				</fieldset> 
				
				
				</td>
				
				<td align="center"><input type="text" name="genresFilter" value="<%= request.getAttribute("genresFilter")%>">
						<fieldset>
        						<legend>Sorting order</legend>
        						
        						
        						<input type="radio" id="byGenresAsc" name="byGenres" value="asc">
    							<label for="byGenresAsc">Ascending</label><br>

    							<input type="radio" id="byGenresDsc" name="byGenres" value="dsc">
    							<label for="byGenresDsc">Descending</label>

        					
    				</fieldset> 
				
				</td>
				
				<td align="center"><input type="text" name="distributorFilter" value="<%= request.getAttribute("distributorFilter")%>">
						<fieldset>
        						<legend>Sorting order</legend>
        						
        						
        						<input type="radio" id="byDistributorAsc" name="byDistributor" value="asc">
    							<label for="byDistributorAsc">Ascending</label><br>

    							<input type="radio" id="byDistributorDsc" name="byDistributor" value="dsc">
    							<label for="byDistributorDsc">Descending</label>

        					
    				</fieldset> 
				
				</td>
				
				<td align="center"><input type="text" name="countryOfOriginFilter" value="<%= request.getAttribute("countryOfOriginFilter")%>">
						<fieldset>
        						<legend>Sorting order</legend>
        						
        						
        						<input type="radio" id="byCountryOfOriginFilterAsc" name="byCountryOfOrigin" value="asc">
    							<label for="byCountryOfOriginFilterAsc">Ascending</label><br>

    							<input type="radio" id="byDistributorDsc" name="byCountryOfOrigin" value="dsc">
    							<label for="byCountryOfOriginFilterDsc">Descending</label>

        					
    				</fieldset> 
				
				</td>
				

				<td align="center"><input type="submit" value="Filter"></td>
				
				<td align="center"><input type="submit" value="Sort"></td>
				
				
				
			</tr>
			
			
			
			
		</form>
		
		<%if (loggedInUser.getRole() == Role.ADMIN){ %>
		
			<%for (Movie m : filteredMovies){ %>
			
				<tr>
					<td><a href="SingleMovieServlet?id=<%= m.getId() %>"> <%= m.getName() %></a></td>
					<td><%=m.getDuration() %></td>
					<td><%=m.getProductionYear() %></td>
					<td><%=m.getGenresDisplay() %></td>
					<td><%=m.getDistributor() %></td>
					<td><%=m.getCountryOfOrigin() %></td>
					

					<td>
						<form action="EditMovieServlet" method="post">
  					
  							<button name="edit" type="submit" value="<%= m.getId()%>">Edit movie</button>
  							
						</form>
					</td>
					<td>
						<form action="DeleteMovieServlet" method="post">
  					
  							<button name="delete" type="submit" value="<%= m.getId()%>">Delete movie</button>
  							
						</form>
					</td> 
					
				</tr>
			
		
			<%} %>
		<%} else if (loggedInUser.getRole() == Role.USER){ %>
	
				<!-- KUPI KARTU ZA SVAKI FILm, BUTTON, AKO POSTOJE PROJEKCIJE  -->
				<%for (Movie m : filteredMovies){ %>
			
				<tr>
					<td><a href="SingleMovieServlet?id=<%= m.getId() %>"> <%= m.getName() %></a></td>
					<td><%=m.getDuration() %></td>
					<td><%=m.getProductionYear() %></td>
					<td><%=m.getGenresDisplay() %></td>
					<td><%=m.getDistributor() %></td>
					<td><%=m.getCountryOfOrigin() %></td>
					
					<%if (m.isAvailable()) { %>
						<td>
							<form action="ShowProjectionsServlet" method="get">
  						
  								<button name="movie" type="submit" value="<%= m.getId()%>">Buy ticket</button>
  							
							</form>
						</td>
						
					<%} %>
					
					
					<!-- ako postoji bar 1 dostupna projekcija za ovaj film, prikazi dugme za kupovinu karte  -->
					<!-- dostupna projekcija -> nije u proslosti; i u sali za tu projekciju, sva sedista nisu popunjena  -->
					<!-- ako padne bar jedan od ovda dva kriterijuma, karta za dati film se ne moze kupiti -->
				</tr>
			
		
			<%} %> 
		<%} else {%>
		
			<%for (Movie m : filteredMovies){ %>
			
				<tr>
					<td><a href="SingleMovieServlet?id=<%= m.getId() %>"> <%= m.getName() %></a></td>
					<td><%=m.getDuration() %></td>
					<td><%=m.getProductionYear() %></td>
					<td><%=m.getGenresDisplay() %></td>
					<td><%=m.getDistributor() %></td>
					<td><%=m.getCountryOfOrigin() %></td>
					
			<%} %> 
			
		<%} %>
	</table>
	
	
				<%if (loggedInUser.getRole() == Role.ADMIN){%>
					 
					 <form action="UsersManagementServlet" method="get">
					 	<input type=submit value="Users management" style=width:100%>
					 </form>
				<%} %>
				
				<%if (loggedInUser.getRole() != Role.UNSPECIFIED){%>
				<form action="MyProfileServlet" method="get">
					<input type=submit value="My profile" style=width:100%>
				</form>
				<%} %>
				
				<form action="LogoutServlet" method="get">
					 	<input type=submit value="Logout" style=width:100%>
			    </form>
</body>
</html>