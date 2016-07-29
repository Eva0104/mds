package com.mds.dto;

public class FlashMessage {
    public static final String state_success="success";
    public static final String state_error="error";

    private String state;
    private  String message;
    public FlashMessage(String message){
        this.state=state_success;
        this.message=message;
    }
    public FlashMessage(String state,String message){
        this.state=state;
        this.message=message;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
