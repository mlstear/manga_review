package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.Comic;

public class ComicValidator {
    public static List<String> validate(Comic c){
        List<String> errors =new ArrayList<String>();

        String title_error=_validateTitle(c.getTitle());
        if(!title_error.equals("")){
            errors.add(title_error);
        }

        String author_error=_validateAuthor(c.getAuthor());
        if(!author_error.equals("")){
            errors.add(author_error);
        }
        return errors;

}

    private static String _validateTitle(String title){
        if(title==null||title.equals("")){
            return "タイトルを入力してください。";
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
