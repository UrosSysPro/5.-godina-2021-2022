from turtle import *
from math import *

def sq(i,n):
    sirina=1
    x=0
    y=0
    for j in range(n):
        k=i%4
        if k==0:
            x,y=y,x
        if k==1:
            y+=sirina
        if k==2:
            x+=sirina
            y+=sirina
        if k==3:
            x=sirina/2-x
            y=sirina/2-y
            x+=sirina
            
        i=int(i/4)
        sirina=sirina*2
    return (x,y)


t=Turtle()
t.speed(1)
a=20

n=2

for i in range(1<<(2*n)):
    print(i)
    tacka=sq(i,n)
    t.setpos(tacka[0]*a,tacka[1]*a)



input()