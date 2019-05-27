package com.sr03.project.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "form")
public class Form {
    @Id
    @GeneratedValue
    @Column(name = "form_id")
    private Long id;
    @NotNull
    private String title;
    @NotNull
    private Boolean isActive;
    @OneToMany(mappedBy = "form")
    public Set<FormQuestion> formQuestion  = new HashSet<FormQuestion>(0);
    @OneToMany(mappedBy = "form")
    public Set<Track> track  = new HashSet<>(0);
    @ManyToMany
    @JoinTable(name = "subject_form", joinColumns = @JoinColumn(name = "form_id"), inverseJoinColumns = @JoinColumn(name = "subject_id"))
    private Set<Subject> subjects;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Boolean getActive() {
        return isActive;
    }

    public void setActive(Boolean active) {
        isActive = active;
    }

    public Set<FormQuestion> getFormQuestion() {
        return formQuestion;
    }

    public void setFormQuestion(Set<FormQuestion> formQuestion) {
        this.formQuestion = formQuestion;
    }

    public Set<Track> getTrack() {
        return track;
    }

    public void setTrack(Set<Track> track) {
        this.track = track;
    }

    public Set<Subject> getSubjects() {
        return subjects;
    }

    public void setSubjects(Set<Subject> subjects) {
        this.subjects = subjects;
    }
}