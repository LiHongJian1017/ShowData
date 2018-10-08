package com.neuedu.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * Created By HongjianLi
 */
@Data
public class One  {

    private Integer num;

    private String type;

    private String id;
    private Integer cishu;

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

    public One(Integer num, String type, String id, Integer cishu) {
        this.num = num;
        this.type = type;
        this.id = id;
        this.cishu = cishu;
    }

    public One() {

    }

}
