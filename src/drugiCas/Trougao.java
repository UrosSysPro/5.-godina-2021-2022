package drugiCas;

public class Trougao extends Mnogougao {

    public Trougao(float a){
        super(a);
    }

    @Override
    public float izracunajObim() {
        return 3*a;
    }

    @Override
    public float izracunajPovrsinu() {
        return (float)(Math.sqrt(3)/4*a*a);
    }

    @Override
    public void draw() {

    }
}
