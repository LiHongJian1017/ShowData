package com.neuedu.pojo;

/**
 * Created By HongjianLi
 */
public class Twoflag {
    private String city;
    private Integer max;
    private String type;
    private String id;

    public Twoflag(String city, Integer max, String type, String id) {
        this.city = city;
        this.max = max;
        this.type = type;
        this.id = id;
    }

    public Integer getMax() {
        return max;
    }

    public void setMax(Integer max) {
        this.max = max;
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


    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Twoflag() {
    }


}
