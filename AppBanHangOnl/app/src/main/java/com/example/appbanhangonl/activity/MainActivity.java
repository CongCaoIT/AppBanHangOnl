package com.example.appbanhangonl.activity;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.core.view.GravityCompat;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.Toast;
import android.widget.ViewFlipper;

import com.bumptech.glide.Glide;
import com.example.appbanhangonl.R;
import com.example.appbanhangonl.adapter.CategoryAdapter;
import com.example.appbanhangonl.model.CategoryModel;
import com.example.appbanhangonl.retrofit.ApiBanHang;
import com.example.appbanhangonl.retrofit.RetrofitClient;
import com.example.appbanhangonl.utils.Utils;
import com.google.android.material.navigation.NavigationView;

import java.util.ArrayList;
import java.util.List;

import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.schedulers.Schedulers;

public class MainActivity extends AppCompatActivity {

    Toolbar toolbar;
    ViewFlipper viewFlipper;
    RecyclerView recyclerViewHome;
    NavigationView navigationView;
    ListView listViewHome;
    DrawerLayout drawerLayout;
    CategoryAdapter categoryAdapter;
    List<CategoryModel> categoryModelList;
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    ApiBanHang apiBanHang;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        apiBanHang = RetrofitClient.getInstance(Utils.BASE_URL).create(ApiBanHang.class);
        Mapping();
        ActionBar();
        if (isConnected(this)) {
            ActionViewFliper();
            getCategoryList();
        } else {
            Toast.makeText(getApplicationContext(), "Không có Internet!!!", Toast.LENGTH_SHORT).show();
        }
    }

    private void getCategoryList() {
        compositeDisposable.add(apiBanHang.getAPICategory()
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(
                        category -> {
                            if (category.isSucces()) {
                                categoryModelList = category.getResult();
                                categoryAdapter = new CategoryAdapter(getApplicationContext(), categoryModelList);
                                listViewHome.setAdapter(categoryAdapter);
                            }
                        }
                ));
    }

    //Ánh xạ
    private void Mapping() {
        toolbar = findViewById(R.id.toolBarHome);
        viewFlipper = findViewById(R.id.viewFlipper);
        recyclerViewHome = findViewById(R.id.recyclerView);
        navigationView = findViewById(R.id.navigationView);
        listViewHome = findViewById(R.id.listViewHome);
        drawerLayout = findViewById(R.id.drawerLayout);
        //Khởi tạo list
        categoryModelList = new ArrayList<>();

    }

    //Thanh menu
    private void ActionBar() {
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbar.setNavigationIcon(android.R.drawable.ic_menu_sort_by_size); //Thay đổi icon
        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                drawerLayout.openDrawer(GravityCompat.START);
            }
        });
    }

    //Chạy quảng cáo
    private void ActionViewFliper() {
        List<Integer> arrAdvertisement = new ArrayList<>();
        arrAdvertisement.add(R.drawable.quangcao1);
        arrAdvertisement.add(R.drawable.quangcao2);
        arrAdvertisement.add(R.drawable.quangcao3);

        for (int i = 0; i < arrAdvertisement.size(); i++) {
            ImageView imageView = new ImageView(getApplicationContext());
            Glide.with(getApplicationContext()).load(arrAdvertisement.get(i)).into(imageView);
            imageView.setScaleType(ImageView.ScaleType.FIT_XY);
            viewFlipper.addView(imageView);
        }
        viewFlipper.setFlipInterval(3000);
        viewFlipper.setAutoStart(true);
        Animation slide_in = AnimationUtils.loadAnimation(getApplicationContext(), R.anim.slide_in_right);
        Animation slide_out = AnimationUtils.loadAnimation(getApplicationContext(), R.anim.slide_out_right);
        viewFlipper.setInAnimation(slide_in);
        viewFlipper.setOutAnimation(slide_out);
    }

    //Kiểm tra kết nối Internet
    private boolean isConnected(Context context) {
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo wifi = connectivityManager.getNetworkInfo(ConnectivityManager.TYPE_WIFI);
        NetworkInfo mobile = connectivityManager.getNetworkInfo(ConnectivityManager.TYPE_MOBILE);
        if ((wifi != null && wifi.isConnected()) || (mobile != null && mobile.isConnected())) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    protected void onDestroy() {
        compositeDisposable.clear();
        super.onDestroy();
    }
}