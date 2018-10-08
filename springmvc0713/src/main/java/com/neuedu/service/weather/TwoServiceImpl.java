package com.neuedu.service.weather;

import com.neuedu.dao.OneDao;
import com.neuedu.dao.TwoDao;
import com.neuedu.pojo.One;
import com.neuedu.pojo.Two;
import com.neuedu.pojo.Twoflag;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created By HongjianLi
 */
@Service
public class TwoServiceImpl implements ItwoService {
    @Resource
    TwoDao twoDao;
    public List<Two> getTwo(){
        return twoDao.getTwo();
    }

}
