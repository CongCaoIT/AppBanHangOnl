package com.example.appbanhangonl.activity;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import android.graphics.Color;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import com.example.appbanhangonl.R;
import com.example.appbanhangonl.retrofit.ApiBanHang;
import com.example.appbanhangonl.retrofit.RetrofitClient;
import com.example.appbanhangonl.utils.Utils;
import com.github.mikephil.charting.charts.BarChart;
import com.github.mikephil.charting.charts.PieChart;
import com.github.mikephil.charting.components.XAxis;
import com.github.mikephil.charting.components.YAxis;
import com.github.mikephil.charting.data.BarData;
import com.github.mikephil.charting.data.BarDataSet;
import com.github.mikephil.charting.data.BarEntry;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.data.PieData;
import com.github.mikephil.charting.data.PieDataSet;
import com.github.mikephil.charting.data.PieEntry;
import com.github.mikephil.charting.formatter.PercentFormatter;
import com.github.mikephil.charting.highlight.Highlight;
import com.github.mikephil.charting.listener.OnChartValueSelectedListener;
import com.github.mikephil.charting.utils.ColorTemplate;
import com.google.android.material.bottomsheet.BottomSheetDialog;

import java.util.ArrayList;
import java.util.List;

import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.schedulers.Schedulers;

public class ThongKeActivity extends AppCompatActivity {

    Toolbar toolbar;
    PieChart pieChart;
    BarChart barChart;
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    ApiBanHang apiBanHang;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_thong_ke);

        apiBanHang = RetrofitClient.getInstance(Utils.BASE_URL).create(ApiBanHang.class);
        initview();
        ActionToolBar();
        getdataChart();
        settingBarchart();
    }

    private void settingBarchart() {
        barChart.getDescription().setEnabled(false);
        barChart.setDrawValueAboveBar(false);
        XAxis xAxis = barChart.getXAxis();
        xAxis.setAxisMinimum(1);
        xAxis.setAxisMaximum(12);
        YAxis yAxisRight = barChart.getAxisRight();
        yAxisRight.setAxisMinimum(0);
        YAxis yAxisLeft = barChart.getAxisLeft();
        yAxisLeft.setAxisMinimum(0);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu_thongke, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        int id = item.getItemId();
        if (id == R.id.tkthang) {
            getTkThang();
            return true;
        } else {
            return super.onOptionsItemSelected(item);
        }
    }

    private void getTkThang() {
        barChart.setVisibility(View.VISIBLE);
        pieChart.setVisibility(View.GONE);
        compositeDisposable.add(apiBanHang.getthongkeThang()
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(
                        thongKeModel -> {
                            List<BarEntry> listdata = new ArrayList<>();
                            for (int i = 0; i < thongKeModel.getResult().size(); i++) {
                                String tongtien = String.valueOf(thongKeModel.getResult().get(i).getTong());
                                String thang = thongKeModel.getResult().get(i).getTongtienthang();
                                listdata.add(new BarEntry(Integer.parseInt(thang), Float.parseFloat(tongtien)));
                            }
                            BarDataSet barDataSet = new BarDataSet(listdata, "Thống kê");
                            barDataSet.setColors(ColorTemplate.MATERIAL_COLORS);
                            barDataSet.setValueTextSize(14f);
                            barDataSet.setValueTextColor(Color.RED);

                            BarData data = new BarData((barDataSet));
                            barChart.animateXY(2000, 2000);
                            barChart.setData(data);
                            barChart.invalidate();

                        },
                        throwable -> {
                            Log.d("logg", throwable.getMessage());
                        }
                )
        );
    }

    // Trong phương thức getdataChart()
    private void getdataChart() {
        List<PieEntry> listdata = new ArrayList<>();
        List<String> productNames = new ArrayList<>(); // Danh sách tên sản phẩm
        compositeDisposable.add(apiBanHang.getthongke()
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(
                        thongKeModel -> {
                            if (thongKeModel.isSucces()) {
                                int total = 0;
                                for (int i = 0; i < thongKeModel.getResult().size(); i++) {
                                    int tong = thongKeModel.getResult().get(i).getTong();
                                    total += tong;
                                    String tenSP = thongKeModel.getResult().get(i).getTenSP();
                                    productNames.add(tenSP); // Thêm tên sản phẩm vào danh sách
                                    listdata.add(new PieEntry(tong));
                                }
                                PieDataSet pieDataSet = new PieDataSet(listdata, "");
                                PieData data = new PieData();
                                data.setDataSet(pieDataSet);
                                data.setValueTextSize(12f);
                                data.setValueFormatter(new PercentFormatter(pieChart));
                                pieDataSet.setColors(ColorTemplate.MATERIAL_COLORS);

                                pieChart.setData(data);
                                pieChart.animateXY(2000, 2000);
                                pieChart.setUsePercentValues(true);
                                pieChart.getDescription().setEnabled(false);
                                pieChart.invalidate();

                                final float finalTotal = total;
                                pieChart.setOnChartValueSelectedListener(new OnChartValueSelectedListener() {
                                    @Override
                                    public void onValueSelected(Entry e, Highlight h) {
                                        PieEntry selectedEntry = (PieEntry) e;
                                        int selectedValue = (int)selectedEntry.getValue();
                                        float percentage = (selectedValue / finalTotal) * 100;

                                        // Lấy vị trí của giá trị đã chọn
                                        int selectedIndex = listdata.indexOf(selectedEntry);
                                        String productName = productNames.get(selectedIndex); // Lấy tên sản phẩm tương ứng

                                        showDetailInfo(productName, selectedValue, percentage);
                                    }

                                    @Override
                                    public void onNothingSelected() {

                                    }
                                });
                            }
                        },
                        throwable -> {
                            Log.d("logg", throwable.getMessage());
                        }
                ));
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

    private void initview() {
        toolbar = findViewById(R.id.toolbar);
        pieChart = findViewById(R.id.piechart);
        barChart = findViewById(R.id.barchart);
    }

    private void showDetailInfo(String productName, int selectedValue, float percentage) {
        BottomSheetDialog bottomSheetDialog = new BottomSheetDialog(ThongKeActivity.this);
        bottomSheetDialog.setContentView(R.layout.layout_detail_info);

        TextView txtProductName = bottomSheetDialog.findViewById(R.id.txt_product_name);
        TextView txtSelectedValue = bottomSheetDialog.findViewById(R.id.txt_selected_value);
        TextView txtPercentage = bottomSheetDialog.findViewById(R.id.txt_percentage);

        txtProductName.setText(productName);
        txtSelectedValue.setText("Tổng số lượng bán ra: " + selectedValue + " chiếc");
        txtPercentage.setText("Phần trăm: " + percentage + "%");

        bottomSheetDialog.show();
    }
}