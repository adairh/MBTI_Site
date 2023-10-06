package me.sjihh.mbti.MBTI;

public enum MBTIType {
    I("I"),
    E("E"),
    S("S"),
    N("N"),
    T("T"),
    F("F"),
    J("J"),
    P("P");


    String s;
    MBTIType(String s) {
        this.s = s;
    }

    public String getValue() {
        return s;
    }
}
