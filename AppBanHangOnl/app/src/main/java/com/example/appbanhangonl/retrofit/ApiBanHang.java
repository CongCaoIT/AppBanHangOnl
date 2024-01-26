package com.example.appbanhangonl.retrofit;

import com.example.appbanhangonl.model.Category;
import com.example.appbanhangonl.model.Product;

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
}
