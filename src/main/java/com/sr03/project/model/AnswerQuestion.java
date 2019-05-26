package com.sr03.project.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "answer_question")
public class AnswerQuestion {
    @Id
    @GeneratedValue
    @Column(name = "answer_question_id")
    private Integer id;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="answer_id")
    private Answer answer;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="question_id")
    private Question question;
    @NotNull
    private Integer position;
    @NotNull
    private Boolean isValid;

    public AnswerQuestion(Integer position, Boolean isValid) {
        this.position = position;
        this.isValid = isValid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPosition() {
        return position;
    }

    public void setPosition(Integer position) {
        this.position = position;
    }

    public Boolean getValid() {
        return isValid;
    }

    public void setValid(Boolean valid) {
        isValid = valid;
    }
}
