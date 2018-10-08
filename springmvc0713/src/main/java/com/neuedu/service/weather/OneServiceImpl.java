package com.neuedu.service.weather;

import com.cyfonly.flogger.FLogger;
import com.cyfonly.flogger.constants.Constant;
import com.neuedu.dao.OneDao;
import com.neuedu.pojo.One;

import org.springframework.stereotype.Service;


import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;
/**
 * Created By HongjianLi
 */
@Service
public class OneServiceImpl implements IoneService {
    @Resource
    OneDao oneDao;

    public List<One> getOnesvideo() {
        return oneDao.getOnesvideo();
    }

    public List<One> getOnesarticle() {
        return oneDao.getOnesarticle();
    }

    public One getTest(Integer num) {
        return oneDao.getTest(num);
    }
    public void saveTest(One one) throws IOException {
        //获取单例
        FLogger logger = FLogger.getInstance();
//简便api,只需指定内容
       // logger.info("Here is your message...");
//指定日志级别和内容，文件名自动映射
       // logger.writeLog(Constant.WARN, "Here is your customized level message...");
//指定日志输出文件名、日志级别和内容
        logger.writeLog("error", Constant.ERROR, "Here is your customized log file and level message...");
//        String resource = "mybatis-conf.xml";
       // System.out.println(" 11111111111111111111111111111111111"+resource.getBytes());
//        InputStream inputStream = Resources.getResourceAsStream(resource);
////手动创建XMLConfigBuilder，并解析创建Configuration对象
//        XMLConfigBuilder parser = new XMLConfigBuilder(inputStream, null,null);
//        Configuration configuration=parse();
////使用Configuration对象创建SqlSessionFactory
//        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(configuration);


//        InputStream inputStream = Resources.getResourceAsStream(resource);
//        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
//        SqlSession sqlSession = sqlSessionFactory.openSession();
//
//        String statement = "com.neuedu.dao.OneDao.saveTest";
//        One one1 = new One();
//        one1=one;
////执行插入操作
//        int retResult  = sqlSession.insert(statement, one1);

//        oneDao = sqlSession.getMapper(OneDao.class);
        oneDao.saveTest(one);
//        sqlSession.commit();
//        sqlSession.close();
    }
}
