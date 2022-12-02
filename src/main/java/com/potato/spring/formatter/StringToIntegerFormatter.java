package com.potato.spring.formatter;

import org.springframework.format.Formatter;

import java.text.ParseException;
import java.time.LocalDate;
import java.util.Locale;

public class StringToIntegerFormatter implements Formatter<Integer> {
    @Override
    public Integer parse(String text, Locale locale) throws ParseException {
        return Integer.parseInt(text);
    }

    @Override
    public String print(Integer object, Locale locale) {
        return null;
    }
}
