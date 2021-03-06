package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ActorDAO;
import DAO.DirectorDAO;
import DAO.GenreDAO;
import model.Actor;
import model.Movie;
import model.User;


public class RemoveActorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		User loggedInUser = (User) request.getSession().getAttribute("loggedInUser");
		if (loggedInUser == null) response.sendRedirect("./Login.html");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		User loggedInUser = (User) request.getSession().getAttribute("loggedInUser");
		if (loggedInUser == null) response.sendRedirect("./Login.html");
		else {
		
		
		String actorString = request.getParameter("actor");
		try {
			
			int idActor = Integer.valueOf(actorString);			
			Actor actor = ActorDAO.getActorById(idActor);
			Movie movie = (Movie) request.getSession().getAttribute(String.valueOf(loggedInUser.getId()));
			movie.getActors().remove(actor);
			
			if (ActorDAO.removeActorFromMovie(movie.getId(), actor.getId())) {
				
				request.setAttribute("key", String.valueOf(loggedInUser.getId()));
				request.setAttribute("directors", DirectorDAO.getAllDirectors());
				request.setAttribute("actors", ActorDAO.getAllActors());
				request.setAttribute("genres", GenreDAO.getAllGenres());
			} 			

		} catch (Exception e) {
			e.printStackTrace();
		}
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.getRequestDispatcher("./EditMovie.jsp").forward(request, response);
		}
		
		
	}

}
