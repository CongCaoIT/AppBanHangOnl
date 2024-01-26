package com.example.appbanhangonl.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.PointerIcon;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.bumptech.glide.Glide;
import com.example.appbanhangonl.R;
import com.example.appbanhangonl.model.ProductModel;

import java.text.DecimalFormat;
import java.util.List;

public class PhoneAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {
    Context context;
    List<ProductModel> arr;
    private static final int VIEW_TYPE_DATA = 0;
    private static final int VIEW_TYPE_LOADING = 1;

    public PhoneAdapter(Context context, List<ProductModel> arr) {
        this.context = context;
        this.arr = arr;
    }

    @NonNull
    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        if (viewType == VIEW_TYPE_DATA) {
            View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_phone, parent, false);
            return new MyViewHolder(view);
        } else {
            View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_loading, parent, false);
            return new LoadingViewHolder(view);
        }
    }

    @Override
    public void onBindViewHolder(@NonNull RecyclerView.ViewHolder holder, int position) {
        if (holder instanceof MyViewHolder) {
            MyViewHolder myViewHolder = (MyViewHolder) holder;
            ProductModel productModel = arr.get(position);
            myViewHolder.textViewPhoneName.setText(productModel.getTenSP());
            DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
            myViewHolder.textViewPhonePrice.setText("Giá: " + decimalFormat.format(Double.parseDouble(productModel.getGiaSP())) + " VND");
            myViewHolder.textViewPhoneDescribe.setText(productModel.getMoTa());
            Glide.with(context).load(productModel.getHinhAnh()).into(myViewHolder.imageViewPhone);
        } else {
            LoadingViewHolder loadingViewHolder = (LoadingViewHolder) holder;
            loadingViewHolder.progressBar.setIndeterminate(true);
        }
    }

    @Override
    public int getItemViewType(int position) {
        return arr.get(position) == null ? VIEW_TYPE_LOADING : VIEW_TYPE_DATA;
    }

    @Override
    public int getItemCount() {
        return arr.size();
    }

    public class LoadingViewHolder extends RecyclerView.ViewHolder {
        ProgressBar progressBar;

        public LoadingViewHolder(@NonNull View itemView) {
            super(itemView);
            progressBar = itemView.findViewById(R.id.progressbar);
        }
    }

    public class MyViewHolder extends RecyclerView.ViewHolder {
        TextView textViewPhoneName, textViewPhonePrice, textViewPhoneDescribe, textViewid;
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
