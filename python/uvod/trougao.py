import math
import sys, pygame
from math import *
from random import randint
pygame.init()

size = width, height = 800, 600

screen = pygame.display.set_mode(size)
screen.fill((255,255,255))


# pygame.draw.circle(screen, (100,200,50), (160,120), 20)

tacke=[]
n=4
precnik=200
for i in range(n):
    x=cos(pi*2*i/n)*precnik+width/2
    y=sin(pi*2*i/n)*precnik+height/2
    tacke.append((x,y))
    pygame.draw.circle(screen, (100,200,50), tacke[i], 2)

x=randint(width/2-precnik,width/2+precnik)
y=randint(height/2-precnik,height/2+precnik)

trenutno=(x,y)
pygame.draw.circle(screen, (100,200,50), trenutno, 2)


pygame.display.flip()

prIndex=0

while 1:
    for event in pygame.event.get():
        if event.type == pygame.QUIT: sys.exit()
    for i in range(10):
        while 1:
            slIndex=randint(0,n-1)
            if slIndex!=prIndex:
                prIndex=slIndex
                break
        x=trenutno[0]/2+tacke[slIndex][0]/2
        y=trenutno[1]/2+tacke[slIndex][1]/2
        trenutno=(x,y)
        pygame.draw.circle(screen, (100,200,50), trenutno, 1)
    pygame.display.flip()

    # screen.fill(black)
    # pygame.display.flip()