package com.zyc.api.util;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.executor.BatchResult;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
@Slf4j
public class MyBatisTools {
    private static ConcurrentHashMap<String, SqlSessionFactory> factoryMap = new MyConcurrentHashMap();

    private static MyBatisTools myBatisTools;

    private MyBatisTools() {}

    public static MyBatisTools getInstance() {
        if(myBatisTools == null) {
            synchronized (MyBatisTools.class) {
                if(myBatisTools == null) {
                    myBatisTools = new MyBatisTools();
                }
            }
        }
        log.debug("当前一共有: " + factoryMap.size() +"个SqlSessionFactory实例");
        log.debug("他们分别是: " + factoryMap);
        return myBatisTools;
    }

    public SqlSessionFactory getSessionFactory() {
        return getSessionFactory(null);
    }

    public SqlSessionFactory getSessionFactory(String env) {
        try {
            // 1. 读入配置文件
            InputStream in = Resources.getResourceAsStream("mybatis_conf.xml");
            // 2. 构建SqlSessionFactory(用于获取sqlSession)
            SqlSessionFactory sessionFactory = null;
            synchronized (factoryMap) {
                if(factoryMap.containsKey(env)) {
                    return factoryMap.get(env);
                } else {
                    sessionFactory = new SqlSessionFactoryBuilder().build(in, env);
                    factoryMap.put(env, sessionFactory);
                }
            }
            return sessionFactory;
        } catch (Exception e) {
            log.error("初始化SqlSessionFactory失败", e);
            return null;
        }
    }

    public SqlSession openSession() {
        return getSessionFactory(null).openSession();
    }

    public SqlSession openSession(boolean autoCommit) {
        return getSessionFactory(null).openSession(autoCommit);
    }

    public SqlSession openSession(ExecutorType executorType, boolean autoCommit) {
        return getSessionFactory(null).openSession(executorType, autoCommit);
    }

    public static int flushStatement(SqlSession sqlSession) {
        int effectRows = 0;
        List<BatchResult> batchResults = sqlSession.flushStatements();
        if(batchResults == null || batchResults.size() < 1) {
            return effectRows;
        }
        int[] effectArr = batchResults.get(0).getUpdateCounts();
        for(int effectRow : effectArr) {
            effectRows += effectRow;
        }
        return effectRows;
    }

}

/**
 * 继承原生ConcurrentHashMap，处理null key问题
 */
class MyConcurrentHashMap extends ConcurrentHashMap {
    @Override
    public Object put(Object key, Object value) {
        if(key == null) {
            key = "null";
        }
        return super.put(key, value);
    }

    @Override
    public boolean containsKey(Object key) {
        if(key == null) {
            key = "null";
        }
        return super.containsKey(key);
    }

    @Override
    public Object get(Object key) {
        if(key == null) {
            key = "null";
        }
        return super.get(key);
    }
}
