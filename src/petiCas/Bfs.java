package petiCas;

import java.io.File;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;

public class Bfs {
    private int[][] mat;
    private int m,n;

    public Bfs(String fileName){
        try {
            File f=new File(fileName);
            Scanner scanner=new Scanner(f);
            m=scanner.nextInt();
            n=scanner.nextInt();
            mat=new int[m][n];
            for(int i=0;i<m;i++){
                for(int j=0;j<n;j++) {
                    mat[i][j]=scanner.nextInt();
                }
            }
            scanner.close();
        }catch (Exception e){

        }
    }

    public void resi(int x,int y){
        Queue<Point> red=new LinkedList<Point>();
        mat[x][y]=0;
        red.add(new Point(x,y));

        while(red.isEmpty()==false){
            Point p=red.remove();
            if(p.x-1>=0&&mat[p.x-1][p.y]==-1){
                mat[p.x-1][p.y]=mat[p.x][p.y]+1;
                red.add(new Point(p.x-1,p.y));
            }
            if(p.y-1>=0&&mat[p.x][p.y-1]==-1){
                mat[p.x][p.y-1]=mat[p.x][p.y]+1;
                red.add(new Point(p.x,p.y-1));
            }
            if(p.x+1<m&&mat[p.x+1][p.y]==-1){
                mat[p.x+1][p.y]=mat[p.x][p.y]+1;
                red.add(new Point(p.x+1,p.y));
            }
            if(p.y+1<n&&mat[p.x][p.y+1]==-1){
                mat[p.x][p.y+1]=mat[p.x][p.y]+1;
                red.add(new Point(p.x,p.y+1));
            }
        }
    }

    public void ispis(){
        for(int i=0;i<m;i++){
            for(int j=0;j<n;j++) {
                if(mat[i][j]==-1){
                    System.out.print("   ");
                    continue;
                }
                if(mat[i][j]==-2){
                    System.out.print("  #");
                    continue;
                }
                System.out.print(" "+mat[i][j]/10+mat[i][j]%10);
            }
            System.out.println();
        }
    }

}
