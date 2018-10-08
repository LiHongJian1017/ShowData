package com.neuedu.controller;

import com.alibaba.fastjson.JSONObject;
import com.neuedu.pojo.Three;
import com.neuedu.pojo.Two;
import com.neuedu.service.weather.IthreeService;
import com.neuedu.service.weather.ItwoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created By HongjianLi
 */
@Controller
public class ThreeController {
    @Resource
    IthreeService ithreeService;

    @RequestMapping(value = "/getThree.do",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getThree(ModelMap map){
        List<Three> three= ithreeService.getThree();
        List<Three> threes =new ArrayList();
        if(three.size()>10){
            for(int i=0;i<10;i++){
                threes.add(three.get(i));
            }
        }
        else{
            threes=three;
        }
        //map.addAttribute("weather", weather);
        return JSONObject.toJSONString(threes);
    }
}
