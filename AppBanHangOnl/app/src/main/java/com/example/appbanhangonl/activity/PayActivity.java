package com.example.appbanhangonl.activity;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.AppCompatButton;
import androidx.appcompat.widget.Toolbar;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.os.StrictMode;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.example.appbanhangonl.R;
import com.example.appbanhangonl.model.CartModel;
import com.example.appbanhangonl.model.CreateOrder;
import com.example.appbanhangonl.model.NotiSendData;
import com.example.appbanhangonl.model.ToastHelper;
import com.example.appbanhangonl.retrofit.ApiBanHang;
import com.example.appbanhangonl.retrofit.ApiPushNotification;
import com.example.appbanhangonl.retrofit.RetrofitClient;
import com.example.appbanhangonl.retrofit.RetrofitClientNoti;
import com.example.appbanhangonl.utils.Utils;
import com.google.gson.Gson;

import org.json.JSONObject;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.core.SingleObserver;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.disposables.Disposable;
import io.reactivex.rxjava3.schedulers.Schedulers;
import retrofit2.Retrofit;
import vn.zalopay.sdk.Environment;
import vn.zalopay.sdk.ZaloPayError;
import vn.zalopay.sdk.ZaloPaySDK;
import vn.zalopay.sdk.listeners.PayOrderListener;

