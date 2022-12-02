package com.potato.nedonado.util;

import javax.servlet.http.Cookie;
import java.sql.Timestamp;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.TimeZone;

public class Util {

    public static Cookie findCookie(Cookie[] cookies, String key) {
        if(cookies == null || cookies.length == 0) return null;

        Cookie cookie = null;

        for(Cookie c : cookies) {
            if(c.getName().equals(key)) {
                cookie = c;
                break;
            }
        }

        return cookie;
    }

    public static long getCurrentTimestamp() {
        return System.currentTimeMillis();
    }

    public static String convertLongTimestampToString(long timestamp) {
        LocalDateTime localDate = LocalDateTime.ofInstant(Instant.ofEpochSecond(timestamp/1000),
                TimeZone.getDefault().toZoneId());
        return DateTimeFormatter.ofPattern("YYYY-MM-dd hh:mm:ss").format(localDate);
    }
}
