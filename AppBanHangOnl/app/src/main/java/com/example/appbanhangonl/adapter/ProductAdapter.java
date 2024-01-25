package com.example.appbanhangonl.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.FloatRange;
import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.bumptech.glide.Glide;
import com.example.appbanhangonl.R;
import com.example.appbanhangonl.model.Product;
import com.example.appbanhangonl.model.ProductModel;

import java.text.DecimalFormat;
import java.util.List;

public class ProductAdapter extends RecyclerView.Adapter<ProductAdapter.MyViewHolder> {

    Context context;
    List<ProductModel> arr;

    public ProductAdapter(Context context, List<ProductModel> arr) {
        this.context = context;
        this.arr = arr;
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View item = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_product_new, parent, false);
        return new MyViewHolder(item);
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {
        ProductModel productModel = arr.get(position);
        holder.textViewName.setText(productModel.getTenSP());
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        holder.textViewPrice.setText("Giá: " +decimalFormat.format(Double.parseDouble(productModel.getGiaSP()))+" VND");
        Glide.with(context).load(productModel.getHinhAnh()).into(holder.imageViewImage);
    }

    @Override
    public int getItemCount() {
        return arr.size();
    }


    public class MyViewHolder extends RecyclerView.ViewHolder {
        TextView textViewPrice, textViewName;
        ImageView imageViewImage;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            textViewPrice = itemView.findViewById(R.id.item_productPrice);
            textViewName = itemView.findViewById(R.id.item_productName);
            imageViewImage = itemView.findViewById(R.id.item_productImage);
        }
    }
}
