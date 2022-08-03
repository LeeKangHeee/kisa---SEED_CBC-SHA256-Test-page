package com.example.test;

import java.io.UnsupportedEncodingException;
import java.util.Base64;

public class testSEEDJava {
    static String charset = "utf-8";
    static String plainText = "평문입력";

    static Base64.Decoder decoder = Base64.getDecoder();
    public static byte pbUserKey[] = decoder.decode("Seed Key 입력".getBytes());
    public static byte bszIV[] = "Seed IV 입력".getBytes();

    public static void main(String[] args){
        // TODO Auto-generated method stub
        byte[] encryptData = encrypt(plainText);
        decrypt(encryptData);
    }

    public static byte[] encrypt(String str){
        byte[] enc =null;

        try {
            //암호화 함수 호출
            enc = KISA_SEED_CBC.SEED_CBC_Encrypt(pbUserKey, bszIV, str.getBytes(charset), 0, str.getBytes(charset).length);
        }catch (UnsupportedEncodingException e){
            e.printStackTrace();
        }

        Base64.Encoder encoder = Base64.getEncoder();
        byte[] encArray = encoder.encode(enc);
        try{
            System.out.println("***************************************");
            System.out.println("******* java KISA_SEED_CBC TEST *******");
            System.out.println("");
            System.out.println("평문 : " + plainText);
            System.out.println("암호화 결과 : " + new String(encArray, "utf-8"));
        }catch (UnsupportedEncodingException e){
            e.printStackTrace();
        }
        return encArray;
    }

    public static String decrypt(byte[] str){

        Base64.Decoder decoder = Base64.getDecoder();
        byte[] enc = decoder.decode(str);

        String result = "";
        byte[] dec = null;

        try {
            //복호화 함수 호출
            dec = KISA_SEED_CBC.SEED_CBC_Decrypt(pbUserKey, bszIV, enc, 0, enc.length);
            result = new String(dec, charset);
        }catch (UnsupportedEncodingException e){
            e.printStackTrace();
        }

        System.out.println("복호화 결과 : " + result);
        System.out.println("");
        System.out.println("***************************************");
        System.out.println("***************************************");
        return result;


    }



}
