package com.neuedu.pojo;

import java.io.Serializable;

/**
 * Created By HongjianLi
 */

public class Two implements Serializable {

    private Integer num;

    private String type;

    private String id;

    private Integer cishu;

    private String city;

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getCishu() {
        return cishu;
    }

    public void setCishu(Integer cishu) {
        this.cishu = cishu;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Two() {
    }

    public Two(Integer num, String type, String id, Integer cishu, String city) {
        this.num = num;
        this.type = type;
        this.id = id;
        this.cishu = cishu;
        this.city = city;
    }

    @Override
    public String toString() {
        return "Two{" +
                "num=" + num +
                ", type='" + type + '\'' +
                ", id='" + id + '\'' +
                ", cishu=" + cishu +
                ", city='" + city + '\'' +
                '}';
    }
}
