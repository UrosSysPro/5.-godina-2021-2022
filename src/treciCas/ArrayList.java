package treciCas;

import java.util.Arrays;

public class ArrayList {
    private int n;
    private int[] niz;

    public ArrayList(int n){
        this.n=n;
        niz=new int[n];
    }
    public ArrayList(){
        this.n=0;
        niz=new int[10];
    }
    public void add(int a){
        if(n<niz.length){
            niz[n]=a;
            n++;
        }else{
            int[] noviNiz= Arrays.copyOf(niz,niz.length*2);
            noviNiz[n]=a;
            n++;
            niz=noviNiz;
        }
    }
    public void remove(){
        n--;
    }
    public void set(int i,int a){
        if(i<n)niz[i]=a;
    }
    public int get(int i){
        if(i<n)return niz[i];
        return 0;
    }
    public int size(){
        return n;
    }
}
