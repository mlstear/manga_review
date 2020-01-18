package controllers.comics;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Comic;
import models.validators.ComicValidator;
import utils.DBUtil;

/**
 * Servlet implementation class ComicUpdateServlet
 */
@WebServlet("/comics/update")
public class ComicUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComicUpdateServlet() {
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

            Boolean title_duplicate_check = true;
            if(c.getTitle().equals(request.getParameter("title"))){
                title_duplicate_check=false;
            }else{
                c.setTitle(request.getParameter("title"));
            }

            c.setAuthor(request.getParameter("author"));
            c.setUpdated_at(new Timestamp(System.currentTimeMillis()));

            List<String> errors=ComicValidator.validate(c, title_duplicate_check);
            if(errors.size()>0){
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("comic", c);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/comics/edit.jsp");
                rd.forward(request, response);
            }else{
                em.getTransaction().begin();
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "更新が完了しました。");

                request.getSession().removeAttribute("comic_id");

                response.sendRedirect(request.getContextPath() + "/comics/index");
                }
    }

}
}
