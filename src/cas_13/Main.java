package cas_13;

public class Main {
    public static void main(String[] args) {
        Sudoku s=new Sudoku("sudoku.txt");
        s.brojac=0;
        s.complete(0,0);
        System.out.println(s.brojac);
        s.ispis2();
    }
}
