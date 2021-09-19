package prviCas;


import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scan=new Scanner(System.in);

        float a=scan.nextFloat();
        Lopta l=new Lopta("red",a);
        System.out.println(a);
//        povecajBroj(a);
        System.out.println(a);
//        System.out.println(l.izracunajPovrsinu());
//        System.out.println(Lopta.izracunajZapreminu(1));
    }
    public  void povecajPrecnik(Lopta l){
        l.precnik++;
    }
    public void povecajBroj(float a){
        a++;
    }
}
