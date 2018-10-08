package com.neuedu.service.weather;

import com.neuedu.pojo.One;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

/**
 * Created By HongjianLi
 */
public interface IoneService {
    List<One> getOnesvideo();
    List<One> getOnesarticle();
    One getTest(Integer num);
    void saveTest(One one) throws IOException;
}
