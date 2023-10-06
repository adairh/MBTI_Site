package me.sjihh.mbti.MBTI;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class MBTIData {
    private List<String> IE = new ArrayList<String>();
    private List<String> SN = new ArrayList<String>();
    private List<String> TF = new ArrayList<String>();
    private List<String> JP = new ArrayList<String>();

    private double I = 0;
    private double E = 0;
    private double S = 0;
    private double N = 0;
    private double T = 0;
    private double F = 0;
    private double J = 0;
    private double P = 0;

    public MBTIData(HashMap<Integer, List<String>> data) {
        IE = data.get(1);
        SN = data.get(2);
        TF = data.get(3);
        JP = data.get(4);
        I = get(MBTIType.I);
        E = get(MBTIType.E);
        S = get(MBTIType.S);
        N = get(MBTIType.N);
        T = get(MBTIType.T);
        F = get(MBTIType.F);
        J = get(MBTIType.J);
        P = get(MBTIType.P);
    }

    public MBTIData(double i, double e, double s, double n,
                    double t, double f, double j, double p) {
        this.I = i;
        this.E = e;
        this.S = s;
        this.N = n;
        this.T = t;
        this.F = f;
        this.J = j;
        this.P = p;
    }

    public List<String> getIE() {
        return IE;
    }

    public List<String> getSN() {
        return SN;
    }

    public List<String> getTF() {
        return TF;
    }

    public List<String> getJP() {
        return JP;
    }

    public double get(MBTIType mbti) {
        float count = 0;
        List<String> compare = new ArrayList<String>();
        switch (mbti) {
            case I:
            case E:
                compare = IE;
                break;
            case S:
            case N:
                compare = SN;
                break;
            case T:
            case F:
                compare = TF;
                break;
            case J:
            case P:
                compare = JP;
                break;
        }
        for (String s : compare) {
            if (s.equals(mbti.getValue())) {
                count += 1;
            }
        }
        return count == 0 ? -1 : (count/compare.size())*100;
    }

    public double getI() {
        return I;
    }

    public double getE() {
        return E;
    }

    public double getS() {
        return S;
    }

    public double getN() {
        return N;
    }

    public double getF() {
        return F;
    }

    public double getT() {
        return T;
    }

    public double getJ() {
        return J;
    }

    public double getP() {
        return P;
    }

    public void setI(double i) {
        I = i;
    }

    public void setE(double e) {
        E = e;
    }

    public void setS(double s) {
        S = s;
    }

    public void setN(double n) {
        N = n;
    }

    public void setF(double f) {
        F = f;
    }

    public void setT(double t) {
        T = t;
    }

    public void setJ(double j) {
        J = j;
    }

    public void setP(double p) {
        P = p;
    }

    @Override
    public String toString() {
        return "MBTIData{" +
                "IE=" + IE +
                ", SN=" + SN +
                ", TF=" + TF +
                ", JP=" + JP +
                '}';
    }

    public String result() {
        System.out.println(getI() + " " + getS() + " " + getT() + " " + getJ());
        System.out.println(getE() + " " + getN() + " " + getF() + " " + getP());
        return (getI() > getE() ? "I" : "E") +
                (getS() > getN() ? "S" : "N") +
                (getT() > getF() ? "T" : "F") +
                (getJ() > getP() ? "J" : "P");
    }
}
