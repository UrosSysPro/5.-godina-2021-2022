package drugiCas;

public class Kvadrat extends Mnogougao {
    public Kvadrat(float a){
        super(a);
    }

    @Override
    public float izracunajPovrsinu() {
        return a*a;
    }

    @Override
    public float izracunajObim() {
        return 4*a;
    }

    @Override
    public void draw() {
        for(int i=0;i<a;i++){
            for(int j=0;j<a;j++){
                System.out.print(" #");
            }
            System.out.println();
        }
    }
}
