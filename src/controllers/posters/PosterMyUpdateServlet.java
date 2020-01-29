package controllers.posters;

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

import models.Poster;
import models.validators.PosterValidator;
import utils.DBUtil;
import utils.EncryptUtil;
/**
 * Servlet implementation class PosterUpdateServlet
 */
@WebServlet("/posters/myUpdate")
public class PosterMyUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PosterMyUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = (String)request.getParameter("_token");
        if(_token!=null&& _token.equals(request.getSession().getId())){
            EntityManager em = DBUtil.createEntityManager();

            Poster login_poster =em.find(Poster.class, (Integer)(request.getSession().getAttribute("login_poster_id")));

            Boolean name_duplicate_check = true;
            if(login_poster.getName().equals(request.getParameter("name"))){
                name_duplicate_check=false;
            }else{
                login_poster.setName(request.getParameter("name"));
            }


            Boolean  password_check_flag = true;
            String password=request.getParameter("password");
            if(password==null||password.equals("")){
                password_check_flag=false;
            }else{
                login_poster.setPassword(
                        EncryptUtil.getPasswordEncrypt(
                                password,
                                (String)this.getServletContext().getAttribute("salt")
                                )
                        );

            }
            login_poster.setUpdated_at(new Timestamp(System.currentTimeMillis()));


            List<String> errors =PosterValidator.validate(login_poster, name_duplicate_check, password_check_flag);
            if(errors.size()>0){
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("login_poster", login_poster);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/posters/myEdit.jsp");
                rd.forward(request, response);
            }else{
                em.getTransaction().begin();
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "更新が完了しました。");
                request.getSession().setAttribute("login_poster", login_poster);

                request.getSession().removeAttribute("login_poster_id");
                response.sendRedirect(request.getContextPath() + "/reviews/myIndex");


            }
        }
    }

}
