package com.example.backofficefilrouge.entity;

import jakarta.persistence.*;

import java.util.Collection;

@Entity
@Table(name = "categories", schema = "bdd_fil_rouge")
public class CategoriesEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "category_id")
    private int categoryId;
    @Basic
    @Column(name = "category_name")
    private String categoryName;
    @OneToMany(mappedBy = "categoriesByCategoryId")
    private Collection<EventsEntity> eventsByCategoryId;

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CategoriesEntity that = (CategoriesEntity) o;

        if (categoryId != that.categoryId) return false;
        if (categoryName != null ? !categoryName.equals(that.categoryName) : that.categoryName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = categoryId;
        result = 31 * result + (categoryName != null ? categoryName.hashCode() : 0);
        return result;
    }

    public Collection<EventsEntity> getEventsByCategoryId() {
        return eventsByCategoryId;
    }

    public void setEventsByCategoryId(Collection<EventsEntity> eventsByCategoryId) {
        this.eventsByCategoryId = eventsByCategoryId;
    }
}
