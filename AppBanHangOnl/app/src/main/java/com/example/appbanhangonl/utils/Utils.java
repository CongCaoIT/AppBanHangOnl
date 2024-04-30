package com.example.appbanhangonl.utils;

import com.example.appbanhangonl.model.CartModel;
import com.example.appbanhangonl.model.UserModel;

import java.util.ArrayList;
import java.util.List;

public class Utils {
    public static final  String BASE_URL = "http://tcshop.id.vn/banhang/";
   // public static final  String BASE_URL = "http://10.10.10.56:8081/banhang/";
    public static List<CartModel> CartList;
    public static List<CartModel> CartListBuy = new ArrayList<>();
    public static UserModel user_current = new UserModel();

    public static String ID_RECEIVED;
    public static  final  String SENDID ="idsend";
    public static  final  String RECEIVEDID ="idrecieved";
    public static  final  String MESS ="message";
    public static  final  String DATETIME ="datetime";
    public static  final  String PATH_CHAT ="chat";
}
