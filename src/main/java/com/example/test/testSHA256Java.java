package com.example.test;

public class testSHA256Java {

    public static void main(String[] args){
        // TODO Auto-generated method stub
        String plaintext ="corpNo=0010&mertNo=0000-00001&corpMemberNo=Ex4raYn57r453m4S94RYfg==&introYn=N&regUiType=R1&selPayUiType=S1&userNm=%ED%99%8D%EA%B8%B8%EB%8F%99&hCorp=SKT&email=test@nevercom&addrMain=%EC%84%9C%EC%9A%B8%EC%8B%9C%20%EB%85%B8%EC%9B%90%EA%B5%AC%20%EB%8F%99%EC%9D%BC%EB%A1%9C%20228%EA%B8%B892&addrDet=1000%EB%8F%99306%ED%98%B8&returnUrl=https%3A%2F%2Fwww.starplatform.com%2Fsample%2Fresult&hashKey=F3149950A7B6289723F325833F588DA5";
        encrypt(plaintext);
    }


    public static String encrypt(String plainText){
        byte[] bytes = plainText.getBytes();
        byte[] pszDigest = "F3149950A7B6289723F325833F588DA5".getBytes(); //hash Key
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
