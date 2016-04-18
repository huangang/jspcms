package com.jspcms;

/**
 * Created by joya on 15/5/5.
 */
public class Comment {
    private int cid;
    private int uid;
    private int pid;
    private int reply_cid;
    private String content;
    private String comment_time;

    public int getCid() {
        return cid;
    }
    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getUid() {
        return uid;
    }
    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getPid() {
        return pid;
    }
    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getReply_cid() {
        return reply_cid;
    }
    public void setReply_cid(int reply_cid) {
        this.reply_cid = reply_cid;
    }

    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }

    public String getComment_time() {
        return comment_time;
    }
    public void setComment_time(String comment_time) {
        this.comment_time = comment_time;
    }
}
