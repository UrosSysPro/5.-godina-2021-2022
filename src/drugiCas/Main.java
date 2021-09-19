package drugiCas;

import java.util.LinkedList;

public class Main {
    public static void main(String[] args) {
//      lista stek red grafovi heap niz

        Mnogougao[] niz=new Mnogougao[2];
        niz[0]=new Trougao(2);
        niz[1]=new Kvadrat(3);

        for(int i=0;i<niz.length;i++){
//            System.out.println(niz[i].izracunajObim());
            niz[i].draw();
        }
    }
}
