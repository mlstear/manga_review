package models;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


@Table(name="posters")
@NamedQueries({
    @NamedQuery(
            name="getAllPosters",
            query="SELECT p FROM Poster AS p ORDER BY p.id DESC"
            ),
    @NamedQuery(
            name="getPostersCount",
            query="SELECT COUNT(p) FROM Poster AS p"
            ),
    @NamedQuery(
            name = "checkRegisteredName",
            query = "SELECT COUNT(p) FROM Poster AS p WHERE p.name = :name"
            ),
    @NamedQuery(
            name="checkLoginPasswordAndName",
            query="SELECT p FROM Poster AS p WHERE p.password=:pass AND p.name = :name"
            )
})
@Entity
public class Poster {
    @Id
    @Column(name="id")
    @GeneratedValue(strategy =GenerationType.IDENTITY)
    private Integer id;

    @Column(name="name",nullable=false,unique = true)
    private String name;

    @Column(name="password",length=64,nullable=false)
    private String password;

    @Column(name="created_at",nullable=false)
    private Timestamp created_at;

    @Column(name = "updated_at", nullable = false)
    private Timestamp updated_at;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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





}
