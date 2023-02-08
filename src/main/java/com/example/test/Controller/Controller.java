package com.example.test.Controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;


@Slf4j
@org.springframework.stereotype.Controller
public class Controller {

    @GetMapping("/")
    public String home(){
        return "home";
    }

    @GetMapping("/enchome")
    public String enchome(){
        return "dec_enc_home";
    }

    @RequestMapping("/cbc")
    public String cbc() throws Exception{
        return "index";
    }

    @RequestMapping("/sha256")
    public String sha256() throws Exception{
        return "SHA256/index";
    }

    @RequestMapping("/EncTest")
    public String urlEncodingTest(){
        return "Encoder";
    }


    @RequestMapping("/EncTest/action")
    public String urlEncodingTest(@RequestParam(value = "plain") String plainText, Model model){
        String encText = "";
        try{
            encText = URLEncoder.encode(plainText, "UTF-8");
        }catch (UnsupportedEncodingException e){
            e.printStackTrace();
        }
        model.addAttribute("enc",encText);
        model.addAttribute("plain",plainText);
        return "Encoder";
    }

    @RequestMapping("/DecTest")
    public String urlDecodingTest(){
        return "Decoder";
    }


    @GetMapping("/DecTest/action")
    public String urlDecodingTest(@RequestParam(value = "enc") String encText, Model model){
        String plainText = "";
        try{
            plainText = URLDecoder.decode(encText, "UTF-8");
        }catch (UnsupportedEncodingException e){
            e.printStackTrace();
        }
        model.addAttribute("enc",encText);
        model.addAttribute("plain",plainText);
        return "Decoder";
    }








}
