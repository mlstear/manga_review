package models;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "reviews")
@NamedQueries({
    @NamedQuery(
            name = "getAllReviews",
            query = "SELECT r FROM Review AS r ORDER BY r.id DESC"
            ),
    @NamedQuery(
            name = "getReviewsCount",
            query = "SELECT COUNT(r) FROM Review AS r"
            ),
    @NamedQuery(
            name = "getUserAllReviews",
            query = "SELECT r FROM Review AS r WHERE r.poster = :poster ORDER BY r.id DESC"

            ),
    @NamedQuery(
            name = "getUserReviewsCount",
            query = "SELECT COUNT(r) FROM Review AS r WHERE r.poster = :poster"
            ),
    @NamedQuery(
            name = "getOnlyAllReviews",
            query = "SELECT r FROM Review AS r WHERE r.comic = :comic ORDER BY r.id DESC"
            ),
    @NamedQuery(
            name = "getOnlyReviewsCount",
            query = "SELECT COUNT(r) FROM Review AS r WHERE r.comic = :comic"
            ),
    @NamedQuery(
            name = "getMyAllReviews",
            query = "SELECT r FROM Review AS r WHERE r.poster = :poster ORDER BY r.id DESC"
            ),
    @NamedQuery(
            name = "getMyReviewsCount",
            query = "SELECT COUNT(r) FROM Review AS r WHERE r.poster = :poster"
            ),
})

@Entity
public class Review {
    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name="comic_id",nullable=false)
    private Comic comic;

    @ManyToOne
    @JoinColumn(name="poster_id",nullable=false)
    private Poster poster;

    @Column(name = "title", length = 255, nullable = false)
    private String title;

    @Lob
    @Column(name = "content", nullable = false)
    private String content;

    @Column(name = "created_at", nullable = false)
    private Timestamp created_at;

    @Column(name = "updated_at", nullable = false)
    private Timestamp updated_at;

    @Column(name="score",nullable=false)
    private Integer score;



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Comic getComic() {
        return comic;
    }

    public void setComic(Comic comic) {
        this.comic = comic;
    }

    public Poster getPoster() {
        return poster;
    }

    public void setPoster(Poster poster) {
        this.poster = poster;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }
    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }



}
