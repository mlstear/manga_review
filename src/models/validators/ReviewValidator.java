package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.Review;

public class ReviewValidator {
    public static List<String> validate(Review r){
        List<String> errors =new ArrayList<String>();

        String title_error=_validateTitle(r.getTitle());
        if(!title_error.equals("")){
            errors.add(title_error);
        }

        String content_error=_validateContent(r.getContent());
        if(!content_error.equals("")){
            errors.add(content_error);
        }

        String score_error=_validateScore(r.getScore());
        if(!score_error.equals("")){
            errors.add(score_error);
        }
        return errors;
    }
    private static String _validateTitle(String title) {
        if(title == null || title.equals("")) {
            return "タイトルを入力してください。";
            }

        return "";
    }

    private static String _validateContent(String content) {
        if(content == null || content.equals("")) {
            return "内容を入力してください。";
            }

        return "";
    }
    private static String _validateScore(Integer score) {
        if(score==0) {
            return "スコアを入力してください。";
            }
        if(score>5||score<1){
            return "スコアは1〜５点を入力してください。";
        }

        return "";

}
}
