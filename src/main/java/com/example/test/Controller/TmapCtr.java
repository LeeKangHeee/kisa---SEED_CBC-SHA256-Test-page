package com.example.test.Controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class TmapCtr {

    @GetMapping("/preview")
    public String home(){
        return "tmapApi";
    }

    @GetMapping("/deliveryList")
    public String deliveryList(){
        return "deliveryList";
    }
}
