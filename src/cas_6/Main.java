package cas_6;

public class Main {
    public static void main(String[] args) {
        Tree t=new Tree();
        t.add(5);
        t.add(2);
        t.add(8);
        t.add(1);
        t.add(3);
        t.add(7);
        t.add(9);
        t.add(10);
        t.add(11);
        t.print();
        System.out.println(t.updateHeights());
    }
}
