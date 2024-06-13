package com.example.appbanhangonl.model;

import com.google.gson.annotations.SerializedName;

public class MessageModel {
    boolean succes;
    String message;
    String name;

    // <Zalo Pay
        @SerializedName("iddonhang")
        String iddonhang;

    public String getIddonhang() {
        return iddonhang;
    }
    public void setIddonhang(String iddonghang) {
        this.iddonhang = iddonghang;
    }
    // Zalo pay />

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isSucces() {
        return succes;
    }

    public void setSucces(boolean succes) {
        this.succes = succes;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
