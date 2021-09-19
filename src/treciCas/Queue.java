package treciCas;

public class Queue {
    private Node first,last;
    public Queue(){
        first=null;
        last=null;
    }
    public void add(int a){
        Node n=new Node(a);
        if(first==null||last==null){
            first=n;
            last=n;
            return;
        }
        last.next=n;
        last=n;
    }
    public int remove(){
        int value=first.value;
        first=first.next;
        return value;
    }
}
