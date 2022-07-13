package com.example.project.services;

import android.content.Context;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;
import com.example.project.entities.Payment;
import com.example.project.entities.Shipment;
import com.example.project.services.interfaces.IShipmentService;
import com.example.project.utilities.CallAPIServer;
import com.example.project.utilities.VolleyResult;
import com.example.project.utilities.VolleySingleton;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.util.List;

public class ShipmentService implements IShipmentService {
    private Context mCtx;
    private String mApi;

    public ShipmentService(Context mCtx) {
        this.mCtx = mCtx;
        mApi = CallAPIServer.prepareAPI("shipments");
    }

    @Override
    public void getAll(VolleyResult<List<Shipment>> callback) {
        Response.Listener listener = response -> {
            String json = response.toString();
            Gson gson = new Gson();
            Type type = new TypeToken<List<Shipment>>() {
            }.getType();
            List<Shipment> shipments = gson.fromJson(json, type);
            callback.onSuccess(shipments);
        };

        Response.ErrorListener errorListener = error -> callback.onSuccess(null);
        StringRequest stringRequest = new StringRequest(Request.Method.GET, mApi, listener, errorListener);
        VolleySingleton.getInstance(mCtx).addToRequestQueue(stringRequest);
    }

    @Override
    public void getById(int id, VolleyResult<Shipment> callback) {

    }

    @Override
    public void insert(Shipment entity, VolleyResult<Shipment> callback) {

    }

    @Override
    public void update(int id, Shipment entity, VolleyResult<Shipment> callback) {

    }

    @Override
    public void delete(int id, VolleyResult<Shipment> callback) {

    }
}
