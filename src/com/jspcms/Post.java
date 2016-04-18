package com.jspcms;

/**
 * Created by joya on 15/5/5.
 */
public class Post {
    private int pid;
    private int uid;
    private int sid;
    private String title;
    private String content;
    private String post_time;
    private boolean is_have_comment;

    public int getPid() {
        return pid;
    }
    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getUid() {
        return uid;
    }
    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getSid() {
        return sid;
    }
    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }

    public void setContent(String content) {
        this.content = content;
    }
    public String getContent() {
        return content;
    }

    public String getPost_time() {
        return post_time;
    }
    public void setPost_time(String post_time) {
        this.post_time = post_time;
    }

    public boolean is_have_comment() {
        return is_have_comment;
    }
    public void setIs_have_comment(boolean is_have_comment) {
        this.is_have_comment = is_have_comment;
    }
}
