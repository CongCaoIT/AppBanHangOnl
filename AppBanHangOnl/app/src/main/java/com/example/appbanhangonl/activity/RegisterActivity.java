package com.example.appbanhangonl.activity;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.AppCompatButton;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.example.appbanhangonl.R;
import com.example.appbanhangonl.retrofit.ApiBanHang;
import com.example.appbanhangonl.retrofit.RetrofitClient;
import com.example.appbanhangonl.utils.Utils;

import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.schedulers.Schedulers;

public class RegisterActivity extends AppCompatActivity {

    EditText textEmail, textPassword, textConfirmPassword, textMobile, textUserName;
    TextView textViewLogin;
    AppCompatButton buttonRegister;
    ApiBanHang apiBanHang;
    CompositeDisposable compositeDisposable = new CompositeDisposable();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);
        initView();
        initControll();
    }

    private void initControll() {
        buttonRegister.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                registerApp();
            }
        });
        textViewLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getApplicationContext(), LoginActivity.class);
                startActivity(intent);
            }
        });
    }

    private void registerApp() {
        String str_email = textEmail.getText().toString().trim();
        String str_pass = textPassword.getText().toString().trim();
        String str_confirmpassword = textConfirmPassword.getText().toString().trim();
        String str_mobile = textMobile.getText().toString().trim();
        String str_username = textUserName.getText().toString().trim();

        if (TextUtils.isEmpty(str_username)) {
            Toast.makeText(getApplicationContext(), "Vui lòng nhập tên tài khoản!!!", Toast.LENGTH_SHORT).show();
        } else if (TextUtils.isEmpty(str_email)) {
            Toast.makeText(getApplicationContext(), "Vui lòng nhập Email!!!", Toast.LENGTH_SHORT).show();
        } else if (TextUtils.isEmpty(str_mobile)) {
            Toast.makeText(getApplicationContext(), "Vui lòng nhập số điện thoại!!!", Toast.LENGTH_SHORT).show();
        } else if (TextUtils.isEmpty(str_pass)) {
            Toast.makeText(getApplicationContext(), "Vui lòng nhập mật khẩu!!!", Toast.LENGTH_SHORT).show();
        } else if (TextUtils.isEmpty(str_confirmpassword)) {
            Toast.makeText(getApplicationContext(), "Vui lòng nhập lại mật khẩu!!!", Toast.LENGTH_SHORT).show();
        } else {
            if (str_pass.equals(str_confirmpassword)) {
                //post data
                compositeDisposable.add(apiBanHang.registerAPI(str_email, str_pass, str_username, str_mobile)
                        .subscribeOn(Schedulers.io())
                        .observeOn(AndroidSchedulers.mainThread())
                        .subscribe(
                                user -> {
                                    if(user.isSucces()){
                                        Toast.makeText(getApplicationContext(), "Đăng ký tài khoản thành công!!!", Toast.LENGTH_SHORT).show();
                                        Utils.user_current.setEmail(str_email);
                                        Utils.user_current.setPass(str_pass);
                                        Intent intent = new Intent(getApplicationContext(), LoginActivity.class);
                                        startActivity(intent);
                                        finish();
                                    }else{
                                        Toast.makeText(getApplicationContext(), user.getMessage(), Toast.LENGTH_SHORT).show();
                                    }
                                },
                                throwable -> {
                                    Toast.makeText(getApplicationContext(), throwable.getMessage(), Toast.LENGTH_SHORT).show();
                                }
                        ));
            } else {
                Toast.makeText(getApplicationContext(), "Mật khẩu chưa khớp nhau!!!", Toast.LENGTH_SHORT).show();
            }
        }
    }

    private void initView() {
        textViewLogin = findViewById(R.id.textLogin);
        apiBanHang = RetrofitClient.getInstance(Utils.BASE_URL).create(ApiBanHang.class);
        textEmail = findViewById(R.id.textEmail);
        textPassword = findViewById(R.id.textPassword);
        textConfirmPassword = findViewById(R.id.textConfirmPassword);
        textMobile = findViewById(R.id.textMobile);
        textUserName = findViewById(R.id.textUserName);
        buttonRegister = findViewById(R.id.buttonRegister);
    }

    @Override
    protected void onDestroy() {
        compositeDisposable.clear();
        super.onDestroy();
    }
}