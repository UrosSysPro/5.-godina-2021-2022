package cas_15;

public class Main {
    public static void main(String[] args) throws Exception{
        char[][] screen=new char[40][40];
        obrisiEkran(screen);
//        nacrtajKrug(screen,20,20,10);
        nacrtajTrougao(screen,3,7,27,5,40,32,'#');
        nacrtajTrougao(screen,3,7,27,30,40,32,'8');
        nacrtaj(screen);
    }

    public static void nacrtajTrougao(char[][] screen,int x1,int y1,int x2,int y2,int x3,int y3,char c){
        int px=x1,kx=x1,py=y1,ky=y1;
        if(x2<px)px=x2;
        if(x3<px)px=x3;
        if(y2<py)py=y2;
        if(y3<py)py=y3;
        if(x2>kx)kx=x2;
        if(x3>kx)kx=x3;
        if(y2>ky)ky=y2;
        if(y3>ky)ky=y3;

        double p=povrsinaTrougla(x1,y1,x2,y2,x3,y3);

        for(int j=py;j<=ky;j++){
            for(int i=px;i<=kx;i++){
                if(i<0||i>=screen.length)continue;
                if(j<0||j>=screen[0].length)continue;
                double p1=povrsinaTrougla(i,j,x2,y2,x3,y3);
                double p2=povrsinaTrougla(i,j,x1,y1,x3,y3);
                double p3=povrsinaTrougla(i,j,x2,y2,x1,y1);
                double up=p1+p2+p3;
                if(Math.abs(p-up)<=1)screen[i][j]=c;
            }
        }
    }
    public static double povrsinaTrougla(int x1,int y1,int x2,int y2,int x3,int y3){
        double a=Math.sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2));
        double b=Math.sqrt((x1-x3)*(x1-x3)+(y1-y3)*(y1-y3));
        double c=Math.sqrt((x3-x2)*(x3-x2)+(y3-y2)*(y3-y2));
        double s=(a+b+c)/2;
        double p=Math.sqrt(s*(s-a)*(s-b)*(s-c));
        return p;
    }
    public static void nacrtajKrug(char[][] screen,int x,int y,int r){
        for(int j=-r;j<=r;j++){
            for(int i=-r;i<=r;i++){
                if(x+i<0||x+i>=screen.length)continue;
                if(y+j<0||y+j>=screen[0].length)continue;
                double tr=Math.sqrt(i*i+j*j);
                if(tr<=r)screen[x+i][y+j]='#';
            }
        }
    }
    public static void obrisiEkran(char[][] screen){
        for(int j=0;j<screen[0].length;j++) {
            for (int i = 0; i < screen.length; i++) {
                screen[i][j]=' ';
            }
        }
    }
    public static void nacrtaj(char[][] screen){
        for(int j=0;j<screen[0].length;j++) {
            for (int i = 0; i < screen.length; i++) {
                System.out.print(" "+screen[i][j]);
            }
            System.out.println();
        }
    }
}
