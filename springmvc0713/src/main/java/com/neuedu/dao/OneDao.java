package com.neuedu.dao;

import com.neuedu.pojo.One;

import java.util.List;

/**
 * Created By HongjianLi
 */
public interface OneDao {
    List<One> getOnesvideo();
    List<One> getOnesarticle();
    One getTest(Integer num);
    void saveTest(One one);
}
