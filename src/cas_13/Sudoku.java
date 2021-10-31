package cas_13;

import java.io.File;
import java.util.Scanner;

public class Sudoku {
    private SudokuPolje[][] tabela;
    private Scanner scan;
    public int brojac;

    public Sudoku(String fileName){
        scan=new Scanner(System.in);
        try{
            tabela=new SudokuPolje[9][9];
            File file=new File(fileName);
            Scanner scanner=new Scanner(file);
            for(int j=0;j<9;j++){
                for(int i=0;i<9;i++){
                    int value=scanner.nextInt();
                    tabela[i][j]=new SudokuPolje(value,value==0);
                }
            }
        }catch (Exception e){

        }
    }

    public void ispis(){
        for(int j=0;j<9;j++){
            for(int i=0;i<9;i++){
                System.out.print(tabela[i][j].value+" ");
            }
            System.out.println();
        }
    }

    public boolean complete2(){
        for(int j=0;j<9;j++){
            for(int i=0;i<9;i++){
                boolean[] moguceVrednosti=odrediMoguceVrednosti(i,j);
                boolean nestoUpisano=false;
                for(int k=0;k<moguceVrednosti.length;k++) {
                    if (moguceVrednosti[k]) {
                        nestoUpisano=true;
                        tabela[i][j].value = k + 1;
                        break;
                    }
                }
                if(!nestoUpisano){
                    System.out.println("nista nije upisano "+i +" "+j);
                }
            }
        }

        return true;
    }

    public boolean complete(int x,int y){
        brojac++;
        if(x>=9||y>=9){
            return true;
        };
        int ny=y+(x+1)/9;
        int nx=(x+1)%9;
        if(tabela[x][y].promenljivoPolje==false){
            return complete(nx,ny);
        }
        boolean[] moguceVrednosti=odrediMoguceVrednosti(x,y);
        for(int i=0;i<moguceVrednosti.length;i++){
            if(moguceVrednosti[i]){
                tabela[x][y].value=i+1;
                if(complete(nx,ny)){
                    return true;
                };
                tabela[x][y].value=0;
            }
        }
        return false;
    }

    public boolean pravilnoPopunjen(){


        return true;
    }
    public void ispis2(){
        for(int k=0;k<11;k++) System.out.print("--");
        System.out.println();
        for(int j=0;j<9;j++){
            System.out.print("|");
            for(int i=0;i<9;i++){
                System.out.print(" "+tabela[i][j].value);
                if((i+1)%3==0) System.out.print("|");
            }
            if((j+1)%3==0){
                System.out.println();
                for(int k=0;k<11;k++) System.out.print("--");
            }
            System.out.println();
        }
    }

    public boolean[] odrediMoguceVrednosti(int x,int y){
        boolean[] moguceVrednosti=new boolean[]{
                true,true,true,
                true,true,true,
                true,true,true
        };
        for(int i=0;i<9;i++){
            if(tabela[x][i].value!=0){
                moguceVrednosti[tabela[x][i].value-1]=false;
            }
            if(tabela[i][y].value!=0){
                moguceVrednosti[tabela[i][y].value-1]=false;
            }
        }
        int px=x/3;
        int py=y/3;
        px*=3;
        py*=3;
        for(int i=0;i<3;i++){
            for(int j=0;j<3;j++){
                if(tabela[px+i][py+j].value!=0){
                    moguceVrednosti[tabela[px+i][py+j].value-1]=false;
                }
            }
        }

        return  moguceVrednosti;
    }
}
