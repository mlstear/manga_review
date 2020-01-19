package controllers.reviews;


import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Comic;
import models.Review;
import utils.DBUtil;


/**
 * Servlet implementation class ReviewNewServlet
 */
@WebServlet("/reviews/new")
public class ReviewNewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        request.setAttribute("_token", request.getSession().getId());

        Review r = new Review();
        Comic c = em.find(Comic.class, Integer.parseInt(request.getParameter("id")));
        request.setAttribute("review", r);
        request.getSession().setAttribute("comic", c);


        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/reviews/new.jsp");
        rd.forward(request, response);
    }

}
