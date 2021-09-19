package treciCas;

public class Main {
    public static void main(String[] args) {

       Queue red=new Queue();
       red.add(2);
       red.add(3);
       red.add(4);
       System.out.println(red.remove());
       System.out.println(red.remove());
       System.out.println(red.remove());
    }
}
