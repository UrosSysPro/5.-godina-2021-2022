package prviCas;

public class Lopta {
    public String boja;
    public float precnik;
    public static int brojLopti=0;
    public Lopta(String boja,float precnik){
        brojLopti++;
        this.boja=boja;
        this.precnik=precnik;
    }

    public static float izracunajZapreminu(float precnik){
        return (float) (4f/3f*Math.PI*precnik*precnik*precnik);
    }

    public float izracunajZapreminu(){
        return (float) (4f/3f*Math.PI*precnik*precnik*precnik);
    }

    public float izracunajPovrsinu(){
        return (float) (4*precnik*precnik*Math.PI);
    }
}
