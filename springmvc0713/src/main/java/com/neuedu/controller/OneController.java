package com.neuedu.controller;

import com.alibaba.fastjson.JSONObject;
import com.neuedu.pojo.One;
import com.neuedu.pojo.Weather;
import com.neuedu.service.weather.IoneService;
import com.neuedu.service.weather.IweatherService;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.session.defaults.DefaultSqlSessionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created By HongjianLi
 */
@Controller
public class OneController {
    @Resource
    IoneService ioneService;


    @RequestMapping("/getOnevideo.do")
    @ResponseBody
    public String getOnevideo(ModelMap map){
        List<One> one= ioneService.getOnesvideo();
        List<One> ones =new ArrayList();
        if(one.size()>10){
            for(int i=0;i<10;i++){
                ones.add(one.get(i));
            }
        }
        else{
            ones=one;
        }
        //map.addAttribute("weather", weather);
        return JSONObject.toJSONString(ones);
    }

    @RequestMapping("/getOnearticle.do")
    @ResponseBody
    public String getOnearticle(ModelMap map){
        List<One> one= ioneService.getOnesarticle();
        List<One> ones =new ArrayList();
        if(one.size()>10){
            for(int i=0;i<10;i++){
                ones.add(one.get(i));
            }
        }
        else{
            ones=one;
        }
        //map.addAttribute("weather", weather);
        return JSONObject.toJSONString(ones);
    }

    @RequestMapping("/getTest.do")
    @ResponseBody
    public String getTest(ModelMap map){
        One one= ioneService.getTest(5972);
        return JSONObject.toJSONString(one);
    }

    @RequestMapping("/saveTest.do")
    @ResponseBody
    public String saveTest(@RequestParam("type") String type,
                           @RequestParam("id") String id,
                           @RequestParam("cishu") Integer cishu,
                           HttpServletRequest request, ModelMap map) throws IOException {
//        String resource = "mybatis-config.xml";
//        InputStream inputStream = Resources.getResourceAsStream(resource);
//        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
//        SqlSession sqlSession = sqlSessionFactory.openSession();
        System.out.println("1111111111111111111111111111111111111111111111111111111:"+type);
        System.out.println("1111111111111111111111111111111111111111111111111111111:"+id);
        System.out.println("1111111111111111111111111111111111111111111111111111111:"+cishu);
        One one = new One();
        one.setType(type);
        one.setId(id);
        one.setCishu(cishu);
        ioneService.saveTest(one);
        return "add";
    }
}
