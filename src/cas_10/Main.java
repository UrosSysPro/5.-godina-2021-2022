package cas_10;

import java.util.Random;

public class Main {

    public static void main(String[] args) {
        Heap h=new Heap(7);
        Random r=new Random();
        for(int i=0;i<100;i++){
            h.add(Math.abs(r.nextInt())%200);
        }
//        h.print();
//        System.out.println();
        for(int i=0;i<100;i++){
            System.out.print(h.remove()+" ");
        }

    }
}
