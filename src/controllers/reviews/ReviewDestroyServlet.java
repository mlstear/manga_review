package controllers.reviews;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Review;
import utils.DBUtil;

/**
 * Servlet implementation class ReviewDestroyServlet
 */
@WebServlet("/reviews/destroy")
public class ReviewDestroyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDestroyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = (String)request.getParameter("_token");
        if(_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();

            Review r = em.find(Review.class, (Integer)(request.getSession().getAttribute("review_id2")));

            em.getTransaction().begin();
            em.remove(r);
            em.getTransaction().commit();
            em.close();
            request.getSession().removeAttribute("review_id2");

            request.getSession().setAttribute("flush", "削除が完了しました。");


            response.sendRedirect(request.getContextPath() + "/index.html");



    }
    }
}

