package me.sjihh.mbti.Questions;

import java.util.List;

public class QuestionPart {
    private String question;
    private List<QuestionChoice> choices;

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public List<QuestionChoice> getChoices() {
        return choices;
    }

    public void setChoices(List<QuestionChoice> choices) {
        this.choices = choices;
    }
}