package com.example.appbanhangonl.model;

import java.util.List;

public class OrdersModel {
    int id;
    int iduser;
    String address;
    String phone;
    String total;
    int status;
    List<ViewOrdersModel> item;

    public OrdersModel(int id, int iduser, String address, String sodienthoai, String tongtien, List<ViewOrdersModel> item) {
        this.id = id;
        this.iduser = iduser;
        this.address = address;
        this.phone = sodienthoai;
        this.total = tongtien;
        this.item = item;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIduser() {
        return iduser;
    }

    public void setIduser(int iduser) {
        this.iduser = iduser;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String Phone) {
        this.phone = Phone;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public List<ViewOrdersModel> getItem() {
        return item;
    }

    public void setItem(List<ViewOrdersModel> item) {
        this.item = item;
    }
}
