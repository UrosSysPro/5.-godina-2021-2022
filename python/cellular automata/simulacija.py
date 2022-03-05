
import pygame
import sys
from pygame.locals import *

class Simulation:
    def __init__(self,w,h,cellSize):
        self.cellSize=cellSize
        self.w=w
        self.h=h
        self.mat=[]
        for i in range(w):
            self.mat.append([])
            for j in range(h):
                self.mat[i].append(0)
        self.nextMat=[]
        for i in range(w):
            self.nextMat.append([])
            for j in range(h):
                self.nextMat[i].append(0)
    
    def step(self):
        return 

    def draw(self,surface):
        color=(255,255,255)
        width=self.w*self.cellSize
        height=self.h*self.cellSize
        pygame.draw.rect(surface, color, pygame.Rect(0,0,width,height))

        for i in range(self.w):
            for j in range(self.h):
                
                color=(255,255,255)
                if self.mat[i][j]==1: color=(0,0,0)
                if self.mat[i][j]==2: color=(0,0,0)
                x=i*self.cellSize
                y=j*self.cellSize
                size=self.cellSize
                pygame.draw.rect(surface, color, pygame.Rect(x,y,size,size))

        return
        