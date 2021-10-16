package cas_10;

public class Heap {
    private int[] tree;
    private int n;

    public Heap(int brojRedova){
        n=0;
        tree=new int[(1<<brojRedova)-1];
    }
    public void add(int a){
        tree[n]=a;
        n++;
        int index=n-1;
        while(index>0){
            int parent=getParent(index);
            if(tree[parent]>tree[index]){
                int p=tree[parent];
                tree[parent]=tree[index];
                tree[index]=p;
                index=parent;
                continue;
            }
            break;
        }
    }
    public int remove(){
        int toReturn=tree[0];
        tree[0]=tree[n-1];
        n--;
        int index=0;
        while (index<n){
            int leftChild=getChildLeft(index);
            int rightChild=getChildRight(index);
            int nextIndex=leftChild;
            if(leftChild<n
                    &&rightChild<n
                    &&tree[rightChild]<tree[leftChild]){
                nextIndex=rightChild;
            }
            if(nextIndex>=n)break;
            if(tree[index]>tree[nextIndex]){
                int p=tree[index];
                tree[index]=tree[nextIndex];
                tree[nextIndex]=p;
                index=nextIndex;
                continue;
            }
            break;
        }
        return toReturn;
    }
    private int getParent(int index){
        return (index-1)/2;
    }
    private int getChildLeft(int index){
        return index*2+1;
    }
    private int getChildRight(int index){
        return index*2+2;
    }
    public void print(){
        for(int i=0;i<n;i++){
            System.out.print(tree[i]+" ");
        }
    }
}
