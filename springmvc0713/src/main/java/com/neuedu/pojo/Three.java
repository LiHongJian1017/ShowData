package com.neuedu.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * Created By HongjianLi
 */
@Data
public class Three {

    private Integer num;
    private String type;
    private String id;
    private Integer traffic;

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

    public Integer getTraffic() {
        return traffic;
    }

    public void setTraffic(Integer traffic) {
        this.traffic = traffic;
    }

    public Three() {
    }

    public Three(Integer num, String type, String id, Integer traffic) {
        this.num = num;
        this.type = type;
        this.id = id;
        this.traffic = traffic;
    }

    @Override
    public String toString() {
        return "Three{" +
                "num=" + num +
                ", type='" + type + '\'' +
                ", id='" + id + '\'' +
                ", traffic=" + traffic +
                '}';
    }
}
