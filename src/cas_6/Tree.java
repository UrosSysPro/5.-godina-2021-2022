package cas_6;

public class Tree {
    private Node root;
    private Node neBalansiran;

    public Tree(){
        root=null;
    }
    public void add(int a){
        Node n=new Node(a);
        if(root==null){
            root=n;
            return;
        }
        addR(root,n);
        neBalansiran=null;
        updateHeights();
        if(neBalansiran!=null)balans(neBalansiran,n.value);
    }

    private void addR(Node root,Node n){
        if(n.value>root.value){
            if(root.right==null){
                root.right=n;
            }else{
                addR(root.right,n);
            }
        }else{
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
        printR(root.left);
        System.out.print(root.value+" ");
        printR(root.right);
    }

    public int updateHeights(){
        return updateHeightsR(root);
    }
    private int updateHeightsR(Node root){
        if(root==null)return 0;
        int hLeft=updateHeightsR(root.left);
        int hRight=updateHeightsR(root.right);

        if(Math.abs(hLeft-hRight)>1&&neBalansiran==null){
            neBalansiran=root;
        }

        return hRight>hLeft?hRight+1:hLeft+1;
    }

    private void balans(Node neBalansiran,int value){
        Node A=neBalansiran;
        Node B=value>A.value?A.right:A.left;
        Node C=value>B.value?B.right:B.left;
        if(A.value<B.value&&B.value<C.value){
            
        }

    }
}
