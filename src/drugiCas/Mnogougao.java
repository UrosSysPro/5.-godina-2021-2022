package drugiCas;

public abstract class Mnogougao implements Drawable{
    public float a;

    public Mnogougao(float a){
        this.a=a;
    }

    public abstract float izracunajObim();

    public abstract float izracunajPovrsinu();
}
