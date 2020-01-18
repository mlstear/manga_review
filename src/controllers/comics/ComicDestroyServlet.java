package controllers.comics;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Comic;
import utils.DBUtil;
/**
 * Servlet implementation class ComicDestroyServlet
 */
@WebServlet("/comics/destroy")
public class ComicDestroyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComicDestroyServlet() {
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

            Comic c=em.find(Comic.class, (Integer)(request.getSession().getAttribute("comic_id")));

            em.getTransaction().begin();
            em.remove(c);
            em.getTransaction().commit();
            em.close();

            request.getSession().removeAttribute("comic_id");
            request.getSession().setAttribute("flush", "削除が完了しました。");

            response.sendRedirect(request.getContextPath() + "/comics/index");
        }
    }

}
