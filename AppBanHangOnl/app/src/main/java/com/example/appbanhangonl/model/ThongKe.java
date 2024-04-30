package com.example.appbanhangonl.model;

public class ThongKe {
    public String getTenSP() {
        return TenSP;
    }

    public void setTenSP(String tenSP) {
        TenSP = tenSP;
    }

    public int getTong() {
        return tong;
    }

    public void setTong(int tong) {
        this.tong = tong;
    }

    private  String TenSP;
    private int tong;

    public String getThang() {
        return thang;
    }

    public void setThang(String thang) {
        this.thang = thang;
    }

    private String thang;

    public String getTongtienthang() {
        return tongtienthang;
    }

    public void setTongtienthang(String tongtienthang) {
        this.tongtienthang = tongtienthang;
    }

    private String tongtienthang;
}
