package controllers.reviews;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Review;
import utils.DBUtil;
/**
 * Servlet implementation class ReviewShowServlet
 */
@WebServlet("/reviews/onlyShow")
public class ReviewOnlyShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewOnlyShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        Review r = em.find(Review.class, Integer.parseInt(request.getParameter("id")));

        em.close();

        request.setAttribute("review", r);
        request.setAttribute("_token", request.getSession().getId());
        request.getSession().setAttribute("comic_id", r.getComic());
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/reviews/onlyShow.jsp");
        rd.forward(request, response);

    }

}
