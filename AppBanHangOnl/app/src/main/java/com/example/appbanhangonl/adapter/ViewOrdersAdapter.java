package com.example.appbanhangonl.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.appbanhangonl.R;
import com.example.appbanhangonl.model.OrdersModel;
import com.example.appbanhangonl.model.ViewOrders;
import com.example.appbanhangonl.model.ViewOrdersModel;

import java.util.List;

public class ViewOrdersAdapter extends RecyclerView.Adapter<ViewOrdersAdapter.MyViewHolder> {
    private RecyclerView.RecycledViewPool viewPool = new RecyclerView.RecycledViewPool();
    Context context;
    List<OrdersModel> list;

    public ViewOrdersAdapter(Context context, List<OrdersModel> list) {
        this.context = context;
        this.list = list;
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_vieworders, parent, false);
        return new MyViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {
        OrdersModel ordersModel = list.get(position);
        holder.textViewOrders.setText("Đơn hàng: " + ordersModel.getId());
        LinearLayoutManager layoutManager = new LinearLayoutManager(
                holder.recyclerViewDetails.getContext(),
                LinearLayoutManager.VERTICAL,
                false
        );
        layoutManager.setInitialPrefetchItemCount(ordersModel.getItem().size());
        // adapter chitiet
        ViewOrdersDetailsAdapter viewOrdersDetailsAdapter = new ViewOrdersDetailsAdapter(context, ordersModel.getItem());
        holder.recyclerViewDetails.setLayoutManager(layoutManager);
        holder.recyclerViewDetails.setAdapter(viewOrdersDetailsAdapter);
        holder.recyclerViewDetails.setRecycledViewPool(viewPool);
    }

    @Override
    public int getItemCount() {
        return list.size();
    }

    public class MyViewHolder extends RecyclerView.ViewHolder {
        TextView textViewOrders;
        RecyclerView recyclerViewDetails;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            textViewOrders = itemView.findViewById(R.id.idvieworders);
            recyclerViewDetails = itemView.findViewById(R.id.recyclerView_details);
        }
    }
}
