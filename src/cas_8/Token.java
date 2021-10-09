package cas_8;

public class Token {
    public char operator;
    public int prioritet;
    public int value;

    public boolean isOperator;

    public Token(char operator){
        this.operator=operator;
        switch (operator){
            case '+':prioritet=1;break;
            case '-':prioritet=2;break;
            case '*':prioritet=3;break;
            case '/':prioritet=4;break;
        }
        isOperator=true;
    }
    public Token(int value){
        this.value=value;
        isOperator=false;
    }

}
