package drugiCas;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;

public class Main2 {
    public static void main(String[] args) {
//        ArrayList<Integer> list=new ArrayList<>();
//        list.add(2);
//        list.add(3);
//        for(int i=0;i<list.size();i++){
//
//        }
//        Stack<Integer> stek=new Stack<>();
//        stek.push(1);
//        stek.push(4);
//        stek.push(7);
//        stek.peek();
//        stek.isEmpty();
//        Queue<Integer> red=new LinkedList<>();
    }
    public static int f(int n){
        if(n==0)return 1;
        if(n<=2)return n;

        return f(n-1)*n;
    }

}
