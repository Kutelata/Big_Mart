package com.example.project.utilities;

public class CallAPIServer {
    private static final String HOSTING = "http://38.242.236.227:999/";
    private static final String API = "";

    public static String prepareImageLink(String imageName) {
        return HOSTING + "/upload/avatar_" + imageName + ".png";
    }

    public static String prepareAPI(String pathFunction) {
        return HOSTING + API + pathFunction;
    }
}
