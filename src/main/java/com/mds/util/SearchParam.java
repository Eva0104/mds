package com.mds.util;


import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

public class SearchParam {

    private String type;
    private String property;
    private Object value;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getProperty() {
        return property;
    }

    public void setPorperty(String porperty) {
        this.property = porperty;
    }

    public Object getValue() {
        return value;
    }

    public void setValue(Object value) {
        this.value = value;
    }

    public static List<SearchParam> getSearchParam(HttpServletRequest request){

        List<SearchParam> searchParams = new ArrayList<>();

        Enumeration<String> enumeration = request.getParameterNames();
        while(enumeration.hasMoreElements()){
            String queryString = enumeration.nextElement();
            Object value = request.getParameter(queryString);

            if(queryString.startsWith("q_") && !StringUtils.isEmpty(value)){
                String[] strings = queryString.split("_",4);
                if(strings.length != 4){
                    throw new RuntimeException("地址栏查询条件格式有误"+queryString);
                }
                String valueType = strings[1];
                String type=strings[2];
                String property = strings[3];

                value = converterType(value,valueType);

                SearchParam searchParam = new SearchParam();
                searchParam.setType(type);
                searchParam.setPorperty(property);
                searchParam.setValue(value);
                searchParams.add(searchParam);

                request.setAttribute(queryString,value);
            }
        }
        return searchParams;

    }

    private static Object converterType(Object value, String valueType) {

        if("s".equalsIgnoreCase(valueType)){
            return Strings.toUTF8(value.toString());
        }else if("i".equalsIgnoreCase(valueType)){
            return Integer.valueOf(value.toString());
        }else if("f".equalsIgnoreCase(valueType)){
            return Float.valueOf(value.toString());
        }else if("d".equalsIgnoreCase(valueType)){
            return Double.valueOf(value.toString());
        }else if("b".equalsIgnoreCase(valueType)){
            return Boolean.valueOf(value.toString());
        }
        return null;
    }
}
