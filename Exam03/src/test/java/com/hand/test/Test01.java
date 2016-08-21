package com.hand.test;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hand.dao.FilmMapper;
import com.hand.domain.Film;

@RunWith(SpringJUnit4ClassRunner.class)		//表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class Test01 {
	private static Logger logger = Logger.getLogger(Test01.class);
	
	  @Resource
	  private FilmMapper filmMapper = null;
	  
	  @Test
		public void test1() {
			Film film=filmMapper.selectByPrimaryKey((short) 1);
			logger.info(film.getDescription());
		}


}
