package com.example.project.services;

import android.content.Context;

import androidx.annotation.Nullable;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;
import com.example.project.entities.Invoice;
import com.example.project.entities.InvoiceDetail;
import com.example.project.services.interfaces.IInvoiceDetailService;
import com.example.project.utilities.CallAPIServer;
import com.example.project.utilities.VolleyResult;
import com.example.project.utilities.VolleySingleton;
import com.google.gson.Gson;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class InvoiceDetailService implements IInvoiceDetailService {
    private Context mCtx;
    private String mApi;

    public InvoiceDetailService(Context mCtx) {
        this.mCtx = mCtx;
        mApi = CallAPIServer.prepareAPI("invoice-detail");
    }

    @Override
    public void getAll(VolleyResult<List<InvoiceDetail>> callback) {

    }

    @Override
    public void getById(int id, VolleyResult<InvoiceDetail> callback) {

    }

    @Override
    public void insert(InvoiceDetail entity, VolleyResult<InvoiceDetail> callback) {
        String newApi = String.format("%s/createInvoiceDetail", mApi);

        Response.Listener listener = response -> {
            String json = response.toString();
            Gson gson = new Gson();
            InvoiceDetail invoiceDetail = gson.fromJson(json, InvoiceDetail.class);
            callback.onSuccess(invoiceDetail);
        };

        Response.ErrorListener errorListener = error -> callback.onSuccess(null);

        StringRequest stringRequest = new StringRequest(Request.Method.POST, newApi, listener, errorListener) {
            @Nullable
            @Override
            protected Map<String, String> getParams() {
                Map<String, String> params = new HashMap<>();
                params.put("invoice_id", entity.getInvoiceId().toString());
                params.put("product_id", entity.getProductId().toString());
                params.put("quantity", entity.getQuantity().toString());
                params.put("row_total", entity.getRowTotal().toString());
                return params;
            }
        };

        VolleySingleton.getInstance(mCtx).addToRequestQueue(stringRequest);
    }

    @Override
    public void update(int id, InvoiceDetail entity, VolleyResult<InvoiceDetail> callback) {

    }

    @Override
    public void delete(int id, VolleyResult<InvoiceDetail> callback) {

    }
}
