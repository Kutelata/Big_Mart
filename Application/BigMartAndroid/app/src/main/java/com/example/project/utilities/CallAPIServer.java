package com.example.project.utilities;

public class CallAPIServer {
    private static final String HOSTING = "http://38.242.236.227:999/";
    private static final String HOSTING_IMAGE = "http://10.0.2.2/Big_Mart/Application/BigMartImage/";
    private static final String API = "";

    public static String prepareImageLink(String table, String imageName) {
        return HOSTING_IMAGE + table + "/" + imageName;
    }

    public static String prepareAPI(String pathFunction) {
        return HOSTING + API + pathFunction;
    }
}
