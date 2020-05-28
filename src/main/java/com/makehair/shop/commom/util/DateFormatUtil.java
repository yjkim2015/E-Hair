package com.makehair.shop.commom.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 시간 포맷
 */
public class DateFormatUtil {

    // 금일 -> 디폴트
    public static String getNowTime() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date time = new Date();
        return format.format(time);
    }

    // 일별 검색
    public static Map<String, Object> getStartEndTime(String readType, String date) {

        String startTime = date + " 00:00:00";
        String endTime = date + " 23:59:59";

        if(readType.equals("salesMonth")) {
            startTime = date + "-01 00:00:00";
            endTime = date + "-31 23:59:59";
        }

        Map<String, Object> map = new HashMap<>();
        map.put("startTime", (Object)startTime);
        map.put("endTime", (Object)endTime);

        return map;
    }
}