package controllers.comics;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Comic;
import utils.DBUtil;

/**
 * Servlet implementation class ComicEditServlet
 */
@WebServlet("/comics/edit")
public class ComicEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComicEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
        EntityManager em = DBUtil.createEntityManager();

        Comic c=em.find(Comic.class, Integer.parseInt(request.getParameter("id")));

        em.close();

         request.setAttribute("comic", c);
         request.setAttribute("_token", request.getSession().getId());
         request.getSession().setAttribute("comic_id", c.getId());

         RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/comics/edit.jsp");
         rd.forward(request, response);
    }

}
