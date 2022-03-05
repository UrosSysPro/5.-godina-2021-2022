from turtle import *
from math import *

t=Turtle()
t.speed(10)

def circle(x,y,r):
    t.penup()
    t.setpos(x,y-r)
    t.pendown()
    t.circle(r)

def line(x1,y1,x2,y2):
    t.penup()
    t.setpos(x1,y1)
    t.pendown()
    t.setpos(x2,y2)


r1=100
r2=150

s1=1
s2=6

circle(0,0,r1)
circle(0,0,r2)


ugao=0
while ugao<pi*10:
    x1=cos(ugao*s1)*r1
    y1=sin(ugao*s1)*r1
    x2=cos(ugao*s2)*r2
    y2=sin(ugao*s2)*r2
    line(x1,y1,x2,y2)
    ugao+=0.2
