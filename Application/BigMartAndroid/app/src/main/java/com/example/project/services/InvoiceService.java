package com.example.project.services;

import android.content.Context;

import androidx.annotation.Nullable;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;
import com.example.project.entities.Customer;
import com.example.project.entities.Invoice;
import com.example.project.services.interfaces.IInvoiceService;
import com.example.project.utilities.CallAPIServer;
import com.example.project.utilities.VolleyResult;
import com.example.project.utilities.VolleySingleton;
import com.google.gson.Gson;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class InvoiceService implements IInvoiceService {
    private Context mCtx;
    private String mApi;

    public InvoiceService(Context mCtx) {
        this.mCtx = mCtx;
        mApi = CallAPIServer.prepareAPI("invoices");
    }

    @Override
    public void getAll(VolleyResult<List<Invoice>> callback) {

    }

    @Override
    public void getById(int id, VolleyResult<Invoice> callback) {

    }

    @Override
    public void insert(Invoice entity, VolleyResult<Invoice> callback) {
        String newApi = String.format("%s/createInvoice", mApi);

        Response.Listener listener = response -> {
            String json = response.toString();
            Gson gson = new Gson();
            Invoice invoice = gson.fromJson(json, Invoice.class);
            callback.onSuccess(invoice);
        };

        Response.ErrorListener errorListener = error -> callback.onSuccess(null);

        StringRequest stringRequest = new StringRequest(Request.Method.POST, newApi, listener, errorListener) {
            @Nullable
            @Override
            protected Map<String, String> getParams() {
                Map<String, String> params = new HashMap<>();
                params.put("shipment_id", entity.getShipmentId().toString());
                params.put("payment_id", entity.getPaymentId().toString());
                params.put("customer_id", entity.getCustomerId().toString());
                params.put("status", entity.getStatus().toString());
                params.put("total", entity.getTotal().toString());
                return params;
            }
        };

        VolleySingleton.getInstance(mCtx).addToRequestQueue(stringRequest);
    }

    @Override
    public void update(int id, Invoice entity, VolleyResult<Invoice> callback) {

    }

    @Override
    public void delete(int id, VolleyResult<Invoice> callback) {

    }
}
