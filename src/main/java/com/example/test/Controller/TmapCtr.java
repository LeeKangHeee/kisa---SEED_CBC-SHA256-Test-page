package com.example.test.Controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class TmapCtr {

    @GetMapping("/preview2")
    public String home(){
        return "tmapApi";
    }

    @GetMapping("/preview")
    public String homeLine(){
        return "tmapApiLine";
    }


    @GetMapping("/deliveryList")
    public String deliveryList(){
        return "deliveryList";
    }
}