public class PayActivity extends AppCompatActivity {
    Toolbar toolbar;
    TextView textViewTotalPrice, textViewMobile, textViewEmail, textCurrentDate;
    EditText editTextAddress;
    AppCompatButton buttonPay, buttonZaloPay;
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    ApiBanHang apiBanHang;
    long total;
    int totalItem, iddonhang = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pay);

        // Khởi tạo ZaloPay SDK
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);
        ZaloPaySDK.init(2554, Environment.SANDBOX); // Thay đổi thành Environment.PRODUCTION khi triển khai thực tế

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

        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        textCurrentDate.setText(dateFormat.format(currentDate));

        buttonPay.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String str_address = editTextAddress.getText().toString().trim();
                if (TextUtils.isEmpty(str_address)) {
                    ToastHelper.showCustomToast(getApplicationContext(), "Vui lòng nhập địa chỉ giao hàng !!!");
                } else {
                    if (!Utils.CartListBuy.isEmpty()) {
                        // Tiến hành đặt hàng
                        compositeDisposable.add(apiBanHang.billAPI(Utils.user_current.getEmail(), String.valueOf(total), Utils.user_current.getMobile(), str_address, totalItem, Utils.user_current.getId(), new Gson().toJson(Utils.CartListBuy))
                                .subscribeOn(Schedulers.io())
                                .observeOn(AndroidSchedulers.mainThread())
                                .subscribe(
                                        user -> {
                                            pushNotiToUser();
                                            ToastHelper.showCustomToast(getApplicationContext(), "Đặt hàng thành công !!!");

                                            // Cập nhật lại giỏ hàng
                                            List<CartModel> remainingItems = new ArrayList<>();
                                            for (CartModel cartModel : Utils.CartList) {
                                                if (!Utils.CartListBuy.contains(cartModel)) {
                                                    remainingItems.add(cartModel);
                                                }
                                            }
                                            Utils.CartList.clear();
                                            Utils.CartList.addAll(remainingItems);
                                            Utils.CartListBuy.clear(); // Xóa danh sách các mục đã mua

                                            // Điều hướng về MainActivity
                                            Intent intent = new Intent(getApplicationContext(), MainActivity.class);
                                            startActivity(intent);
                                            finish();
                                        },
                                        throwable -> {
                                            Toast.makeText(getApplicationContext(), throwable.getMessage(), Toast.LENGTH_SHORT).show();
                                        }
                                ));
                    } else {
                        ToastHelper.showCustomToast(getApplicationContext(), "Bạn chưa chọn sản phẩm nào để mua !!!");
                    }
                }
            }
        });

        buttonZaloPay.setOnClickListener(new View.OnClickListener() {
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

                        // Tiến hành thanh toán
                        compositeDisposable.add(apiBanHang.billAPI_ZaloPay(str_email, String.valueOf(total), str_phone, str_address, totalItem, id, new Gson().toJson(Utils.CartListBuy))
                                .subscribeOn(Schedulers.io())
                                .observeOn(AndroidSchedulers.mainThread())
                                .subscribe(
                                        messageUser -> {
                                            iddonhang = Integer.parseInt(messageUser.getIddonhang());  // Ensure this parses correctly

                                            ToastHelper.showCustomToast(getApplicationContext(), "Chuyển hướng ... ");
                                            requestZaloPay();
                                        },
                                        throwable -> {
                                            Toast.makeText(getApplicationContext(), throwable.getMessage(), Toast.LENGTH_SHORT).show();
                                        }
                                ));
                    } else {
                        ToastHelper.showCustomToast(getApplicationContext(), "Bạn chưa chọn sản phẩm nào để mua!");
                    }
                }
            }
        });
    }

    private void requestZaloPay() {
        CreateOrder orderApi = new CreateOrder();

        try {
            JSONObject data = orderApi.createOrder(String.valueOf(total));
            String code = data.getString("return_code");
            if (code.equals("1")) {
                String token = data.getString("zp_trans_token");

                //Lưu token vào database
                compositeDisposable.add(apiBanHang.updateTokenZaloPay(iddonhang, token)
                        .subscribeOn(Schedulers.io())
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribe(MessageModel -> {
                            if (MessageModel.isSucces()) {
                            }
                        }));

                //Gọi hàm thanh toán
                ZaloPaySDK.getInstance().payOrder(PayActivity.this, token, "demozpdk://app", new PayOrderListener() {
                    @Override
                    public void onPaymentSucceeded(final String transactionId, final String transToken,
                                                   final String appTransID) {
                        runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                new AlertDialog.Builder(PayActivity.this)
                                        .setTitle("Payment Success")
                                        .setMessage(String.format("TransactionId: %s - TransToken: %s", transactionId,
                                                transToken))
                                        .setPositiveButton("OK", new DialogInterface.OnClickListener() {
                                            @Override
                                            public void onClick(DialogInterface dialog, int which) {
                                                ToastHelper.showCustomToast(getApplicationContext(), "Đặt hàng thành công !!!");
                                                pushNotiToUser();

                                                // Xóa các mục đã mua khỏi CartList sau khi giao dịch thành công
                                                Utils.CartList.removeAll(Utils.CartListBuy);
                                                Utils.CartListBuy.clear(); // Xóa danh sách các mục đã mua

                                                // Chuyển đến màn hình chính sau khi hoàn tất giao dịch
                                                Intent intent = new Intent(getApplicationContext(), MainActivity.class);
                                                startActivity(intent);
                                                finish();
                                            }
                                        })
                                        .setNegativeButton("Cancel", null).show();
                            }

                        });
                    }

                    @Override
                    public void onPaymentCanceled(String zpTransToken, String appTransID) {
                        new AlertDialog.Builder(PayActivity.this)
                                .setTitle("User Cancel Payment")
                                .setMessage(String.format("zpTransToken: %s \n", zpTransToken))
                                .setPositiveButton("OK", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialog, int which) {
                                    }
                                })
                                .setNegativeButton("Cancel", null).show();
                    }

                    @Override
                    public void onPaymentError(ZaloPayError zaloPayError, String zpTransToken, String appTransID) {
                        new AlertDialog.Builder(PayActivity.this)
                                .setTitle("Payment Fail")
                                .setMessage(String.format("ZaloPayErrorCode: %s \nTransToken: %s",
                                        zaloPayError.toString(), zpTransToken))
                                .setPositiveButton("OK", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialog, int which) {
                                    }
                                })
                                .setNegativeButton("Cancel", null).show();
                    }
                });

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void pushNotiToUser() {
        compositeDisposable.add(apiBanHang.gettoken(1, Utils.user_current.getId())
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
                            } else {
                                Toast.makeText(getApplicationContext(), "Không nhận được thông báo", Toast.LENGTH_LONG).show();
                                Log.d("- Lỗi", "Không nhận được thông báo");
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
        buttonZaloPay = findViewById(R.id.buttonZaloPay);
        textCurrentDate = findViewById(R.id.textCurrentDate);
    }

    @Override
    protected void onDestroy() {
        compositeDisposable.clear();
        super.onDestroy();
    }

    //Cần bắt sự kiện OnNewIntent vì ZaloPay App sẽ gọi deeplink về app của Merchant
    @Override
    public void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        ZaloPaySDK.getInstance().onResult(intent);
    }
}
