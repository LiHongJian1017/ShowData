package com.neuedu.controller;

import com.alibaba.fastjson.JSONObject;
import com.neuedu.pojo.One;
import com.neuedu.pojo.Two;
import com.neuedu.pojo.Twoflag;
import com.neuedu.service.weather.IoneService;
import com.neuedu.service.weather.ItwoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.xml.ws.Response;
import java.util.ArrayList;
import java.util.List;

/**
 * Created By HongjianLi
 */
@Controller
public class TwoController {
    @Resource
    ItwoService itwoService;

    @RequestMapping(value = "/getTwo.do",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getTwo(ModelMap map){
        List<Two> two= itwoService.getTwo();
        List<Two> twos =new ArrayList();
        if(two.size()>10){
            for(int i=0;i<10;i++){
                twos.add(two.get(i));
            }
        }
        else{
            twos=two;
        }
        //map.addAttribute("weather", weather);
        return JSONObject.toJSONString(twos);
    }
}
