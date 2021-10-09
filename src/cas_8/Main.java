package cas_8;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Scanner;
import java.util.Stack;

public class Main {
    public static void main(String[] args) {
        Scanner s=new Scanner(System.in);
        String izraz=s.nextLine();
        Token[] postfiksni=prebaciUPostfiksni(izraz);
        for(int i=0;i<postfiksni.length;i++){
            if(postfiksni[i].isOperator){
                System.out.print(postfiksni[i].operator+" ");
            }else{
                System.out.print(postfiksni[i].value+" ");
            }
        }
        System.out.println();
        int resenje=izracunaj(postfiksni,0,postfiksni.length-1);
        System.out.println();
        System.out.println(resenje);
    }

    public static LinkedList<Token> podeliIzraz(String izraz){
        LinkedList<Token> list=new LinkedList<>();

        for(int i=0;i<izraz.length();i++){
            char c=izraz.charAt(i);
            if(Character.isDigit(c)){
                int n=0;
                while(i<izraz.length()){
                    c=izraz.charAt(i);
                    if(!Character.isDigit(c)){
                        i--;
                        break;
                    }
                    n*=10;
                    n+=Integer.parseInt(c+"");
                    i++;
                }
                list.add(new Token(n));
            }else{
                list.add(new Token(c));
            }
        }

        return list;
    }

    public static Token[] prebaciUPostfiksni(String izraz){

        LinkedList<Token> list=podeliIzraz(izraz);
        Token[] resenje=new Token[list.size()];
        Stack<Token> stack=new Stack<>();

        int i=0;

        while(!list.isEmpty()){
            Token t=list.removeFirst();
            if(t.isOperator==false){
                resenje[i]=t;
                i++;
                continue;
            }
            if(stack.isEmpty()||stack.peek().prioritet<t.prioritet){
                stack.push(t);
                continue;
            }
            while ((!stack.isEmpty())&&stack.peek().prioritet>=t.prioritet){
                resenje[i]=stack.pop();
                i++;
            }
            stack.push(t);
        }
        while (!stack.isEmpty()){
            resenje[i]=stack.pop();
            i++;
        }
        return resenje;
    }

    public static int izracunaj(Token[] niz,int pocetak,int kraj){
        if(pocetak==kraj)return niz[pocetak].value;
        if(kraj-pocetak==2){
            return izracunaj3(niz[pocetak+2].operator,niz[pocetak].value,niz[pocetak+1].value);
        }
        int podela=podeli(niz,kraj);
        int v1=izracunaj(niz,pocetak,podela-1);
        int v2=izracunaj(niz,podela,kraj-1);
        int v=izracunaj3(niz[kraj].operator,v1,v2);
        System.out.print(v+" ");
        return v;
    }
    public static int izracunaj3(char operator,int value1,int value2){
        if(operator=='/')return value1/value2;
        if(operator=='*')return value1*value2;
        if(operator=='-')return value1-value2;
        if(operator=='+')return value1+value2;
        return 0;
    }
    public static int podeli(Token[]niz ,int kraj){
        kraj--;
        int brojOperatora=0;
        int brojBrojeva=0;
        while (kraj>0){
            if(niz[kraj].isOperator){
                brojOperatora++;
            }else{
                brojBrojeva++;
            }
            if(brojBrojeva==brojOperatora+1)return kraj;
            kraj--;
        }
        return 0;
    }
}
