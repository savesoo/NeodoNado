package com.potato.spring.formatter;

import org.springframework.format.Formatter;

import java.text.ParseException;
import java.util.Locale;

public class StringToLongFormatter implements Formatter<Long> {
    @Override
    public Long parse(String text, Locale locale) throws ParseException {
        return Long.parseLong(text);
    }

    @Override
    public String print(Long object, Locale locale) {
        return null;
    }
}
