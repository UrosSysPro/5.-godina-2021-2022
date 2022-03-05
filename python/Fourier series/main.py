import sys
sys.path.append(".")
from math import *
from turtle import Turtle
from Complex import Complex

def getFourierSet(x):
    N=len(x)
    X=[]
    for k in range(N):
        Xk=Complex(0,0)
        for n in range(N):
            ugao=-2*pi*k*n/N
            toAdd=Complex(x[n].re,x[n].im)
            toAdd.mul(Complex(cos(ugao),sin(ugao)))
            Xk.add(toAdd)
        Xk.re/=N
        Xk.im/=N
        X.append(Xk)
    return X
    
def drawFourierSet(X,n,t,min):
    xn=Complex(0,0)
    N=len(X)
    for k in range(N):
        if X[k].abs()<min:continue
        ugao=2*pi*k*n/N
        toAdd=Complex(X[k].re,X[k].im)
        toAdd.mul(Complex(cos(ugao),sin(ugao)))
        xn.add(toAdd)
    t.goto(xn.re,xn.im)
    return

def getArrayTrougao():
    pointA=Complex(-100,50)
    pointB=Complex(-100,-50)
    pointC=Complex(50,0)
    arr=[]
    for i in range(100):
        a=i/100
        x=a*pointB.re+(1-a)*pointA.re
        y=a*pointB.im+(1-a)*pointA.im
        arr.append(Complex(x,y))
    for i in range(100):
        a=i/100
        x=a*pointC.re+(1-a)*pointB.re
        y=a*pointC.im+(1-a)*pointB.im
        arr.append(Complex(x,y))
    
    for i in range(100):
        a=i/100
        x=a*pointA.re+(1-a)*pointC.re
        y=a*pointA.im+(1-a)*pointC.im
        arr.append(Complex(x,y))
     
    return arr


points=getArrayTrougao()
set=getFourierSet(points)

t=Turtle()

for n in range(len(points)):
    drawFourierSet(set,n,t,30)

input()