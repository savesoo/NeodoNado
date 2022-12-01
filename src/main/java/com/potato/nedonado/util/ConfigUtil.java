package com.potato.nedonado.util;

import lombok.Cleanup;
import lombok.extern.log4j.Log4j2;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileReader;
import java.util.HashMap;
import java.util.Map;

/**
 * config.json load 클래스.
 */
@Log4j2
public class ConfigUtil {
    private static Map<String, Object> config;

    static {
        config = new HashMap<>();

        JSONParser parser = new JSONParser();

        try {
            FileInputStream file = null;
            BufferedReader br = null;
            ClassLoader loader = ConfigUtil.class.getClassLoader();
            @Cleanup FileReader fr = new FileReader(loader.getResource("config.json").getFile());

            Object obj = parser.parse(fr);
            config = (JSONObject) obj;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private ConfigUtil() {
    }

    public static Object getConfig(String key) {
        return config.get(key);
    }
}
