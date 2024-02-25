package com.example.appbanhangonl.activity;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import com.example.appbanhangonl.R;
import com.example.appbanhangonl.adapter.CartAdapter;
import com.example.appbanhangonl.model.CartModel;
import com.example.appbanhangonl.utils.Utils;

import org.w3c.dom.Text;

public class CartActivity extends AppCompatActivity {

    TextView textViewCartNull, textViewTotalPrice;
    Toolbar toolbar;
    RecyclerView recyclerView;
    Button buttonBuy;
    CartAdapter cartAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cart);
        initView();
        initControl();
    }

    private void initControl() {
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });

        recyclerView.setHasFixedSize(true);
        RecyclerView.LayoutManager layoutManager = new LinearLayoutManager(this);
        recyclerView.setLayoutManager(layoutManager);

        if(Utils.CartList.size() == 0){
            textViewCartNull.setVisibility(View.VISIBLE);
        }else{
            cartAdapter = new CartAdapter(getApplicationContext(), Utils.CartList);
            recyclerView.setAdapter(cartAdapter);
        }
    }

    private void initView() {
        textViewCartNull = findViewById(R.id.txbCartNull);
        textViewTotalPrice = findViewById(R.id.txbTotalPrice);
        toolbar = findViewById(R.id.toolbar);
        recyclerView = findViewById(R.id.recyclerViewCart);
        buttonBuy = findViewById(R.id.btnBuy);
    }
}