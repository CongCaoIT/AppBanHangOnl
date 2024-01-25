package com.example.appbanhangonl.retrofit;

import com.example.appbanhangonl.model.Category;

import io.reactivex.rxjava3.core.Observable;
import retrofit2.http.GET;

public interface ApiBanHang {
    @GET("getcategory.php")
    Observable<Category> getAPICategory();
}
