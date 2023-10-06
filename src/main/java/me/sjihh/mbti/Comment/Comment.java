package me.sjihh.mbti.Comment;

import me.sjihh.mbti.Authen.User;

import java.util.Date;

public class Comment {
    private int cmtId;
    private String cmtContent;
    private int userId;
    private Date timestamp;

    private User user;

    public Comment(int cmtId, String cmtContent, int userId, Date timestamp) {
        this.cmtId = cmtId;
        this.cmtContent = cmtContent;
        this.userId = userId;
        this.timestamp = timestamp;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public User getUser() {
        return user;
    }

    public int getCmtId() {
        return cmtId;
    }

    public int getUserId() {
        return userId;
    }

    public String getCmtContent() {
        return cmtContent;
    }

    public Date getTimestamp() {
        return timestamp;
    }
}
