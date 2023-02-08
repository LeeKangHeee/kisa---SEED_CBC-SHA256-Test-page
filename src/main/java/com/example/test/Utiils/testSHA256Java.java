package com.example.test.Utiils;

public class testSHA256Java {

    public static void main(String[] args){
        // TODO Auto-generated method stub
        String plaintext ="평문입력";
        encrypt(plaintext);
    }


    public static String encrypt(String plainText){
        byte[] bytes = plainText.getBytes();
        byte[] pszDigest = "hash key 입력".getBytes();
        KISA_SHA256.SHA256_Encrpyt(bytes,bytes.length,pszDigest);
        StringBuffer encrypted = new StringBuffer();
        for(int i=0; i<32; i++){
            encrypted.append(String.format("%02x",pszDigest[i]));
        }
        System.out.println("************ SHA256 암호화 *************");
        System.out.println("");
        System.out.println(encrypted.toString());
        System.out.println("");
        System.out.println("**************************************");
        return encrypted.toString();

    }
}
