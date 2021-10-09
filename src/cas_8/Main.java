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

//        int resenje=izracunaj(postfiksni);
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
            while ((!stack.isEmpty())&&stack.peek().prioritet>t.prioritet){
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
    public static int izracunaj(Token[] niz){
        return 0;
    }
}
