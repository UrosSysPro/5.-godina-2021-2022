import sys
from turtle import Turtle
from math import *
sys.path.append(".")

from Complex import Complex


def getFourierSeries(x):
    X=[]
    N=len(x)
    for n in range(N):
        Xn=Complex(0,0)
        for k in range(N):
            ugao=float(2)*pi*k*n/N
            c=Complex(cos(ugao),-sin(ugao))
            Xn.add(Complex.mul(x[n],c))
        X.append(Xn)
    return X

def drawFourierSeries(X,n,t):
    xn=Complex(0,0)
    N=len(set)
    for k in range(N):
        ugao=2*pi*k*n/N
        c=Complex(cos(ugao),sin(ugao))
        xn.add(Complex.mul(X[k],c))
    
    return xn


def squareArray():
    array=[]
    for i in range(100):
        re=-100
        im=100-i*2
        array.append(Complex(re,im))
    for i in range(100):
        re=-100+i*2
        im=-100
        array.append(Complex(re,im))
    for i in range(100):
        re=100
        im=-100+i*2
        array.append(Complex(re,im))
    for i in range(100):
        re=100-i*2
        im=100
        array.append(Complex(re,im))
    return array

arr=squareArray()
t=Turtle()

set=getFourierSeries(arr)

for i in range(len(arr)):
    xn=drawFourierSeries(set,i,t)
    print(set[i].re)
input()