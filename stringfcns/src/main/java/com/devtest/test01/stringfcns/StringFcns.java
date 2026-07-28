package com.devtest.test01.stringfcns;

public class StringFcns {
    public static String reverse(String s) {
        return new StringBuilder(s).reverse().toString();
    }
}
