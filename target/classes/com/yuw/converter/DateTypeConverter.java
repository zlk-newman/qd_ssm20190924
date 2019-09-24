package com.yuw.converter;


import org.springframework.core.convert.converter.Converter;

import java.text.DateFormat;
import java.text.DateFormatSymbols;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/*
自定义类型转换，需要实现spring框架提供的转换器  Converter接口
Converter接口可以指定泛型<被转化的类型，转换的目标类型>

当前转换器表示：将request请求中的String类型 ---> 实体bean中的Date类型
 */
/*
课下作业：如何改进该自定义转换类的convert方法，使其既能处理 yyyy-MM-dd 格式，又能处理 yyyy/MM/dd
 */
public class DateTypeConverter implements Converter<String, Date> {
    // 要转换的目标日期类型的格式

    private static final String STR_DATE = "yyyy-MM-dd";
    private static final String STR_DATETIME = "yyyy-MM-dd HH:mm:ss";
    private static final String STR_TIMESTAMP = "yyyy-MM-dd HH:mm:ss.SSS";

    @Override
    public Date convert(String s) {
        System.out.println("自定义类型转换之前的时间字符串：" + s);
        return toDate(s);
    }


    /**
     * 将字符串转换为对应格式的Date对象
     *
     * @param value 被转换的值
     * @return Date对象
     */
    private Date toDate(String value) {
        // 默认返回值为null【也可以为当前系统时间，有业务确定使用那种默认值】
        Date date = null;
        // 当前转换的字符串对象不为空，且不为null
        if (value != null && !"".equals(value)) {
            // 剔除空格
            String strDateValue = value.trim();
            // 进行类型转换的格式串
            String strFormat = STR_DATE;
            // 处理格式： "yyyy-MM-dd";
            if (strDateValue.length() <= 10) {
            } else if (strDateValue.length() <= 19) {
                // 处理格式："yyyy-MM-dd HH:mm:ss";
                strFormat = STR_DATETIME;
            } else if (strDateValue.length() <= 23) {
                // 处理格式："yyyy-MM-dd HH:mm:ss.SSS"
                strFormat = STR_TIMESTAMP;
            }

            try {
                // 使用simpledataformat进行转换
                SimpleDateFormat sdf = new SimpleDateFormat(strFormat);
                date = sdf.parse(strDateValue);
            } catch (ParseException e) {
                System.out.println("数据类型转换错误：" + e.getMessage());
            }
        }
        return date;
    }


//    public static void main(String[] args) {
//        // 给定一个日期字符串
//        String strFormat = "2019/09/18 12:3:10.232";
//        System.out.println("转换之后的日期类型为：" + toDate(strFormat));
//    }

}
