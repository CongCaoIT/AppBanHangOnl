package com.example.appbanhangonl.retrofit;

import com.example.appbanhangonl.model.Category;
import com.example.appbanhangonl.model.Product;
import com.example.appbanhangonl.model.User;
import com.example.appbanhangonl.model.ViewOrders;

import io.reactivex.rxjava3.core.Observable;
import retrofit2.http.Field;
import retrofit2.http.FormUrlEncoded;
import retrofit2.http.GET;
import retrofit2.http.POST;

public interface ApiBanHang {
    @GET("getcategory.php")
    Observable<Category> getAPICategory();

    @GET("getproduct.php")
    Observable<Product> getAPIProduct();

    @POST("getinfoproduct.php")
    @FormUrlEncoded
    Observable<Product> getAPIProduct(
            @Field("page") int page,
            @Field("info") int info
    );

    @POST("register.php")
    @FormUrlEncoded
    Observable<User> registerAPI(
            @Field("email") String email,
            @Field("pass") String pass,
            @Field("username") String username,
            @Field("mobile") String mobile
    );

    @POST("login.php")
    @FormUrlEncoded
    Observable<User> loginAPI(
            @Field("email") String email,
            @Field("pass") String pass
    );

    @POST("reset.php")
    @FormUrlEncoded
    Observable<User> resetpassAPI(
            @Field("email") String email
    );

    @POST("bill.php")
    @FormUrlEncoded
    Observable<User> billAPI(
            @Field("email") String email,
            @Field("total") String total,
            @Field("phone") String phone,
            @Field("address") String address,
            @Field("quanlity") int quanlity,
            @Field("iduser") int iduser,
            @Field("billinfo") String billinfo
    );

    @POST("vieworders.php")
    @FormUrlEncoded
    Observable<ViewOrders> viewordersAPI(
            @Field("iduser") int id
    );

    @POST("search.php")
    @FormUrlEncoded
    Observable<Product> searchsAPI(
            @Field("search") String search
    );

}
