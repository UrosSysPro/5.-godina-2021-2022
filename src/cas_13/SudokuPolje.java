package cas_13;


import java.util.LinkedList;

public class SudokuPolje {

    public int value;
    public boolean[] moguceVrednosti;
    public boolean promenljivoPolje;

    public SudokuPolje(int value){
        this.value=value;
        moguceVrednosti=null;
        promenljivoPolje=true;
    }
    public SudokuPolje(int value,boolean promenljivoPolje){
        this.value=value;
        moguceVrednosti=null;
        this.promenljivoPolje=promenljivoPolje;
    }
}
