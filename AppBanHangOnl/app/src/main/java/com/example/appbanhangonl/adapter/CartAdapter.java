package com.example.appbanhangonl.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.bumptech.glide.Glide;
import com.example.appbanhangonl.R;
import com.example.appbanhangonl.model.CartModel;

import java.text.DecimalFormat;
import java.util.List;

public class CartAdapter extends RecyclerView.Adapter<CartAdapter.MyViewHolder> {
    Context context;
    List<CartModel> cartModelList;

    public CartAdapter(Context context, List<CartModel> cartModelList) {
        this.context = context;
        this.cartModelList = cartModelList;
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_cart, parent, false);
        return new MyViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {
        CartModel cartModel = cartModelList.get(position);
        holder.item_cart_name.setText(cartModel.getProductName());
        holder.item_cart_quanlity.setText(cartModel.getQuality() + " ");
        Glide.with(context).load(cartModel.getProductImg()).into(holder.item_cart_img);
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        holder.item_cart_price.setText("Giá: " + decimalFormat.format(cartModel.getPrice()) + " VND");
        long price = cartModel.getQuality() * cartModel.getPrice();
        holder.item_cart_priceproduct.setText("Tiền: " + decimalFormat.format(price) + " VND");
    }

    @Override
    public int getItemCount() {
        return cartModelList.size();
    }


    public class MyViewHolder extends RecyclerView.ViewHolder {
        ImageView item_cart_img;
        TextView item_cart_name, item_cart_price, item_cart_quanlity, item_cart_priceproduct;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            item_cart_img = itemView.findViewById(R.id.item_cart_img);
            item_cart_name = itemView.findViewById(R.id.item_cart_name);
            item_cart_price = itemView.findViewById(R.id.item_cart_price);
            item_cart_quanlity = itemView.findViewById(R.id.item_cart_quanlity);
            item_cart_priceproduct = itemView.findViewById(R.id.item_cart_priceproduct);
        }
    }
}
