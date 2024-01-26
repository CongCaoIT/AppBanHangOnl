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
import com.example.appbanhangonl.model.ProductModel;

import java.text.DecimalFormat;
import java.util.List;

public class PhoneAdapter extends RecyclerView.Adapter<PhoneAdapter.MyViewHolder> {
    Context context;
    List<ProductModel> arr;

    public PhoneAdapter(Context context, List<ProductModel> arr) {
        this.context = context;
        this.arr = arr;
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View item = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_phone, parent, false);
        return new MyViewHolder(item);
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {
        ProductModel productModel = arr.get(position);
        holder.textViewPhoneName.setText(productModel.getTenSP());
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        holder.textViewPhonePrice.setText("Giá: " +decimalFormat.format(Double.parseDouble(productModel.getGiaSP()))+" VND");
        holder.textViewPhoneDescribe.setText(productModel.getMoTa());
        Glide.with(context).load(productModel.getHinhAnh()).into(holder.imageViewPhone);
    }

    @Override
    public int getItemCount() {
        return arr.size();
    }


    public class MyViewHolder extends RecyclerView.ViewHolder{
        TextView textViewPhoneName, textViewPhonePrice, textViewPhoneDescribe;
        ImageView imageViewPhone;
        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            textViewPhoneName = itemView.findViewById(R.id.item_phone_name);
            textViewPhonePrice = itemView.findViewById(R.id.item_phone_price);
            textViewPhoneDescribe = itemView.findViewById(R.id.item_phone_describe);
            imageViewPhone = itemView.findViewById(R.id.item_phone_img);
        }
    }
}
