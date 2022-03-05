
import pygame
import sys
from pygame.locals import *
sys.path.append(".")
from simulacija import Simulation

s=Simulation(40,30,20)
# Initializing Pygame
pygame.init()
  
# Initializing surface
surface = pygame.display.set_mode((800,600))
  
# Initialing Color
color = (255,0,0)
  
# Drawing Rectangle
while True:
    for event in pygame.event.get():
        if event.type==QUIT:
            pygame.quit()
            sys.exit()
    s.draw(surface)
    # for j in range(100):
    #     for i in range(100):

    #         pygame.draw.rect(surface, color, pygame.Rect(i*2,j*2,1,1))
    pygame.display.update()

