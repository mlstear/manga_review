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
 * Servlet implementation class ReviewMyIndexServlet
 */
@WebServlet("/reviews/myIndex")
public class ReviewMyIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewMyIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        Poster login_poster = (Poster)request.getSession().getAttribute("login_poster");

        int page;
        try{
            page = Integer.parseInt(request.getParameter("page"));
        } catch(Exception e) {
            page = 1;
        }
        List<Review> reviews = em.createNamedQuery("getMyAllReviews", Review.class)
                                  .setParameter("poster", login_poster)
                                  .setFirstResult(15 * (page - 1))
                                  .setMaxResults(15)
                                  .getResultList();

        long reviews_count = (long)em.createNamedQuery("getMyReviewsCount", Long.class)
                                     .setParameter("poster", login_poster)
                                     .getSingleResult();

        em.close();

        request.setAttribute("reviews", reviews);
        request.setAttribute("reviews_count", reviews_count);
        request.setAttribute("page", page);


        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }


        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/reviews/myIndex.jsp");
        rd.forward(request, response);

    }

}
