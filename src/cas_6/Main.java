package cas_6;

import java.util.Random;

public class Main {
    public static void main(String[] args) {
        Tree t=new Tree();

        int[] niz=new int[100];

        Random r=new Random();

        for(int i=0;i<niz.length;i++){
            niz[i]=i;
        }

        for(int i=0;i<niz.length;i++){
            int j=Math.abs(r.nextInt()%niz.length);

            int p=niz[i];
            niz[i]=niz[j];
            niz[j]=p;
        }
        for(int i=0;i<niz.length;i++){
            t.add(niz[i]);
        }

        t.print();
        System.out.println();
        t.printHeights();
    }
}
