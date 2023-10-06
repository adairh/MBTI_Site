package me.sjihh.mbti.Questions;

import java.util.List;

public class QuestionChoice {
    private String question;
    private List<Option> options;

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public List<Option> getOptions() {
        return options;
    }

    public void setOptions(List<Option> options) {
        this.options = options;
    }
}