package com.jspcms;

/**
 * Created by huangang on 15/5/5.
 */
public class User {
    private int uid;
    private String username;
    private String password;
    private String email;
    private String role;
    private String register_time;

    public int getUid(){
        return uid;
    }
    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword(){
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail(){
        return email;
    }
    public void setEmail(String email){
        this.email = email;
    }

    public String getRole(){
        return role;
    }
    public void setRole(String role){
        this.role=role;
    }

    public String getRegister_time() {
        return register_time;
    }
    public void setRegister_time(String register_time) {
        this.register_time = register_time;
    }

}
