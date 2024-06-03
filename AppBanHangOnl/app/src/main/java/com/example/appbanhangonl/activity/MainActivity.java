package com.example.appbanhangonl.activity;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.core.view.GravityCompat;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.AdapterView;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ViewFlipper;

import com.bumptech.glide.Glide;
import com.example.appbanhangonl.R;
import com.example.appbanhangonl.adapter.CategoryAdapter;
import com.example.appbanhangonl.adapter.ProductAdapter;
import com.example.appbanhangonl.model.CategoryModel;
import com.example.appbanhangonl.model.ProductModel;
import com.example.appbanhangonl.model.UserModel;
import com.example.appbanhangonl.model.ViewOrders;
import com.example.appbanhangonl.retrofit.ApiBanHang;
import com.example.appbanhangonl.retrofit.RetrofitClient;
import com.example.appbanhangonl.utils.Utils;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.material.navigation.NavigationView;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.messaging.FirebaseMessaging;
import com.nex3z.notificationbadge.NotificationBadge;

import java.util.ArrayList;
import java.util.List;

import io.paperdb.Paper;
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
    List<ProductModel> productModelList;
    ProductAdapter productAdapter;
    NotificationBadge notificationBadge;
    FrameLayout frameLayout;
    ImageView imageViewSearch;
    ImageView imageView_HinhAnhUser;
    TextView textView_TenNguoiDung;
    private static final int REQUEST_CODE_PROFILE = 1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        apiBanHang = RetrofitClient.getInstance(Utils.BASE_URL).create(ApiBanHang.class);
        Paper.init(this);
        if (Paper.book().read("user") != null) {
            UserModel user = Paper.book().read("user");
            Utils.user_current = user;
        }
        getToken();
        Mapping();
        ActionBar();
        if (isConnected(this)) {
            ActionViewFliper();
            getCategoryList();
            getProduct();
            getEventClick();
        } else {
            Toast.makeText(getApplicationContext(), "Không có Internet!!!", Toast.LENGTH_SHORT).show();
        }

        ShowEmailNavigation();
    }

    private void getToken() {
        FirebaseMessaging.getInstance().getToken()
                .addOnSuccessListener(new OnSuccessListener<String>() {
                    @Override
                    public void onSuccess(String s) {
                        if (!TextUtils.isEmpty(s)) {
                            compositeDisposable.add(apiBanHang.updateToken(Utils.user_current.getId(), s)
                                    .subscribeOn(Schedulers.io())
                                    .observeOn(AndroidSchedulers.mainThread())
                                    .subscribe(
                                            messageModel -> {

                                            },
                                            throwable -> {
                                                Log.d("-Lỗi log: ", "- Lỗi: " + throwable.getMessage());
                                            }
                                    ));
                        }
                    }
                });
    }

    private void getEventClick() {
        listViewHome.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                switch (position) {
                    case 0:
                        Intent home = new Intent(getApplicationContext(), MainActivity.class);
                        startActivity(home);
                        break;
                    case 1:
                        Intent phoneProduct = new Intent(getApplicationContext(), PhoneProductActivity.class);
                        phoneProduct.putExtra("Loai", 1);
                        startActivity(phoneProduct);
                        break;
                    case 2:
                        Intent lapTopProduct = new Intent(getApplicationContext(), PhoneProductActivity.class);
                        lapTopProduct.putExtra("Loai", 2);
                        startActivity(lapTopProduct);
                        break;
                    case 3:
                        Intent viewOrders = new Intent(getApplicationContext(), ViewOrdersActivity.class);
                        startActivity(viewOrders);
                        break;
                    case 4:
                        Intent contact = new Intent(getApplicationContext(), ContactActivity.class);
                        startActivity(contact);
                        break;
                    case 5:
                        Intent infomation = new Intent(getApplicationContext(), InfomationActivity.class);
                        startActivity(infomation);
                        break;
                    case 6:
                        Intent management = new Intent(getApplicationContext(), ManagementActivity.class);
                        startActivity(management);
                        break;
                    case 7:
                        Intent tk = new Intent(getApplicationContext(), ThongKeActivity.class);
                        startActivity(tk);
                        break;
                    case 8:

                        break;
                    case 9:

                        break;
                    case 10:
                        Paper.book().delete("email");
                        FirebaseAuth.getInstance().signOut();
                        Intent login = new Intent(getApplicationContext(), LoginActivity.class);
                        startActivity(login);
                        finish();
                        break;
                }
            }
        });
    }

    private void getProduct() {
        compositeDisposable.add(apiBanHang.getAPIProduct()
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(
                        product -> {
                            if (product.isSucces()) {
                                productModelList = product.getResult();
                                productAdapter = new ProductAdapter(getApplicationContext(), productModelList);
                                recyclerViewHome.setAdapter(productAdapter);
                            }
                        },
                        throwable -> {
                            Toast.makeText(getApplicationContext(), "Không kết nối được" + throwable.getMessage(), Toast.LENGTH_SHORT).show();
                        }
                ));
    }

    private void getCategoryList() {
        compositeDisposable.add(apiBanHang.getAPICategory()
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(
                        category -> {
                            if (category.isSucces()) {
                                categoryModelList = category.getResult();
                                categoryModelList.add(new CategoryModel("Đơn hàng", "orther.png"));
                                categoryModelList.add(new CategoryModel("Liên hệ", "contact.png"));
                                categoryModelList.add(new CategoryModel("Thông tin", "info.png"));
                                categoryModelList.add(new CategoryModel("Quản lý", "management.png"));
                                categoryModelList.add(new CategoryModel("Thống kê", "statistical.png"));
                                categoryModelList.add(new CategoryModel("Live", "livestream.png"));
                                categoryModelList.add(new CategoryModel("Xem Live", "live.png"));
                                categoryModelList.add(new CategoryModel("Đăng xuất", "out.png"));
                                categoryAdapter = new CategoryAdapter(getApplicationContext(), categoryModelList);
                                listViewHome.setAdapter(categoryAdapter);
                            }
                        }
                ));
    }

    private void ShowEmailNavigation() {
        // Lấy header view từ NavigationView
        View headerView = navigationView.getHeaderView(0);

        // Tìm TextView trong header view
        textView_TenNguoiDung = headerView.findViewById(R.id.textView_TenNguoiDung);
        imageView_HinhAnhUser = headerView.findViewById(R.id.imageView_HinhAnhUser);

        if (textView_TenNguoiDung != null) {
            // Hiển thị email trong TextView
            textView_TenNguoiDung.setText(Utils.user_current.getUsername());
            Glide.with(getApplicationContext()).load(Utils.user_current.getImageUser()).into(imageView_HinhAnhUser);
            imageView_HinhAnhUser.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Intent intent = new Intent(getApplicationContext(), ProfileActivity.class);
                    intent.putExtra("Email", Utils.user_current.getEmail());
                    intent.putExtra("Username", Utils.user_current.getUsername());
                    intent.putExtra("Mobile", Utils.user_current.getMobile());
                    intent.putExtra("ImageUser", Utils.user_current.getImageUser());
                    startActivityForResult(intent, REQUEST_CODE_PROFILE);
                }
            });
        } else {
            // Nếu không tìm thấy TextView, hiển thị thông báo lỗi
            Toast.makeText(getApplicationContext(), "Không tìm thấy TextView", Toast.LENGTH_SHORT).show();
        }
    }

    //Ánh xạ
    private void Mapping() {
        toolbar = findViewById(R.id.toolBarHome);
        viewFlipper = findViewById(R.id.viewFlipper);
        recyclerViewHome = (RecyclerView) findViewById(R.id.recyclerView);
        RecyclerView.LayoutManager layoutManager = new GridLayoutManager(MainActivity.this, 2);
        recyclerViewHome.setLayoutManager(layoutManager);
        recyclerViewHome.setHasFixedSize(true);
        navigationView = findViewById(R.id.navigationView);
        listViewHome = findViewById(R.id.listViewHome);
        drawerLayout = findViewById(R.id.drawerLayout);
        notificationBadge = findViewById(R.id.menu_quanlity);
        imageViewSearch = findViewById(R.id.imageSearch);
        //Khởi tạo list
        categoryModelList = new ArrayList<>();
        productModelList = new ArrayList<>();
        frameLayout = findViewById(R.id.frameCart);
        if (Utils.CartList == null) {
            Utils.CartList = new ArrayList<>();
        } else {
            int totalItem = 0;
            for (int i = 0; i < Utils.CartList.size(); i++) {
                totalItem = totalItem + Utils.CartList.get(i).getQuality();
            }
            notificationBadge.setText(String.valueOf(totalItem));
        }
        frameLayout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent cart = new Intent(getApplicationContext(), CartActivity.class);
                startActivity(cart);
            }
        });

        imageViewSearch.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(), SearchActivity.class);
                startActivity(intent);
            }
        });
    }

    @Override
    protected void onResume() {
        super.onResume();
        int totalItem = 0;
        for (int i = 0; i < Utils.CartList.size(); i++) {
            totalItem = totalItem + Utils.CartList.get(i).getQuality();
        }
        notificationBadge.setText(String.valueOf(totalItem));
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
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == REQUEST_CODE_PROFILE && resultCode == RESULT_OK) {
            // Cập nhật giao diện với thông tin người dùng mới
            ShowEmailNavigation();
        }
    }

    @Override
    protected void onDestroy() {
        compositeDisposable.clear();
        super.onDestroy();
    }
}