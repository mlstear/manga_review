package models.validators;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import models.Comic;
import utils.DBUtil;

public class ComicValidator {
    public static List<String> validate(Comic c,Boolean title_duplicate_check_flag){
        List<String> errors =new ArrayList<String>();

        String title_error=_validateTitle(c.getTitle(),title_duplicate_check_flag);
        if(!title_error.equals("")){
            errors.add(title_error);
        }


        String author_error=_validateAuthor(c.getAuthor());
        if(!author_error.equals("")){
            errors.add(author_error);
        }
        return errors;

}

    private static String _validateTitle(String title,Boolean title_duplicate_check_flag){
        if(title==null||title.equals("")){
            return "タイトルを入力してください。";
        }
        if(title_duplicate_check_flag){
            EntityManager em=DBUtil.createEntityManager();
            long posters_count=(long)em.createNamedQuery("checkRegisteredTitle",Long.class)
                                       .setParameter("title",title)
                                       .getSingleResult();
            em.close();
            if(posters_count>0){
                return "入力されたタイトルはすでに存在しています。";
            }
        }
        return "";
    }
    private static String _validateAuthor(String author){
        if(author==null||author.equals("")){
            return "作者名を入れてください。";
        }
        return "";
    }

    }
