package cas_17;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner scan=new Scanner(System.in);
        String string=scan.nextLine();
//        System.out.println(proveriZagrade(string));
//        ispisiSveKombinacije("",string);
        int f=faktorijal(string.length());
        for(int i=0;i<f;i++){
            System.out.println(itaKombinacijaIterativno(i,string));
        }
    }
    public static boolean proveriZagrade(String string){
        int brojOtvorenih=0;
        for(int i=0;i<string.length();i++){
            char c=string.charAt(i);
            if(c=='(')
                brojOtvorenih++;
            else
                brojOtvorenih--;
            if(brojOtvorenih<0)return false;
        }
        return brojOtvorenih==0;
    }
    public static void ispisiSveKombinacije(String prefix,String string){
        if(string.length()==0){
            System.out.println(prefix);
            return;
        }
        for(int i=0;i<string.length();i++){
            String newPrefix=prefix+string.charAt(i);
            String newString=string.substring(0,i)
                    +string.substring(i+1);

            ispisiSveKombinacije(newPrefix,newString);
        }
    }
    public static String itaKombinacija(int n,String characters,int f){
        int len=characters.length();
        if(len==1)return characters;
        f/=len;
        char trChar=characters.charAt(n/f);
        characters=characters.substring(0,n/f)+characters.substring(n/f+1);
        return trChar+itaKombinacija(n%f,characters,f);

    }
    public static String itaKombinacijaIterativno(int n,String characters){
        int len=characters.length();
        String rezultat="";
        int f=faktorijal(len);
        while(len!=0){
            f/=len;
            rezultat+=characters.charAt(n/f);
            characters=characters.substring(0,n/f)+characters.substring(n/f+1);
            len--;
            n=n%f;
        }
        return rezultat;
    }
    public static int faktorijal(int n){
        int f=1;
        for(int i=2;i<=n;i++){
            f*=i;
        }
        return f;
    }

}
