package controllers.reviews;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Poster;
import models.Review;
import utils.DBUtil;

/**
 * Servlet implementation class ReviewUserIndexServlet
 */
@WebServlet("/reviews/userIndex")
public class ReviewUserIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUserIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        Poster p = em.find(Poster.class, Integer.parseInt(request.getParameter("id")));

        int page;
        try{
            page = Integer.parseInt(request.getParameter("page"));
        } catch(Exception r) {
            page = 1;
        }
        List<Review> reviews = em.createNamedQuery("getUserAllReviews", Review.class)
                                 .setParameter("poster", p)
                                 .setFirstResult(15 * (page - 1))
                                 .setMaxResults(15)
                                 .getResultList();

        long reviews_count = (long)em.createNamedQuery("getUserReviewsCount", Long.class)
                                     .setParameter("poster", p)
                                     .getSingleResult();

        em.close();
        request.getSession().setAttribute("posterName", p.getName());
        request.setAttribute("reviews", reviews);
        request.setAttribute("reviews_count", reviews_count);
        request.setAttribute("page", page);
        request.getSession().removeAttribute("poster_id");


        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/reviews/userIndex.jsp");
        rd.forward(request, response);
    }

}
