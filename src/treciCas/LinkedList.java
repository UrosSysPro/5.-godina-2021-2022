package treciCas;

public class LinkedList {
    private Node root;

    public LinkedList(){
        root=null;
        root=new Node(2);
        Node n=root;
    }

    public void addFirst(int value){
        Node n=new Node(value);
        n.next=root;
        root=n;
    }
    public void removeFirst(){
        if(root!=null)root=root.next;
    }
    public void addLast(int value){
        Node n=new Node(value);
        root=addLastR(root,n);
    }
    private Node addLastR(Node root,Node n){
        if(root==null)return n;
        root.next=addLastR(root.next,n);
        return root;
    }
    public void removeLast(){
        root=removeLastR(root);
    }
    private Node removeLastR(Node root){
        if(root==null)return null;
        if(root.next==null)return null;
        root.next=removeLastR(root.next);
        return root;
    }
    public void print(){
        printR(root);
    }
    private void printR(Node root){
        if(root!=null)return;

        System.out.println(root.value);
        printR(root.next);
    }
    public int size(){
        return sizeR(root);
    }
    private int sizeR(Node n){
        if(n==null)return 0;
        return 1+sizeR(n.next);
    }

}
