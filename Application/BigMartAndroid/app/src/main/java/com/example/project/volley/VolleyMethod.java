package com.example.project.volley;

import android.content.Context;

import com.android.volley.RequestQueue;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

public class VolleyMethod {
    private string url = "";
    private Context _mCtx;

    public void loadJSON(){
        RequestQueue requestQueue = Volley.newRequestQueue((_mCtx));
        StringRequest stringRequest = new StringRequest(url, listener);
        requestQueue.add(stringRequest);
    }
}
