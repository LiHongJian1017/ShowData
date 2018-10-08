package com.neuedu.service.weather;

import com.neuedu.dao.ThreeDao;
import com.neuedu.dao.TwoDao;
import com.neuedu.pojo.Three;
import com.neuedu.pojo.Two;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created By HongjianLi
 */
@Service
public class ThreeServiceImpl implements IthreeService {
    @Resource
    ThreeDao threeDao;

    public List<Three> getThree(){
        return threeDao.getThree();
    }

}
