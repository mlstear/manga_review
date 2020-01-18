package controllers.comics;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class ComicIndexServlet
 */
@WebServlet("/comics/index")
public class ComicIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComicIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        int page;
        try{
            page = Integer.parseInt(request.getParameter("page"));
        } catch(Exception e) {
            page = 1;
        }
        List<Comic> comics = em.createNamedQuery("getAllComics", Comic.class)
                                  .setFirstResult(15 * (page - 1))
                                  .setMaxResults(15)
                                  .getResultList();

        long comics_count = (long)em.createNamedQuery("getComicsCount", Long.class)
                                     .getSingleResult();

        em.close();

        request.setAttribute("comics", comics);
        request.setAttribute("comics_count", comics_count);
        request.setAttribute("page", page);
        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/comics/index.jsp");
        rd.forward(request, response);
    }

}
