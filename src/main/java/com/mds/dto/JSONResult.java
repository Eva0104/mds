package com.mds.dto;

public class JSONResult {
    public static final String SUCCESS="success";
    public static final String ERROR="error";

    private String state;
    private String message;
    private Object data;
    public JSONResult(Object data){
        this(SUCCESS,data);
    }
    public JSONResult(String message){
        this(ERROR,message);
    }

    public JSONResult(String state, Object data) {
        this.state = state;
        this.data = data;
    }

    public JSONResult(String state, String message) {
        this.state = state;
        this.message = message;
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

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
