package com.example.appbanhangonl.utils;

import com.example.appbanhangonl.model.CartModel;
import com.example.appbanhangonl.model.UserModel;

import java.util.ArrayList;
import java.util.List;

public class Utils {
    public static final  String BASE_URL = "http://192.168.3.23:8081/banhang/";
    public static List<CartModel> CartList;
    public static List<CartModel> CartListBuy = new ArrayList<>();
    public static UserModel user_current = new UserModel();
}
