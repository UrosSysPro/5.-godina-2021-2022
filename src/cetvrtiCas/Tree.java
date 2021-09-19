package cetvrtiCas;

public class Tree {

    private Node root;
    public Tree(){
        root=null;
    }

    public void add(int value){
        Node n=new Node(value);
        if(root==null){
            root=n;
            return;
        }
        addR(root,n);
    }
    private void addR(Node root,Node n){
        if(n.value>root.value){
            //desno
            if(root.right==null){
                root.right=n;
            }else{
                addR(root.right,n);
            }
        }else{
            //levo
            if(root.left==null){
                root.left=n;
            }else{
                addR(root.left,n);
            }
        }
    }
    public void print(){
        printR(root);
    }
    private void printR(Node root){
        if(root==null)return;

        printR(root.right);
        System.out.print(root.value+ " ");
        printR(root.left);
    }
    public int count(){
        return 0;
    }
}
