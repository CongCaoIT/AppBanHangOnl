package com.example.appbanhangonl.activity;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;

import androidx.appcompat.widget.Toolbar;

import com.bumptech.glide.Glide;
import com.example.appbanhangonl.R;
import com.example.appbanhangonl.model.ProductModel;

import java.text.DecimalFormat;

public class ProductDetailsActivity extends AppCompatActivity {

    TextView textViewName, textViewPrice, textViewDescription;
    Button buttonAddCart;
    ImageView imageViewImg;
    Spinner spinner;
    Toolbar toolbar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_product_details);
        initView();
        ActionToolBar();
        initData();
    }

    private void initData() {
        ProductModel productModel = (ProductModel) getIntent().getSerializableExtra("data");
        textViewName.setText(productModel.getTenSP());
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        textViewPrice.setText("Giá: " + decimalFormat.format(Double.parseDouble(productModel.getGiaSP())) + " VND");
        textViewDescription.setText(productModel.getMoTa());
        Glide.with(getApplicationContext()).load(productModel.getHinhAnh()).into(imageViewImg);
        Integer[] num = new Integer[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
        ArrayAdapter<Integer> arrayAdapter = new ArrayAdapter<>(this, androidx.appcompat.R.layout.support_simple_spinner_dropdown_item, num);
        spinner.setAdapter(arrayAdapter);
    }

    private void initView() {
        textViewName = findViewById(R.id.txbName);
        textViewPrice = findViewById(R.id.txbPrice);
        textViewDescription = findViewById(R.id.txbDetailsDescription);
        buttonAddCart = findViewById(R.id.btnAddCart);
        spinner = findViewById(R.id.spinner);
        imageViewImg = findViewById(R.id.item_productdetails_img);
        toolbar = findViewById(R.id.toolbarDetails);
    }

    private void ActionToolBar() {
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
    }
}