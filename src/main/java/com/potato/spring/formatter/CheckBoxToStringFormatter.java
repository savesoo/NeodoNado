package com.potato.spring.formatter;

import org.springframework.format.Formatter;

import java.text.ParseException;
import java.util.Locale;

public class CheckBoxToStringFormatter implements Formatter<Boolean> {

    // 문자열로 받아오는데 그 타입이 Boolean일 때
    @Override
    public Boolean parse(String text, Locale locale) throws ParseException {
        if(text==null){
            return false;
        }
        return text.equals("on");
    }

    // toString 형식(문자열)으로 출력
    @Override
    public String print(Boolean object, Locale locale) {
        return object.toString();
    }
}
