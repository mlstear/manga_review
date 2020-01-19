package controllers.reviews;

import java.io.IOException;

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
 * Servlet implementation class ReviewEditServlet
 */
@WebServlet("/reviews/edit")
public class ReviewEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewEditServlet() {
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

        Poster login_poster =(Poster)request.getSession().getAttribute("login_poster");
        if(r!=null&&login_poster.getId()==r.getPoster().getId());{
            request.setAttribute("review", r);
            request.setAttribute("_token", request.getSession().getId());
            request.getSession().setAttribute("review_id", r.getId());
        }
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/reviews/edit.jsp");
        rd.forward(request, response);

    }

}
