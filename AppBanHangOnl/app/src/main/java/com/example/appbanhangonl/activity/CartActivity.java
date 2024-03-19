package com.example.appbanhangonl.activity;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import com.example.appbanhangonl.R;
import com.example.appbanhangonl.adapter.CartAdapter;
import com.example.appbanhangonl.model.CartModel;
import com.example.appbanhangonl.model.EventBus.totalAmountEvent;
import com.example.appbanhangonl.utils.Utils;

import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;
import org.w3c.dom.Text;

import java.text.DecimalFormat;
import java.util.ArrayList;

public class CartActivity extends AppCompatActivity {

    TextView textViewCartNull, textViewTotalPrice;
    Toolbar toolbar;
    RecyclerView recyclerView;
    Button buttonBuy;
    CartAdapter cartAdapter;
    long total;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cart);
        initView();
        initControl();
        totalAmount();
    }

    private void totalAmount() {
        total = 0;
        for (int i = 0; i < Utils.CartListBuy.size(); i++) {
            total = total + (Utils.CartListBuy.get(i).getPrice() * Utils.CartListBuy.get(i).getQuality());
        }
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        textViewTotalPrice.setText(decimalFormat.format(total) + " VND");
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

        if (Utils.CartList.size() == 0) {
            textViewCartNull.setVisibility(View.VISIBLE);
        } else {
            cartAdapter = new CartAdapter(getApplicationContext(), Utils.CartList);
            recyclerView.setAdapter(cartAdapter);
        }

        buttonBuy.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Tạo một danh sách mới để lưu các mục chưa được chọn
                ArrayList<CartModel> newCartList = new ArrayList<>();

                // Lặp qua từng mục trong CartList
                for (CartModel item : Utils.CartList) {
                    // Kiểm tra xem mục này đã được chọn hay không
                    if (!isItemInCartListBuy(item)) {
                        // Nếu không được chọn, thêm vào danh sách mới
                        newCartList.add(item);
                    }
                }

                // Gán danh sách mới cho CartList
                Utils.CartList = newCartList;

                // Tiến hành thanh toán
                Intent intent = new Intent(getApplicationContext(), PayActivity.class);
                intent.putExtra("totalprice", total);
                startActivity(intent);
            }
        });
    }
    // Phương thức kiểm tra xem một mục có trong CartListBuy hay không
    private boolean isItemInCartListBuy(CartModel item) {
        for (CartModel buyItem : Utils.CartListBuy) {
            if (buyItem.getCartid() == item.getCartid()) {
                return true;
            }
        }
        return false;
    }
    private void initView() {
        textViewCartNull = findViewById(R.id.txbCartNull);
        textViewTotalPrice = findViewById(R.id.txbTotalPrice);
        toolbar = findViewById(R.id.toolbar);
        recyclerView = findViewById(R.id.recyclerViewCart);
        buttonBuy = findViewById(R.id.buttonBuy);
    }

    @Override
    protected void onStart() {
        super.onStart();
        EventBus.getDefault().register(this);
    }

    @Override
    protected void onStop() {
        EventBus.getDefault().unregister(this);
        super.onStop();
    }
    @Subscribe(sticky = true, threadMode = ThreadMode.MAIN)
    public void eventTotal(totalAmountEvent event)
    {
        if(event !=null)
        {
            totalAmount();
        }
    }
}