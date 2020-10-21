package com.zyc.api;

import org.mybatis.spring.annotation.MapperScan;
import org.mybatis.spring.annotation.MapperScans;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan(basePackages = {"com.zyc.api.mapper"})
@SpringBootApplication
public class DingbangkingApplication {

    public static void main(String[] args) {
        SpringApplication.run(DingbangkingApplication.class, args);
    }

}
