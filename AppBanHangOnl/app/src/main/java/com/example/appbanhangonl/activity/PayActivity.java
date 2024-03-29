package com.example.appbanhangonl.activity;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.AppCompatButton;
import androidx.appcompat.widget.Toolbar;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.example.appbanhangonl.R;
import com.example.appbanhangonl.model.CartModel;
import com.example.appbanhangonl.model.NotiSendData;
import com.example.appbanhangonl.retrofit.ApiBanHang;
import com.example.appbanhangonl.retrofit.ApiPushNotification;
import com.example.appbanhangonl.retrofit.RetrofitClient;
import com.example.appbanhangonl.retrofit.RetrofitClientNoti;
import com.example.appbanhangonl.utils.Utils;
import com.google.gson.Gson;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.schedulers.Schedulers;
import retrofit2.Retrofit;

public class PayActivity extends AppCompatActivity {
    Toolbar toolbar;
    TextView textViewTotalPrice, textViewMobile, textViewEmail;
    EditText editTextAddress;
    AppCompatButton buttonPay;
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    ApiBanHang apiBanHang;
    long total;
    int totalItem;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pay);
        initView();
        countItem();
        initControll();
    }

    private void countItem() {
        totalItem = 0;
        for (int i = 0; i < Utils.CartListBuy.size(); i++) {
            totalItem = totalItem + Utils.CartListBuy.get(i).getQuality();
        }
    }

    private void initControll() {
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });

        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        total = getIntent().getLongExtra("totalprice", 0);
        textViewTotalPrice.setText(decimalFormat.format(total));
        textViewEmail.setText(Utils.user_current.getEmail());
        textViewMobile.setText(Utils.user_current.getMobile());

        // buttonPay onClick
        // Trong sự kiện onClick() của nút thanh toán, cập nhật tổng giá trị sau khi giao dịch được thực hiện thành công
        buttonPay.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String str_address = editTextAddress.getText().toString().trim();
                if (TextUtils.isEmpty(str_address)) {
                    Toast.makeText(getApplicationContext(), "Vui lòng nhập địa chỉ giao hàng!", Toast.LENGTH_SHORT).show();
                } else {
                    if (!Utils.CartListBuy.isEmpty()) { // Kiểm tra xem có sản phẩm nào được chọn để mua không
                        //post data
                        String str_email = Utils.user_current.getEmail();
                        String str_phone = Utils.user_current.getMobile();
                        int id = Utils.user_current.getId();
                        Log.d("test", new Gson().toJson(Utils.CartListBuy));

                        // Tiến hành thanh toán
                        compositeDisposable.add(apiBanHang.billAPI(str_email, String.valueOf(total), str_phone, str_address, totalItem, id, new Gson().toJson(Utils.CartListBuy))
                                .subscribeOn(Schedulers.io())
                                .observeOn(AndroidSchedulers.mainThread())
                                .subscribe(
                                        user -> {
                                            Toast.makeText(getApplicationContext(), "Đặt hàng thành công!!!", Toast.LENGTH_SHORT).show();
                                            pushNotiToUser();

                                            // Xóa các mục đã mua khỏi CartList sau khi giao dịch thành công
                                            Utils.CartList.removeAll(Utils.CartListBuy);
                                            Utils.CartListBuy.clear(); // Xóa danh sách các mục đã mua

                                            // Chuyển đến màn hình chính sau khi hoàn tất giao dịch
                                            Intent intent = new Intent(getApplicationContext(), MainActivity.class);
                                            startActivity(intent);
                                            finish();
                                        },
                                        throwable -> {
                                            Toast.makeText(getApplicationContext(), throwable.getMessage(), Toast.LENGTH_SHORT).show();
                                        }
                                ));
                    } else {
                        Toast.makeText(getApplicationContext(), "Bạn chưa chọn sản phẩm nào để mua!", Toast.LENGTH_SHORT).show();
                    }
                }
            }
        });
    }

    private void pushNotiToUser() {
        // Get token 2001210289 - Huỳnh Công Huy - Bài 45: Gửi thông báo trên app quản lí
        compositeDisposable.add(apiBanHang.gettoken(1)
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(
                        user -> {
                            if (user.isSucces()) {
                                for (int i = 0; i < user.getResult().size(); i++) {
                                    Map<String, String> data = new HashMap<>();
                                    data.put("title", "Thông báo");
                                    data.put("body", "Bạn có đơn hàng mới!!!");
                                    NotiSendData notiSendData = new NotiSendData(user.getResult().get(i).getToken(), data);
                                    ApiPushNotification apiPushNotification = RetrofitClientNoti.getInstance().create(ApiPushNotification.class);
                                    compositeDisposable.add(apiPushNotification.senNotification(notiSendData)
                                            .subscribeOn(Schedulers.io())
                                            .observeOn(AndroidSchedulers.mainThread())
                                            .subscribe(
                                                    notiResponse -> {
                                                        Toast.makeText(getApplicationContext(), "Thành công", Toast.LENGTH_LONG).show();
                                                        Log.d("Thành Công", "Thành công");
                                                    },
                                                    throwable -> {
                                                        Toast.makeText(getApplicationContext(), "Lỗi: " + throwable.getMessage(), Toast.LENGTH_LONG).show();
                                                        Log.d("- Lỗi", "- Lỗi: " + throwable.getMessage());
                                                    }
                                            ));
                                }
                            }
                        },
                        throwable -> {
                            Log.d("Lỗi", "Lỗi: " + throwable.getMessage());
                        }
                ));
    }

    private void initView() {
        apiBanHang = RetrofitClient.getInstance(Utils.BASE_URL).create(ApiBanHang.class);
        toolbar = findViewById(R.id.toolbar);
        textViewTotalPrice = findViewById(R.id.textToltalPrice);
        textViewMobile = findViewById(R.id.textMobile);
        textViewEmail = findViewById(R.id.textEmail);
        editTextAddress = findViewById(R.id.edittextAddress);
        buttonPay = findViewById(R.id.buttonPay);
    }

    @Override
    protected void onDestroy() {
        compositeDisposable.clear();
        super.onDestroy();
    }
}