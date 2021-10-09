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
        Node B=value>=A.value?A.right:A.left;
        Node C=value>=B.value?B.right:B.left;

        Node nA=new Node(A.value);
        Node nB=new Node(B.value);
        Node nC=new Node(C.value);

        if(B.value>A.value&&C.value>B.value){
            nA.left=A.left;
            nA.right=B.left;

            nB.left=nA;
            nB.right=nC;

            nC.left=C.left;
            nC.right=C.right;

            A.value=nB.value;
            A.left=nB.left;
            A.right=nB.right;
        }
        if(B.value>A.value&&C.value<B.value){
            nC.left=nA;
            nC.right=nB;

            nA.left=A.left;
            nA.right=C.left;

            nB.left=C.right;
            nB.right=B.right;

            A.value=nC.value;
            A.right=nC.right;
            A.left=nC.left;
        }
        if(B.value<A.value&&C.value<B.value){
            nB.left=nC;
            nB.right=nA;

            nC.left=C.left;
            nC.right=C.right;

            nA.left=B.right;
            nA.right=A.right;

            A.value=nB.value;
            A.right=nB.right;
            A.left= nB.left;
        }
        if(B.value<A.value&&C.value>B.value){
            nC.left=nB;
            nC.right=nA;

            nB.left=B.left;
            nB.right=C.left;

            nA.left= C.right;
            nA.right=A.right;

            A.value=nC.value;
            A.right=nC.right;
            A.left= nC.left;
        }
    }

    public void printHeights(){
        calcHeightsR(root);
        printHeightsR(root);
    }
    private int calcHeightsR(Node root){
        if(root==null)return 0;
        int hl=calcHeightsR(root.left);
        int hr=calcHeightsR(root.right);
        int h=hl>hr?hl+1:hr+1;
        root.h=h;
        return h;
    }
    public void printHeightsR(Node root){
        if(root==null)return;
        printHeightsR(root.left);
        System.out.print(root.h+" ");
        printHeightsR(root.right);
    }
}
