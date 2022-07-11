package com.example.project.utilities;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Random;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

public class CipherUtil {
    public static SecretKey generateKey() {
        byte[] randomSecretKey = new byte[16];
        SecureRandom secureRandom = new SecureRandom();
        secureRandom.nextBytes(randomSecretKey);
        return new SecretKeySpec(randomSecretKey, "AES");
    }

    public static byte[] encrypt(String encryptString, SecretKey secret)
            throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, UnsupportedEncodingException, IllegalBlockSizeException, BadPaddingException {
        Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
        cipher.init(Cipher.ENCRYPT_MODE, secret);
        byte[] cipherText = cipher.doFinal(encryptString.getBytes(StandardCharsets.UTF_8));
        return cipherText;
    }

    public static String decrypt(byte[] cipherText, SecretKey secret)
            throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException, UnsupportedEncodingException {
        Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
        cipher.init(Cipher.DECRYPT_MODE, secret);
        String decryptString = new String(cipher.doFinal(cipherText), StandardCharsets.UTF_8);
        return decryptString;
    }
}
