package com.example.project.utilities;

public class CallAPIServer {
//    private static final String HOSTING = "http://10.0.2.2:2619/";
    private static final String HOSTING = "https://reactnative.dev/movies.json";
    private static final String API = "";

    public static String prepareImageLink(String imageName) {
        return HOSTING + "/upload/avatar_" + imageName + ".png";
    }

    public static String prepareAPI(String pathFunction) {
        return HOSTING + API + pathFunction;
    }

}
